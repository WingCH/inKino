
import 'package:inkino/core/models/actor.dart';
import 'package:inkino/core/models/event.dart';
import 'package:inkino/core/models/theater.dart';
import 'package:kt_dart/collection.dart';

class InitAction {}

class InitCompleteAction {
  InitCompleteAction(
    this.theaters,
    this.selectedTheater,
  );

  final KtList<Theater> theaters;
  final Theater selectedTheater;
}

class FetchComingSoonEventsIfNotLoadedAction {}

class ChangeCurrentTheaterAction {
  ChangeCurrentTheaterAction(this.selectedTheater);
  final Theater selectedTheater;
}

class UpdateActorsForEventAction {
  UpdateActorsForEventAction(this.event, this.actors);

  final Event event;
  final KtList<Actor> actors;
}
