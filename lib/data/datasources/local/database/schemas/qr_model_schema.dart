  import 'package:flutter_cubit_freezed_getit_codebase/core/constants/constants.dart';

  const qrModelSchema = '''
    CREATE TABLE ${Constants.qrModelTabelName} (
      id TEXT PRIMARY KEY,
      rawJsonData TEXT NOT NULL,
      createdAt TEXT NOT NULL,
      updatedAt TEXT NOT NULL
    )
  ''';