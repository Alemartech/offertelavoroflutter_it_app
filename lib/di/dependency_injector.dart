import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pine/di/dependency_injector_helper.dart';
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
