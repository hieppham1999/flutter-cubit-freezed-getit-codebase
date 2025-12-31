import 'package:flutter/material.dart';
import 'package:flutter_cubit_freezed_getit_codebase/core/constants/enums.dart';
import 'package:flutter_cubit_freezed_getit_codebase/presentation/base/bloc_state_builder.dart';
import 'package:flutter_cubit_freezed_getit_codebase/core/theme/languages.dart';
import 'package:flutter_cubit_freezed_getit_codebase/domain/entities/app_settings/app_settings.dart';
import 'package:flutter_cubit_freezed_getit_codebase/core/di/injection.dart';
import 'package:flutter_cubit_freezed_getit_codebase/presentation/screens/app_setting/app_setting_cubit.dart';
import 'package:flutter_cubit_freezed_getit_codebase/presentation/widgets/app_dropdown.dart';
import 'package:flutter_cubit_freezed_getit_codebase/presentation/widgets/app_scaffold.dart';
import 'package:flutter_cubit_freezed_getit_codebase/presentation/widgets/app_tile.dart';
import 'package:flutter_cubit_freezed_getit_codebase/presentation/widgets/color_picker_dot.dart';

class AppSettingPage extends StatefulWidget {
  const AppSettingPage({super.key});

  @override
  State<AppSettingPage> createState() => _AppSettingPageState();
}

class _AppSettingPageState extends State<AppSettingPage> {

  final cubit = getIt.get<SettingsCubit>();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text(Languages.translate.settings),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CubitStateBuilder<AppSettings>(
          cubit: cubit,
          builder: (_, state) {
            return Column(
              children: [
                AppTile(
                  label: Languages.translate.language,
                  trailing: AppDropdown<AppLanguage>(
                    items: AppLanguage.values,
                    value: state.language,
                    onChanged: (AppLanguage? value) {
                      if (value == null) return;
                      cubit.changeLocale(value);
                      },
                    itemBuilder: (AppLanguage item) {
                      return Text(item.displayName);
                    },
                  ),
                ),

                SizedBox(height: 8),

                AppTile(
                  label: Languages.translate.darkMode,
                  trailing: AppDropdown<ThemeMode>(
                    items: ThemeMode.values,
                    value: state.themeMode,
                    onChanged: (ThemeMode? value) {
                      if (value == null) return;
                      cubit.toggleTheme(value);
                    },
                    itemBuilder: (ThemeMode item) {
                      return Text(item.name);
                    },
                  ),
                ),

                SizedBox(height: 8),

                AppTile(
                  label: Languages.translate.themeColor,
                  trailing: ColorPickerDot(
                    selectedColor: Color(state.colorSchemeSeed),
                    onChanged: (color) {
                      cubit.changeColorSeed(color);
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
