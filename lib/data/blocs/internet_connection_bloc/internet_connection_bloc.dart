import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

part 'internet_connection_bloc.freezed.dart';

@freezed
class InternetConnectionEvent with _$InternetConnectionEvent {
  const InternetConnectionEvent._();

  const factory InternetConnectionEvent.create() =
      _CreateInternetConnectionEvent;

  const factory InternetConnectionEvent.connected() =
      _ConnectedInternetConnectionEvent;

  const factory InternetConnectionEvent.disconnected() =
      _DisconnectedInternetConnectionEvent;
}

@freezed
class InternetConnectionState with _$InternetConnectionState {
  const InternetConnectionState._();

  const factory InternetConnectionState.initial() =
      _InitialInternetConnectionState;

  const factory InternetConnectionState.connected({
    required String status,
  }) = _ConnectedInternetConnectionState;

  const factory InternetConnectionState.disconnected({
    required String status,
  }) = _DisconnectedInternetConnectionState;
}

class InternetConnectionBloc
    extends Bloc<InternetConnectionEvent, InternetConnectionState> {
  InternetConnectionBloc() : super(const _InitialInternetConnectionState()) {
    on<InternetConnectionEvent>(
      (event, emitter) {
        event.map(
          create: (event) => _initialize(event, emitter),
          connected: (event) => _connectState(event, emitter),
          disconnected: (event) => _disconnectState(event, emitter),
        );
      },
      transformer: bloc_concurrency.sequential(),
    );
  }

  Future<void> _initialize(
    InternetConnectionEvent event,
    Emitter<InternetConnectionState> emitter,
  ) async {
    InternetConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          add(const InternetConnectionEvent.connected());
          break;
        case InternetConnectionStatus.disconnected:
          add(const InternetConnectionEvent.disconnected());
          break;
      }
    });
  }

  Future<void> _disconnectState(
    _DisconnectedInternetConnectionEvent event,
    Emitter<InternetConnectionState> emitter,
  ) async {
    emitter(const InternetConnectionState.disconnected(
      status: 'You are disconnected from the internet.',
    ));
  }

  Future<void> _connectState(
    _ConnectedInternetConnectionEvent event,
    Emitter<InternetConnectionState> emitter,
  ) async {
    emitter(const InternetConnectionState.connected(
      status: 'Data connection is available.',
    ));
  }
}
