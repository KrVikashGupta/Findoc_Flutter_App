import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';
import '../../services/api_service.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ApiService apiService;
  HomeBloc({required this.apiService}) : super(HomeInitial()) {
    on<HomeFetchImages>(_onFetchImages);
  }

  Future<void> _onFetchImages(
    HomeFetchImages event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(HomeLoading());
      final images = await apiService.fetchImages(
        page: event.page,
        limit: event.limit,
      );
      emit(HomeLoaded(images));
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }
}

