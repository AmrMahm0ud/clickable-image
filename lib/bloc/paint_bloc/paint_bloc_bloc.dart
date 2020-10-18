import 'package:clickable_regions/bloc/paint_bloc/paint_bloc_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:clickable_regions/bloc/paint_bloc/paint_bloc_event.dart';
import 'package:clickable_regions/bloc/paint_bloc/paint_bloc_state.dart';



class PaintBloc extends Bloc<PaintEvent, PaintState> {
  final PaintBlocRepo paintBlocRepo;
  PaintBloc(this.paintBlocRepo) : super(null);

  @override
  Stream<PaintState> mapEventToState(PaintEvent event) async* {
    print(event);
    if (event is BuildImageListEvent){

      yield paintBlocRepo.buildSvgImageList();

    }
    else if (event is OpenDialogEvent) {

      yield OpenDialogState(event.carModel);

    }else if (event is YesButtonPressedEvent) {
       //PaintState paintState ;
       yield CancelState();
       //print(paintState);
    }
  }
}