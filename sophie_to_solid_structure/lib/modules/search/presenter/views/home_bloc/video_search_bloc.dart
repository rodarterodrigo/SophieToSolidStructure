import 'package:bloc/bloc.dart';
import 'package:sophie_to_solid_structure/modules/search/domain/usecases/search_video_by_text.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sophie_to_solid_structure/modules/search/presenter/states/search_state.dart';

class VideoSearchBloc extends Bloc<String, ISearchState>{
  final ISearchVideoByText usecase;
  VideoSearchBloc(this.usecase) : super(SearchStart());

  @override
  Stream<ISearchState> mapEventToState(String searchText) async*{
   yield SearchLoad();
   final result = await usecase.searchVideo(searchText);
   yield result.fold((l) => SearchError(l), (r) => SearchSuccess(r));
  }

  @override
  Stream<Transition<String, ISearchState>> transformEvents(
      Stream<String> events, transitionFn) {
    events = events.debounceTime(Duration(milliseconds: 500));
    return super.transformEvents(events, transitionFn);
  }
}