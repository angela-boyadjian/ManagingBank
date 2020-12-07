import 'package:storage/models/image.dart';
import 'providers/local_storage_provider.dart';

class StorageRepository {
  LocalStorageProvider _provider = LocalStorageProvider();

  Future<ImageModel> downloadImage(String path) async {
    var rawData = await _provider.downloadImage(path);
    return ImageModel(
        name: 'image', type: 'jpeg', data: rawData, path: rawData.path);
  }

  Future<String> uploadImage(ImageModel image) async =>
      await _provider.uploadImage(image);
}
