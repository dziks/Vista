import 'package:flutter/material.dart';
import 'dart:io';
import 'package:platform_alert_dialog/platform_alert_dialog.dart';

// Color Color.fromRGBO(49, 49, 147, 1) = Color.fromRGBO(49, 49, 147, 1);

class TakePhotoField extends StatelessWidget {
  final String imageDescription;
  final File imageFile;
  // final String imageFilePath;
  final String imageViewAlert;
  final void Function() onPressed;

  const TakePhotoField({
    Key key,
    this.imageDescription,
    this.imageViewAlert,
    this.onPressed,
    this.imageFile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              imageDescription,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      if (imageFile == null) {
                        // getImageFromCamFar();
                        showDialog<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return PlatformAlertDialog(
                              title: Text(
                                'IMAGE',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(49, 49, 147, 1),
                                    fontSize: 20),
                              ),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    Text(imageViewAlert),
                                    // Text(
                                    //     'You\’re like me. I’m never satisfied.'),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                PlatformDialogAction(
                                  child: Text(
                                    'OK',
                                    style: TextStyle(
                                      color: Color.fromRGBO(49, 49, 147, 1),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        _showImageDialog(context, imageFile);
                      }
                    },
                    child: Container(
                      height: 70,
                      width: 20,
                      child: Card(
                        color: Colors.grey.shade200,
                        elevation: 0.5,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 100.0,
                          child: Center(
                            child: imageFile == null
                                ? Text(
                                    'No image Taken.',
                                    style: TextStyle(color: Color.fromRGBO(49, 49, 147, 1)),
                                  )
                                : Image.file(imageFile),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 50,
                  width: 50,
                  child: FloatingActionButton(
                    backgroundColor: Color.fromRGBO(49, 49, 147, 1),
                    onPressed: onPressed,
                    tooltip: 'Pick Image',
                    child: Icon(Icons.add_a_photo),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  _showImageDialog(BuildContext context, File image) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Column(
          children: <Widget>[
            Expanded(
              child:
                  Container(width: double.infinity, child: Image.file(image)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  iconSize: 40,
                  color: Colors.white,
                  icon: Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
                const SizedBox(width: 10.0),
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}
