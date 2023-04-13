// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'splash_page_pref_bloc.dart';

abstract class SplashPagePrefState extends Equatable {
  const SplashPagePrefState();

  @override
  List<Object> get props => [];
}

class UndefinedSplashPagePrefState extends SplashPagePrefState {}

class LoadedSplashPagePrefState extends SplashPagePrefState {
  final bool showSplashPage;

  const LoadedSplashPagePrefState({
    required this.showSplashPage,
  });

  @override
  List<Object> get props => [showSplashPage];
}
