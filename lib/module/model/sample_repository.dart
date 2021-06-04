import '../../core/constants/endpoint_constants.dart';
import 'sample.dart';
import 'services/base_service.dart';
import 'services/sample_service.dart';

class SampleRepository {
  final BaseService _SampleService = SampleService.init();

  Future<List<Sample>> fetchSampleList() async {
    dynamic response =
        await _SampleService.fetchRequest(Endpoint.SAMPLE_PATH, null);
    final jsonData = response as List;
    var sampleList =
        jsonData.map((tagJson) => Sample.fromJson(tagJson)).toList();
    return sampleList;
  }
}
