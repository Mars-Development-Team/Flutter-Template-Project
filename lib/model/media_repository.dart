import 'media.dart';
import 'services/base_service.dart';
import 'services/media_service.dart';

class MediaRepository {
  final BaseService _mediaService = MediaService();

  Future<List<Media>> fetchMediaList(String value) async {
    dynamic response = await _mediaService.getResponse(value);
    final jsonData = response['results'] as List;
    var mediaList = jsonData.map((tagJson) => Media.fromJson(tagJson)).toList();
    return mediaList;
  }
}
