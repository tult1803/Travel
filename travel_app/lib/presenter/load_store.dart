import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/helpers/component.dart';
import 'package:travel_app/model/get_store.dart';
import 'package:travel_app/model/model_data_store.dart';

// ignore: camel_case_types, must_be_immutable
class foodOfLocation extends StatefulWidget {
  int? typeOfStore;
  int location;

  foodOfLocation({this.typeOfStore, required this.location});

  @override
  _foodOfLocationState createState() => _foodOfLocationState();
}

class _foodOfLocationState extends State<foodOfLocation> {
 late List<ModelDataStore> _list;

  _getDataStore() async {
    DataStore dataStore = DataStore();
    _list = await dataStore.getDataStore(
        location: widget.location, typeOfStore: widget.typeOfStore);
    return _list;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return FutureBuilder(
       future: _getDataStore(),
      builder: (context, snapshot) {
         // List<dynamic>? _list = snapshot.data;
         if(snapshot.hasData){
           if(_list.isNotEmpty) {
             return ListView.builder(
               itemCount: _list.length,
               itemBuilder: (context, index) {
                 return Column(
                   children: [
                     foodContainer(context,
                         color: Colors.white,
                         border: index == 0 ? true : null,
                         storeName: "${_list[index].storeName}",
                         location: "${_list[index].address}",
                         star: "${_list[index].star}",
                         avrPrice: "${_list[index].avrPrice}",
                         openTime: "${_list[index].openTime}",
                         linkImg: "${_list[index].imageUrl}"),
                   ],
                 );
               },
             );
           }else {
             return Container(
               // margin: EdgeInsets.only(top: size.height * 0.2),
               width: size.width,
               height: size.height,
               child: Center(child: Text("Không có dữ liệu", style: GoogleFonts.roboto(fontSize: 18, color: Colors.white),),),
                 );
           }
         }else{
           return Container(
               // margin: EdgeInsets.only(top: size.height * 0.2),
               child: Center(child: CircularProgressIndicator(color: Colors.white,)));
         }
      },
    );
  }

}
