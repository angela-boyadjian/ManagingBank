import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

import 'package:storage/models/image.dart';

import 'provider.dart';

class FirebaseStorageProvider extends AProvider {
  @override
  Future<File> downloadImage(String path) async {
    var ref = FirebaseStorage.instance.ref().child(path);
    final bytes = await ref.getData();
    return File.fromRawPath(bytes);
  }

  @override
  Future<String> uploadImage(ImageModel image) async {
    String url;
    UploadTask task = FirebaseStorage.instance
        .ref()
        .child(image.path)
        .child(image.name)
        .putFile(image.data);

    await task.then((TaskSnapshot snapshot) async {
      url = await snapshot.ref.getDownloadURL();
    }).catchError((Object e) {
      throw Exception();
    });
    return url;
  }

  saveAsBytes(Uint8List bytes, String s) {}
}
