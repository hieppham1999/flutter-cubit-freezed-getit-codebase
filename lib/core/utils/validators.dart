/// Form-field validators returning `null` on success or an error message on
/// failure. Compatible with `TextFormField.validator`.
typedef Validator = String? Function(String? value);

class Validators {
  Validators._();

  static final RegExp _emailRegex = RegExp(
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$",
  );

  static final RegExp _phoneRegex = RegExp(r'^\+?[0-9]{8,15}$');

  static final RegExp _urlRegex = RegExp(
    r'^(https?:\/\/)?([\w.-]+)\.([a-z]{2,})(\/[^\s]*)?$',
    caseSensitive: false,
  );

  static Validator notEmpty({String message = 'This field is required'}) {
    return (value) => (value == null || value.trim().isEmpty) ? message : null;
  }

  static Validator email({String message = 'Invalid email'}) {
    return (value) {
      if (value == null || value.isEmpty) return null;
      return _emailRegex.hasMatch(value) ? null : message;
    };
  }

  static Validator phone({String message = 'Invalid phone number'}) {
    return (value) {
      if (value == null || value.isEmpty) return null;
      return _phoneRegex.hasMatch(value.replaceAll(RegExp(r'\s|-'), ''))
          ? null
          : message;
    };
  }

  static Validator url({String message = 'Invalid URL'}) {
    return (value) {
      if (value == null || value.isEmpty) return null;
      return _urlRegex.hasMatch(value) ? null : message;
    };
  }

  static Validator minLength(int length, {String? message}) {
    return (value) {
      if (value == null || value.isEmpty) return null;
      return value.length < length
          ? (message ?? 'Must be at least $length characters')
          : null;
    };
  }

  static Validator maxLength(int length, {String? message}) {
    return (value) {
      if (value == null || value.isEmpty) return null;
      return value.length > length
          ? (message ?? 'Must be at most $length characters')
          : null;
    };
  }

  /// Runs validators in order and returns the first non-null error message.
  static Validator combine(List<Validator> validators) {
    return (value) {
      for (final validator in validators) {
        final error = validator(value);
        if (error != null) return error;
      }
      return null;
    };
  }
}
