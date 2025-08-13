import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object?> get props => [];
}

class HomeFetchImages extends HomeEvent {
  final int? page;
  final int? limit;
  const HomeFetchImages({this.page, this.limit});
  @override
  List<Object?> get props => [page, limit];
}

