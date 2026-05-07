import 'app_state.dart';

/// Builds a single-line, field-level diff between two [CubitState]s for log
/// output. Pulled out of `BaseCubit` so the cubit only orchestrates state and
/// the parsing lives in one place.
class StateDiffLogger {
  StateDiffLogger._();

  static const int _maxInlineValueLength = 80;

  /// Returns a diff string, or `null` when the two states are equal in the
  /// dimensions we care about (runtime type, data, error message).
  static String? buildDiff<T>(CubitState<T> oldState, CubitState<T> newState) {
    final stateTypeChanged = oldState.runtimeType != newState.runtimeType;
    final dataFieldDiff = _diffFreezedToString(
      oldState.data?.toString() ?? 'null',
      newState.data?.toString() ?? 'null',
    );
    final errorMessageDiff = _diffErrorMessage(oldState, newState);
    if (!stateTypeChanged &&
        dataFieldDiff.isEmpty &&
        errorMessageDiff == null) {
      return null;
    }

    final diffParts = <String>[];
    if (stateTypeChanged) {
      diffParts.add('${oldState.runtimeType} -> ${newState.runtimeType}');
    }
    if (errorMessageDiff != null) diffParts.add(errorMessageDiff);
    dataFieldDiff.forEach((fieldPath, change) {
      diffParts.add('$fieldPath: $change');
    });
    return diffParts.join(', ');
  }

  static String? _diffErrorMessage<T>(
    CubitState<T> oldState,
    CubitState<T> newState,
  ) {
    final oldMessage = oldState is ErrorState<T> ? oldState.error.message : null;
    final newMessage = newState is ErrorState<T> ? newState.error.message : null;
    if (oldMessage == newMessage) return null;
    return 'message: ${_formatValue(oldMessage ?? '-')} '
        '-> ${_formatValue(newMessage ?? '-')}';
  }

  static Map<String, String> _diffFreezedToString(
    String oldString,
    String newString,
  ) {
    if (oldString == newString) return const {};

    final oldFields = _parseFreezedToString(oldString);
    final newFields = _parseFreezedToString(newString);
    if (oldFields == null || newFields == null) {
      return {
        'data': '${_formatValue(oldString)} -> ${_formatValue(newString)}',
      };
    }

    final allFieldNames = <String>{...oldFields.keys, ...newFields.keys};
    final diff = <String, String>{};
    for (final fieldName in allFieldNames) {
      final oldValue = oldFields[fieldName];
      final newValue = newFields[fieldName];
      if (oldValue == newValue) continue;

      if (oldValue != null &&
          newValue != null &&
          _haveSameClassName(oldValue, newValue)) {
        final nestedDiff = _diffFreezedToString(oldValue, newValue);
        if (nestedDiff.isNotEmpty) {
          nestedDiff.forEach((nestedField, nestedChange) {
            diff['$fieldName.$nestedField'] = nestedChange;
          });
          continue;
        }
      }

      if (oldValue != null &&
          newValue != null &&
          _isListLiteral(oldValue) &&
          _isListLiteral(newValue)) {
        final listDiff = _diffListLiteral(oldValue, newValue);
        if (listDiff.isNotEmpty) {
          listDiff.forEach((indexPath, indexChange) {
            diff['$fieldName$indexPath'] = indexChange;
          });
          continue;
        }
      }
      diff[fieldName] =
          '${_formatValue(oldValue ?? '-')} -> ${_formatValue(newValue ?? '-')}';
    }
    return diff;
  }

  static bool _isListLiteral(String value) =>
      value.startsWith('[') && value.endsWith(']');

  static Map<String, String> _diffListLiteral(
    String oldListLiteral,
    String newListLiteral,
  ) {
    final oldElements = _splitTopLevel(
      oldListLiteral.substring(1, oldListLiteral.length - 1),
      separator: ',',
    ).map((e) => e.trim()).toList();
    final newElements = _splitTopLevel(
      newListLiteral.substring(1, newListLiteral.length - 1),
      separator: ',',
    ).map((e) => e.trim()).toList();

    if (oldElements.length != newElements.length) {
      return {
        '': '${_formatValue(oldListLiteral)} -> ${_formatValue(newListLiteral)}',
      };
    }

    final diff = <String, String>{};
    for (var index = 0; index < oldElements.length; index++) {
      final oldElement = oldElements[index];
      final newElement = newElements[index];
      if (oldElement == newElement) continue;

      if (_haveSameClassName(oldElement, newElement)) {
        final nestedDiff = _diffFreezedToString(oldElement, newElement);
        if (nestedDiff.isNotEmpty) {
          nestedDiff.forEach((nestedField, nestedChange) {
            diff['[$index].$nestedField'] = nestedChange;
          });
          continue;
        }
      }
      diff['[$index]'] =
          '${_formatValue(oldElement)} -> ${_formatValue(newElement)}';
    }
    return diff;
  }

  static bool _haveSameClassName(
    String firstToString,
    String secondToString,
  ) {
    final firstParenIndex = firstToString.indexOf('(');
    final secondParenIndex = secondToString.indexOf('(');
    if (firstParenIndex <= 0 || secondParenIndex <= 0) return false;
    if (!firstToString.endsWith(')') || !secondToString.endsWith(')')) {
      return false;
    }
    return firstToString.substring(0, firstParenIndex) ==
        secondToString.substring(0, secondParenIndex);
  }

  static Map<String, String>? _parseFreezedToString(String freezedToString) {
    final openParenIndex = freezedToString.indexOf('(');
    if (openParenIndex <= 0 || !freezedToString.endsWith(')')) return null;

    final body = freezedToString.substring(
      openParenIndex + 1,
      freezedToString.length - 1,
    );
    if (body.isEmpty) return const {};

    final rawFields = _splitTopLevel(body, separator: ',');
    final parsedFields = <String, String>{};
    for (final rawField in rawFields) {
      final colonIndex = rawField.indexOf(':');
      if (colonIndex <= 0) return null;
      final fieldName = rawField.substring(0, colonIndex).trim();
      final fieldValue = rawField.substring(colonIndex + 1).trim();
      if (fieldName.isEmpty) return null;
      parsedFields[fieldName] = fieldValue;
    }
    return parsedFields;
  }

  static List<String> _splitTopLevel(
    String input, {
    required String separator,
  }) {
    final segments = <String>[];
    final currentSegment = StringBuffer();
    var bracketDepth = 0;
    for (var i = 0; i < input.length; i++) {
      final character = input[i];
      if (character == '(' || character == '[' || character == '{') {
        bracketDepth++;
      } else if (character == ')' || character == ']' || character == '}') {
        bracketDepth--;
      }
      if (character == separator && bracketDepth == 0) {
        segments.add(currentSegment.toString());
        currentSegment.clear();
      } else {
        currentSegment.write(character);
      }
    }
    if (currentSegment.isNotEmpty) segments.add(currentSegment.toString());
    return segments;
  }

  static String _formatValue(String value) {
    if (value.length <= _maxInlineValueLength) return value;
    if (value.startsWith('[') && value.endsWith(']')) {
      final itemCount = _countTopLevelElements(
        value.substring(1, value.length - 1),
      );
      return '[$itemCount items]';
    }
    if (value.startsWith('{') && value.endsWith('}')) {
      final entryCount = _countTopLevelElements(
        value.substring(1, value.length - 1),
      );
      return '{$entryCount entries}';
    }
    return '${value.substring(0, _maxInlineValueLength - 3)}...';
  }

  static int _countTopLevelElements(String collectionBody) {
    if (collectionBody.isEmpty) return 0;
    return _splitTopLevel(collectionBody, separator: ',').length;
  }
}
