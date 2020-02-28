import 'package:http/http.dart';
import 'package:inkino/core/networking/finnkino_api.dart';
import 'package:inkino/core/networking/tmdb_api.dart';
import 'package:inkino/core/redux/actor/actor_middleware.dart';
import 'package:inkino/core/redux/app/app_reducer.dart';
import 'package:inkino/core/redux/app/app_state.dart';
import 'package:inkino/core/redux/event/event_middleware.dart';
import 'package:inkino/core/redux/show/show_middleware.dart';
import 'package:inkino/core/redux/theater/theater_middleware.dart';
import 'package:key_value_store/key_value_store.dart';
import 'package:redux/redux.dart';

Store<AppState> createStore(Client client, KeyValueStore keyValueStore) {
  final tmdbApi = TMDBApi(client);
  final finnkinoApi = FinnkinoApi(client);

  return Store(
    appReducer,
    initialState: AppState.initial(),
    distinct: true,
    middleware: [
      ActorMiddleware(tmdbApi),
      TheaterMiddleware(keyValueStore),
      ShowMiddleware(finnkinoApi),
      EventMiddleware(finnkinoApi),
    ],
  );
}
