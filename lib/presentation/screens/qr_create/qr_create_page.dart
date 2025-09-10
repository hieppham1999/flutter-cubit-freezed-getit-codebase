import 'package:flutter/material.dart';
import 'package:flutter_cubit_freezed_getit_codebase/base/bloc_state_builder.dart';
import 'package:flutter_cubit_freezed_getit_codebase/core/languages.dart';
import 'package:flutter_cubit_freezed_getit_codebase/data/model/qr_model/qr_model.dart';
import 'package:flutter_cubit_freezed_getit_codebase/di/injection.dart';
import 'package:flutter_cubit_freezed_getit_codebase/navigation/app_navigator.dart';
import 'package:flutter_cubit_freezed_getit_codebase/navigation/app_routes.dart';
import 'package:flutter_cubit_freezed_getit_codebase/presentation/screens/qr_create/components/qr_customization.dart';
import 'package:flutter_cubit_freezed_getit_codebase/presentation/screens/qr_create/qr_create_cubit.dart';
import 'package:flutter_cubit_freezed_getit_codebase/presentation/screens/qr_create/qr_create_state.dart';
import 'package:flutter_cubit_freezed_getit_codebase/presentation/widgets/app_dialog.dart';
import 'package:flutter_cubit_freezed_getit_codebase/presentation/widgets/app_scaffold.dart';
import 'package:flutter_cubit_freezed_getit_codebase/presentation/widgets/app_textfield.dart';
import 'package:flutter_cubit_freezed_getit_codebase/presentation/widgets/read_only_text_box.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCreatePage extends StatefulWidget {
  const QrCreatePage({super.key});

  @override
  State<QrCreatePage> createState() => _QrCreatePageState();
}

class _QrCreatePageState extends State<QrCreatePage> {
  final cubit = getIt.get<QrCreateCubit>();
  final TextEditingController textEditingController = TextEditingController();

  bool isContentEditable = true;
  bool isQrShow = false;


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text(Languages.translate.createQr),
        actions: [
          IconButton(
            onPressed: () {
              NavController.pushNamed(SettingsRoute());
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: CubitStateBuilder<QrCreateState>(
        cubit: cubit,
        builder: (stateContext, state) {
          final qrModel = state.qrModel;

          return AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
            onEnd: () {
              setState(() {
                isQrShow = true;
              });
            },
            alignment:
                qrModel.content?.isNotEmpty ?? false
                    ? Alignment.topCenter
                    : Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (qrModel.type == QrType.clone &&
                    qrModel.originalContent?.isNotEmpty == true)
                  ReadOnlyTextBox(
                    text: qrModel.originalContent ?? '',
                    margin: EdgeInsets.only(bottom: 8),
                  ),
                _buildQrContentInput(),

                if (isQrShow)
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              Languages.translate.preview,
                              style: TextTheme.of(context).titleLarge,
                            ),
                          ),

                          Tooltip(
                            message: qrModel.content ?? 'QR',
                            child: QrImageView(
                              data: qrModel.content ?? '',
                              version: qrModel.version,
                              eyeStyle: qrModel.eyeStyle.toLib(),
                              dataModuleStyle: qrModel.moduleStyle.toLib(),
                              embeddedImageEmitsError: true,
                              size: MediaQuery.of(context).size.width * 0.7,
                              backgroundColor: qrModel.backgroundColor,
                            ),
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: ElevatedButton(
                                  onPressed: () async {
                                    final customized = await customizeQr(
                                      qrModel,
                                    );
                                    if (customized != null) {
                                      cubit.updateQrStyle(customized);
                                    }
                                  },
                                  child: Text(
                                    '${Languages.translate.customize}...',
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              Flexible(
                                child: ElevatedButton(
                                  onPressed: () => cubit.resetQrStyle(),
                                  child: Text(Languages.translate.reset),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildQrContentInput() {
    return AppTextField(
      controller: textEditingController,
      isReadOnly: !isContentEditable,
      onSubmit: (value) => onSubmit(value),
      suffixIcon: IconButton(
        icon: Icon(
          isContentEditable ? Icons.check : Icons.edit,
          color: isContentEditable ? Colors.blue : Colors.grey,
        ),
        onPressed: () {
          if (isContentEditable) {
            onSubmit(textEditingController.text);
          } else {
            setEditable(!isContentEditable);
          }
        },
        tooltip: isContentEditable ? 'Submit' : 'Edit',
      ),
    );
  }

  Future<QrModel?> customizeQr(QrModel current) {
    QrModel _current = current.copyWith();
    return showDialog<QrModel>(
      context: context,
      builder:
          (_) => AppDialog(
            title: Languages.translate.qrCustomizations,
            body: QrCustomization(
              initModel: _current,
              onChanged: (model) {
                _current = model;
              },
            ),
            positiveText: Languages.translate.buttonSelect,
            negativeText: Languages.translate.buttonCancel,
            returnResultValue: () => _current,
          ),
    );
  }

  void setEditable(bool editable) {
    setState(() {
      isContentEditable = editable;
    });
  }

  void onSubmit(String data) {
    if (data.isNotEmpty) {
      setEditable(false);
      cubit.updateQrData(data);
    }
  }
}
