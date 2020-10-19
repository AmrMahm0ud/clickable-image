import 'package:clickable_regions/model/car_model.dart';


abstract class PaintState{
}

class InitialState extends PaintState {
  InitialState();
}


class SelectedState extends PaintState{
     List<CarModel> imageList;
     SelectedState(this.imageList);
}


class UnSelectedState extends PaintState{
  List<CarModel> imageList ;
  UnSelectedState(this.imageList);
}

class CancelState extends PaintState {
  CancelState();
}


class ImageListLoadedState extends PaintState {
  List<CarModel> imageList ;
  ImageListLoadedState(this.imageList);
}


class OpenDialogState extends PaintState {
  final CarModel carModel ;
  OpenDialogState(this.carModel);
}


class NewLoadedListState extends PaintState {

}
