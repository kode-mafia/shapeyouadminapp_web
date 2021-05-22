import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:shapeyouadmin_web/services/firebase_services.dart';

class ApprovedBoys extends StatefulWidget {
  @override
  _ApprovedBoysState createState() => _ApprovedBoysState();
}

class _ApprovedBoysState extends State<ApprovedBoys> {


  bool status = false;
  FirebaseServices _services  = FirebaseServices();

  @override
  Widget build(BuildContext context) {



    return Container(
      child: StreamBuilder(
        stream: _services.boys.where('accVerified',isEqualTo: true).snapshots(),
        builder: (context,snapshot){
          if(snapshot.hasError){
            return Text('Something went wrong..');
          }
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }

          QuerySnapshot snap = snapshot.data;

          if(snap.size==0){
            return Center(child: Text('No Approved boys to list'),);
          }
          return SingleChildScrollView(
            child: DataTable(
              showBottomBorder: true,
              dataRowHeight: 60,
              headingRowColor: MaterialStateProperty.all(Colors.grey[200]),
              columns: <DataColumn>[
                DataColumn(label: Expanded(child: Text('Profile Pic')),),
                DataColumn(label: Text('Name'),),
                DataColumn(label: Text('email'),),
                DataColumn(label: Text('Mobile'),),
                DataColumn(label: Text('Address'),),
                DataColumn(label: Text('Action'),),
                //DataColumn(label: Text('Actions'),),
              ],
              rows: _boysList(snapshot.data,context),
            ),
          ) ;
        },
      ),
    );
  }

  List<DataRow>_boysList(QuerySnapshot snapshot,context){

    List<DataRow> newList = snapshot.docs.map((DocumentSnapshot document){
      print(document.data().length);
      if(document!=null){
        return DataRow(
            cells: [
              DataCell(
                  Container(
                    width: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(document.data()['imageUrl'],fit: BoxFit.contain,),
                    ),)
              ),
              DataCell(
                  Text(document.data()['name'])
              ),
              DataCell(
                  Text(document.data()['email'])
              ),
              DataCell(
                  Text(document.data()['mobile'])
              ),
              DataCell(
                  Text(document.data()['address'])
              ),
              DataCell(
                FlutterSwitch(
                  activeText: "Approved",
                  inactiveText: "Not Approved",
                  value: document.data()['accVerified'],
                  valueFontSize: 10.0,
                  width: 110,
                  borderRadius: 30.0,
                  showOnOff: true,
                  onToggle: (val) {
                    _services.updateBoyStatus(id: document.id,context: context,status: false);
                  },
                ),
              )
            ]
        );
      }
    }).toList();
    return newList;
  }
}
