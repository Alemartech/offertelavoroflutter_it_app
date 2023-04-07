import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offertelavoroflutter_it_app/services/network/temp/temp_services.dart';
import 'package:offertelavoroflutter_it_app/themes/cubits/theme/theme_cubit.dart';
import 'package:offertelavoroflutter_it_app/themes/theme_type.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildMainPageBody(context),
    );
  }

  Widget _buildMainPageBody(BuildContext context) => Center(
        child: TextButton(
          onPressed: () => context.read<TempServices>().tempServ(),
          child: const Text("Prova"),
        ),
      );
}
