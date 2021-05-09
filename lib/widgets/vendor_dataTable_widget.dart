import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shapeyouadmin_web/services/firebase_services.dart';

class VendorDataTable extends StatelessWidget {
  const VendorDataTable({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseServices _services = FirebaseServices();

    return StreamBuilder(
        stream:
            _services.vendors.orderBy('shopName', descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              showBottomBorder: true,
              dataRowHeight: 60,
              headingRowColor: MaterialStateProperty.all(Colors.grey[200]),
              //table header
              columns: <DataColumn>[
                DataColumn(
                  label: Text('Active / Inactive'),
                ),
                DataColumn(
                  label: Text('Top Picked'),
                ),
                DataColumn(
                  label: Text('Shop Name'),
                ),
                DataColumn(
                  label: Text('Rating'),
                ),
                DataColumn(
                  label: Text('Total Sales'),
                ),
                DataColumn(
                  label: Text('Mobile'),
                ),
                DataColumn(
                  label: Text('Email'),
                ),
                DataColumn(
                  label: Text('View Details'),
                ),
              ],
              //details
              rows: _vendorDetailsRow(snapshot.data, _services),
            ),
          );
        });
  }

  List<DataRow> _vendorDetailsRow(
      QuerySnapshot snapshot, FirebaseServices services) {
    List<DataRow> newlist = snapshot.docs.map((DocumentSnapshot document) {
      return DataRow(
        cells: [
          DataCell(
            IconButton(
              onPressed: () {
                services.updateVendorStatus(
                    id: document.data()['uid'],
                    status: document.data()['accVerified']);
              },
              icon: document.data()['accVerified']
                  ? Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    )
                  : Icon(
                      Icons.remove_circle,
                      color: Colors.red,
                    ),
            ),
          ),
          DataCell(
            IconButton(
              onPressed: () {
                services.updateVendorStatus(
                    id: document.data()['uid'],
                    status: document.data()['isTopPicked']);
              },
              icon: document.data()['isTopPicked']
                  ? Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    )
                  : Icon(Icons.remove_circle,
                color: Colors.red,),
            ),
          ),
          DataCell(
            Text(
              document.data()['shopName'],
            ),
          ),
          DataCell(
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.grey,
                ),
                Text('3.5'),
              ],
            ),
          ),
          DataCell(
            Text('\$20,000'),
          ),
          DataCell(
            Text(
              document.data()['mobile'],
            ),
          ),
          DataCell(
            Text(
              document.data()['email'],
            ),
          ),
          DataCell(IconButton(
            onPressed: () {},
            icon: Icon(Icons.remove_red_eye_sharp),
          )),
        ],
      );
    }).toList();
    return newlist;
  }
}