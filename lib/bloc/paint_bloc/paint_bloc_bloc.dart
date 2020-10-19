import 'package:clickable_regions/bloc/paint_bloc/paint_bloc_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:clickable_regions/bloc/paint_bloc/paint_bloc_event.dart';
import 'package:clickable_regions/bloc/paint_bloc/paint_bloc_state.dart';



class PaintBloc extends Bloc<PaintEvent, PaintState> {
  final PaintBlocRepo paintBlocRepo;
  PaintBloc(this.paintBlocRepo) : super(InitialState());


  @override
  Stream<PaintState> mapEventToState(PaintEvent event) async* {
    if (event is ShowCarEvent){
      yield ImageListLoadedState(event.imageList);
    }
    else if (event is OpenDialogEvent) {
      yield OpenDialogState(event.carModel);
    }else if (event is YesButtonPressedEvent) {
       yield paintBlocRepo.paintPart(event.index, event.imageList);
    } else if (event is CancelButtonPressedEvent){
      yield CancelState(event.imageList);
    }else if (event is NoButtonPressedEvent){
      yield paintBlocRepo.unPaintPart(event.index, event.imageList);
    }
  }
}