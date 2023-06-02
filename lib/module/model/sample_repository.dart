import '../../core/constants/endpoint_constants.dart';
import '../../networking/services/base_service.dart';
import '../../networking/services/service.dart';
import 'sample.dart';

class SampleRepository {
  final BaseService _SampleService = Service.init(baseUrl: Endpoint.BASE_URL);

  Future<List<Sample>> fetchSampleList() async {
    dynamic response = await _SampleService.fetchRequest(
        path: Endpoint.SAMPLE_PATH, options: null);
    final jsonData = response as List;
    var sampleList =
        jsonData.map((tagJson) => Sample.fromJson(tagJson)).toList();
    return sampleList;
  }
}
