

import 'package:module_televisi/data/models/televisi_table.dart';
import 'package:module_televisi/domain/entities/genre_televisi.dart';
import 'package:module_televisi/domain/entities/televisi.dart';
import 'package:module_televisi/domain/entities/televisi_detail.dart';

final testTelevisi = Televisi(
  firstAirDate: DateTime.parse('2000-09-09 09:09:09.591918'),
  backdropPath: 'backdropPath',
  genreIds: const [1, 2, 3],
  id: 1,
  originalName: 'originalName',
  originCountry: const ['originCountry', 'originCountry'],
  overview: 'overview',
  popularity: 1,
  posterPath: 'posterPath',
  name: 'name',
  originalLanguage: 'originalLanguage',
  voteAverage: 1,
  voteCount: 1,
);

final testTelevisiList = [testTelevisi];

final testTelevisiDetail = TelevisiDetail(
    backdropPath: '/5DUMPBSnHOZsbBv81GFXZXvDpo6.jpg',
    genres: [GenreTelevisi(id: 16, name:"Animation")],
    id: 114410,
    originalName: 'チェンソーマン',
    firstAirDate: '2022-10-12',
    overview: "A fierce battle unfolds between Denji and the menacing Samurai Sword. But even after Denji takes one of Samurai Sword's companions hostage, Samurai Sword slashes through them both until Denji is captured. Meanwhile, after seemingly being killed, Makima turns out to be alive. She sets out to rescue Denji with the help of Public Safety Devil Hunters from Kyoto, Kurose and Tendo",
    posterPath: '/npdB6eFzizki0WaZ1OvKcJrWe97.jpg',
    numberOfEpisodes: 12,
    numberOfSeasons: 1,
    name: 'Chainsaw Man',
    voteAverage: 8.611,
    voteCount: 374,
    popularity: 1392.121

);

final testWatchlistTelevisi = Televisi.watchlist(
  id: 114410,
  name: 'Chainsaw Man',
  posterPath: '/npdB6eFzizki0WaZ1OvKcJrWe97.jpg',
  overview:
    "A fierce battle unfolds between Denji and the menacing Samurai Sword. But even after Denji takes one of Samurai Sword's companions hostage, Samurai Sword slashes through them both until Denji is captured. Meanwhile, after seemingly being killed, Makima turns out to be alive. She sets out to rescue Denji with the help of Public Safety Devil Hunters from Kyoto, Kurose and Tendo"
);

final testTelevisiTable = TelevisiTable(
  id: 114410,
  name: 'Chainsaw Man',
  posterPath: '/npdB6eFzizki0WaZ1OvKcJrWe97.jpg',
  overview:
    "A fierce battle unfolds between Denji and the menacing Samurai Sword. But even after Denji takes one of Samurai Sword's companions hostage, Samurai Sword slashes through them both until Denji is captured. Meanwhile, after seemingly being killed, Makima turns out to be alive. She sets out to rescue Denji with the help of Public Safety Devil Hunters from Kyoto, Kurose and Tendo"
);

final testTelevisiMap = {
  'id': 114410,
  'overview':
    "A fierce battle unfolds between Denji and the menacing Samurai Sword. But even after Denji takes one of Samurai Sword's companions hostage, Samurai Sword slashes through them both until Denji is captured. Meanwhile, after seemingly being killed, Makima turns out to be alive. She sets out to rescue Denji with the help of Public Safety Devil Hunters from Kyoto, Kurose and Tendo",
  'posterPath': "/npdB6eFzizki0WaZ1OvKcJrWe97.jpg",
  'name': 'Chainsaw Man',
};
