import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:clickable_regions/bloc/paint_bloc/paint_bloc_event.dart';
import 'package:clickable_regions/bloc/paint_bloc/paint_bloc_state.dart';



class PaintBloc extends Bloc<PaintEvent, PaintState> {
  PaintBloc(PaintState initialState) : super(initialState);

  @override
  Stream<PaintState> mapEventToState(PaintEvent event) async* {

  }
}