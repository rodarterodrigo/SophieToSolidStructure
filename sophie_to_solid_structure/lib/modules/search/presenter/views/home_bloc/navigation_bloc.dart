import 'package:bloc/bloc.dart';
import 'package:sophie_to_solid_structure/modules/search/presenter/states/navigation_state.dart';

class NavigationBloc extends Bloc<int, INavigationState>{

  int _index;
  get index => _index;
  set index(value) => _index = value;

  NavigationBloc(this._index) : super(IndexStart());

  @override
  Stream<INavigationState> mapEventToState(int index) async*{
    this.index = index;
    yield IndexSuccess(this.index);
  }
}