import 'package:clickable_regions/model/car_model.dart';


abstract class CarWidgetState{
}

class InitialState extends CarWidgetState {
  InitialState();
}


class SelectedState extends CarWidgetState{
  List<CarModel> imageList;
  SelectedState(this.imageList);
}


class UnSelectedState extends CarWidgetState{
  List<CarModel> imageList ;
  UnSelectedState(this.imageList);
}

class CancelState extends CarWidgetState {
  List<CarModel> imageList ;
  CancelState(this.imageList);
}


class ImageListLoadedState extends CarWidgetState {
  List<CarModel> imageList ;
  ImageListLoadedState(this.imageList);
}


class OpenDialogState extends CarWidgetState {
  final CarModel carModel ;
  OpenDialogState(this.carModel);
}


class NewLoadedListState extends CarWidgetState {

}

class LocadingState extends CarWidgetState {

}