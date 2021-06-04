import 'package:flutter/cupertino.dart';
import '../model/apis/api_response.dart';
import '../model/sample_repository.dart';

class SampleViewModel with ChangeNotifier {
  ApiResponse _apiResponse = ApiResponse.initial('Empty data');

  ApiResponse get response {
    return _apiResponse;
  }

  Future<void> fetchMediaData() async {
    _apiResponse = ApiResponse.loading('Fetching artist data');
    notifyListeners();
    try {
      var sampleList = await SampleRepository().fetchSampleList();
      _apiResponse = ApiResponse.completed(sampleList);
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }
}
