import 'package:inkino/core/models/actor.dart';
import 'package:inkino/core/models/event.dart';
import 'package:inkino/core/redux/app/app_state.dart';
import 'package:kt_dart/collection.dart';

KtList<Actor> actorsForEventSelector(AppState state, Event event) {
  return state.actorsByName.values
      .filter((actor) => event.actors.contains(actor));
}
