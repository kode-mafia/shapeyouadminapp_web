import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class FirebaseServices{
  FirebaseFirestore firestore= FirebaseFirestore.instance;
  CollectionReference banners= FirebaseFirestore.instance.collection('slider');
  CollectionReference vendors= FirebaseFirestore.instance.collection('vendors');
  FirebaseStorage storage=FirebaseStorage.instance;

  Future<DocumentSnapshot>getAdminCredentials(id){
    var result = FirebaseFirestore.instance.collection('Admin').doc(id).get();
    return result;
  }

  Future<String>uploadBannerImageToDb(url) async{
        String downloadUrl = await storage.ref(url).getDownloadURL();
        if(downloadUrl!=null){
          firestore.collection('slider').add({
            'image': downloadUrl,
          });
        }
        return downloadUrl;
  }



  Future<void> confirmDeleteDialog({title, message,context ,id}) async {
    return showDialog<void>(
      context: context,
      barrierColor: Colors.red.withOpacity(0.1),
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(message),
              ],
            ),),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Dismiss alert dialog
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                deleteBannerImagefromDb(id);
                Navigator.of(dialogContext).pop(); // Dismiss alert dialog
              },
            ),
          ],
        );
      },
    );
  }

  deleteBannerImagefromDb(id) async{
    firestore.collection('slider').doc(id).delete();
  }

  updateVendorStatus({id, status}) async{
    vendors.doc(id).update({
      'accVerified': status ?false:true,
    });
  }

  Future<void> showMyDialog({title, message,context}) async {
    return showDialog<void>(
      context: context,
      barrierColor: Colors.red.withOpacity(0.1),
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(message),
              ],
            ),),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Dismiss alert dialog
              },
            ),

          ],
        );
      },
    );
  }
}


