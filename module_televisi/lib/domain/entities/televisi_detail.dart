
import 'package:equatable/equatable.dart';
import 'package:module_televisi/domain/entities/genre_televisi.dart';

class TelevisiDetail extends Equatable {
  TelevisiDetail({
    required this.backdropPath,
    required this.genres,
    required this.id,
    required this.originalName,
    required this.firstAirDate,
    required this.overview,
    required this.posterPath,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.name,
    required this.voteAverage,
    required this.voteCount,
    required this.popularity,
  });

  final String? backdropPath;
  final List<GenreTelevisi> genres;
  final int id;
  final String originalName;
  final String firstAirDate;
  final String overview;
  final String posterPath;
  final int numberOfEpisodes;
  final int numberOfSeasons;
  final String name;
  final double voteAverage;
  final int voteCount;
  final double popularity;

  @override
  List<Object?> get props => [
    backdropPath,
    genres,
    id,
    firstAirDate,
    overview,
    posterPath,
    numberOfEpisodes,
    numberOfSeasons,
    name,
    voteAverage,
    voteCount,
  ];
}
