import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offertelavoroflutter_it_app/blocs/job_offers/job_offers_bloc.dart';
import 'package:offertelavoroflutter_it_app/repositories/job_repository.dart';
import 'package:offertelavoroflutter_it_app/services/network/temp/temp_services.dart';

class MainPage extends StatelessWidget with AutoRouteWrapper {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider<JobOffersBloc>(
          create: (context) => JobOffersBloc(
            jobRepository: context.read<JobRepository>(),
          ),
        ),
      ], child: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildMainPageBody(context),
    );
  }

  Widget _buildMainPageBody(BuildContext context) => Center(
        child: TextButton(
          onPressed: () => context.read<JobOffersBloc>().fetchJobs(),
          child: const Text("Prova"),
        ),
      );
}
