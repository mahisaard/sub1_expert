import '../repositories/televisi_repository.dart';

class GetWatchListStatusTelevisi {
  final TelevisiRepository repository;

  GetWatchListStatusTelevisi(this.repository);

  Future<bool> execute(int id) async {
    return repository.isAddedToWatchlistTelevisi(id);
  }
}
