import 'package:equatable/equatable.dart';

class Recommendation extends Equatable {
  const Recommendation({ this.backdropPath, required this.id});

  final String? backdropPath;
  final int id;

  @override
  List<Object?> get props => [backdropPath, id];
}
