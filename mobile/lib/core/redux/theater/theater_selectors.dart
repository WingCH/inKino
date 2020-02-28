import 'package:inkino/core/models/theater.dart';
import 'package:inkino/core/redux/app/app_state.dart';
import 'package:kt_dart/collection.dart';

Theater currentTheaterSelector(AppState state) =>
    state.theaterState.currentTheater;

KtList<Theater> theatersSelector(AppState state) => state.theaterState.theaters;
