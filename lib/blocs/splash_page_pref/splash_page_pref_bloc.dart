import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter_it_app/repositories/local_storage_repository.dart';

part 'splash_page_pref_event.dart';
part 'splash_page_pref_state.dart';

class SplashPagePrefBloc
    extends Bloc<SplashPagePrefEvent, SplashPagePrefState> {
  final LocalStoragePrefRepository localStoragePrefRepository;

  SplashPagePrefBloc({required this.localStoragePrefRepository})
      : super(UndefinedSplashPagePrefState()) {
    on<FetchSplashPagePrefEvent>(_mapFetchSplashPagePrefEventToState);
    on<HideSplashPagePrefEvent>(_mapHideSplashPagePrefEventToState);
    on<ShowSplashPagePrefEvent>(_mapShowSplashPagePrefEventToState);
  }

  FutureOr<void> _mapFetchSplashPagePrefEventToState(_, Emitter emit) async {
    final showSplashPage = await localStoragePrefRepository.showSplashPage;

    emit(
      showSplashPage == null
          ? UndefinedSplashPagePrefState()
          : LoadedSplashPagePrefState(showSplashPage: showSplashPage),
    );
  }

  FutureOr<void> _mapHideSplashPagePrefEventToState(_, Emitter emit) async =>
      localStoragePrefRepository.hideSplashPageToStartup();

  FutureOr<void> _mapShowSplashPagePrefEventToState(_, Emitter emit) async =>
      localStoragePrefRepository.showSplashPageToStartup();

  void fetchSplashPagePref() => add(FetchSplashPagePrefEvent());

  void hideSplashPageToStartup() => add(HideSplashPagePrefEvent());
}
