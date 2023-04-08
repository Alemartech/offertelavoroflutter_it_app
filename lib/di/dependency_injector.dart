import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';
import 'package:offertelavoroflutter_it_app/blocs/job_offers/job_offers_bloc.dart';
import 'package:offertelavoroflutter_it_app/repositories/job_repository.dart';
import 'package:offertelavoroflutter_it_app/services/network/jobs_services.dart';
import 'package:offertelavoroflutter_it_app/services/network/temp/temp_services.dart';
import 'package:offertelavoroflutter_it_app/themes/cubits/theme/theme_cubit.dart';
import 'package:offertelavoroflutter_it_app/repositories/mappers/job_mapper.dart';
import 'package:pine/di/dependency_injector_helper.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

part 'blocs.dart';
part 'mappers.dart';
part 'providers.dart';
part 'repositories.dart';

class Dependencyinjector extends StatelessWidget {
  final Widget child;
  const Dependencyinjector({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) => DependencyInjectorHelper(
        mappers: _mappers,
        providers: _providers,
        repositories: _repositories,
        blocs: _blocs,
        child: child,
      );
}
