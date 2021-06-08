import 'package:mars_rover/mars_rover.dart';
import 'package:mars_rover/networking/services/service.dart';

import '../../core/constants/endpoint_constants.dart';
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
