// import 'dart:html';
//
// import 'package:flutter/cupertino.dart';
// import 'package:image_picker/image_picker.dart';
//
// Future<File> imageFile;
//
// pickImageFromGallery(ImageSource source) {
//   setState(() {
//     imageFile = ImagePicker.pickImage(source: source);
//   });
// }
//
// Widget showImage() {
//   return FutureBuilder<File>(
//     future: imageFile,
//     builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
//       if (snapshot.connectionState == ConnectionState.done &&
//           snapshot.data != null) {
//         return Image.file(
//           snapshot.data,
//           width: 300,
//           height: 300,
//         );
//       } else if (snapshot.error != null) {
//         return const Text(
//           'Error Picking Image',
//           textAlign: TextAlign.center,
//         );
//       } else {
//         return const Text(
//           'No Image Selected',
//           textAlign: TextAlign.center,
//         );
//       }
//     },
//   );
// }