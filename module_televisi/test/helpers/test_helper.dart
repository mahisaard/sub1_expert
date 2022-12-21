import 'package:http/io_client.dart';
import 'package:mockito/annotations.dart';
import 'package:module_televisi/data/datasources/db/database_televisi_helper.dart';
import 'package:module_televisi/data/datasources/televisi_data_lokal_source.dart';
import 'package:module_televisi/data/datasources/televisi_data_remote_source.dart';
import 'package:module_televisi/domain/repositories/televisi_repository.dart';

@GenerateMocks([
  TelevisiRepository,
  TelevisiRemoteDataSource,
  TelevisiDataLokalSource,
  DatabaseHelperTelevisi,
], customMocks: [
  MockSpec<IOClient>(as: #MockHttpClient)
])
void main() {}
