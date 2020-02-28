import 'package:inkino/core/redux/_common/search.dart';
import 'package:inkino/core/redux/actor/actor_reducer.dart';
import 'package:inkino/core/redux/app/app_state.dart';
import 'package:inkino/core/redux/event/event_reducer.dart';
import 'package:inkino/core/redux/show/show_reducer.dart';
import 'package:inkino/core/redux/theater/theater_reducer.dart';

AppState appReducer(AppState state, dynamic action) {
  return new AppState(
    searchQuery: searchQueryReducer(state.searchQuery, action),
    actorsByName: actorReducer(state.actorsByName, action),
    theaterState: theaterReducer(state.theaterState, action),
    showState: showReducer(state.showState, action),
    eventState: eventReducer(state.eventState, action),
  );
}
