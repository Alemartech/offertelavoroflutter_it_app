import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offertelavoroflutter_it_app/themes/cubits/theme/theme_cubit.dart';
import 'package:offertelavoroflutter_it_app/themes/theme_type.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildMainPageBody(),
    );
  }

  Widget _buildMainPageBody() => BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, mode) {
          return Center(
            child: Switch(
              value: mode.dark,
              onChanged: (value) => context
                  .read<ThemeCubit>()
                  .setTheme(value ? ThemeType.dark : ThemeType.light),
            ),
          );
        },
      );
}
