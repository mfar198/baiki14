import 'dart:convert';
import 'package:baiki/ui/shopDetails.dart';
import 'package:baiki/login/login_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:baiki/ui/theme/themeData.dart';
import 'package:baiki/main.dart';

import '../header/appBar.dart';



class searchPage extends StatefulWidget {
  searchPage({Key? key}) : super(key: key);



  @override
  State<searchPage> createState() => _searchPageState();
}

class _searchPageState extends State<searchPage> {
  late dynamic future;

  final _controller = TextEditingController();


  fetchData({String? searchQuery}) async{
    var url;

    if(searchQuery != null) {
      url = await http.get(Uri.parse(
          "https://api.jikan.moe/v4/anime?q=$searchQuery"));

      return json.decode(url.body)["data"];
    } else {
      url = await http.get(Uri.parse(
          "https://api.jikan.moe/v4/top/anime?q=&page=1&limit=100"));

      return json.decode(url.body)["data"];
    }


  }

  @override
  void initState() {
    future = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(
      ),
      endDrawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //myHeaderDrawer(),
              loginPage(),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0, left: 40.0, right: 40.0, bottom: 1),
        child: Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Get help from ", style: GoogleFonts.poppins(
                    //
                    // textStyle: Theme.of(context).textTheme.bodyLarge,
                      color: Theme.of(context).colorScheme.brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black, fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  Text("your nearest", style: GoogleFonts.poppins(
                    color: Colors.red, fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                ],
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("mobile repair shop", style: GoogleFonts.poppins(
                  color: Colors.black, fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.all(12)),
                TextFormField(
                  controller: _controller,
                  keyboardType: TextInputType.text,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: GoogleFonts.poppins(),
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: ()=> _controller.clear(),
                    ),
                    prefixIcon: Icon(Icons.search),
                    filled: false,
                    hintText: 'Search',
                    contentPadding: EdgeInsets.only(
                      top: 14,
                      right: 16,
                      bottom: 0,
                      left: 16,
                    ),
                    border: UnderlineInputBorder(),
                  ),
                  onFieldSubmitted: (input) {
                    setState(() {
                      future = fetchData(searchQuery: input);
                    });
                  },
                ),
            const Padding(padding: EdgeInsets.all(16)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: ()=> setState(() {
                    future = fetchData(searchQuery: null);
                  }),
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromRGBO(255, 255, 255, 1),
                    shadowColor: Colors.grey,
                    elevation: 1,
                    minimumSize: Size(140, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Text(
                    "All",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: ()=> setState(() {
                    future = fetchData(searchQuery: 'Gintama');
                  }),
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromRGBO(251, 31, 38, 1),
                    shadowColor: Colors.grey,
                    elevation: 1,
                    minimumSize: Size(140, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Text(
                    "Nearest",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.all(12)),
            Expanded(
              child: FutureBuilder(
                future: future,
                builder: (BuildContext context, AsyncSnapshot snapshot){
                  if(snapshot.hasError)
                    {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    }
                  if(snapshot.hasData)
                    {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        padding: EdgeInsets.all(2),
                        itemBuilder: (BuildContext context, int index){
                          return Row(
                            children: [
                              Container(
                                height: 200,
                                alignment: Alignment.centerLeft,
                                  child: CircleAvatar(
                                    radius: 50.0,
                                    backgroundColor: Colors.white,
                                    backgroundImage: NetworkImage(snapshot.data[index]['images']['jpg']['image_url']
                                    ),
                                  ),
                              ),
                              SizedBox(width: 20,),
                              Expanded(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: 80,
                                            child: Text(
                                              snapshot.data[index]["title"],
                                              style: TextStyle(color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 60,
                                            child:
                                                RichText(
                                                  text: TextSpan(
                                                    children: [
                                                      WidgetSpan(child: Icon(Icons.add_location_outlined,size: 14),),
                                                      TextSpan(
                                                        text: "${snapshot.data[index]["score"]}",
                                                        style: TextStyle(color: Color(0xff868597)),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 100,
                                        child: Text(
                                          snapshot.data[index]["synopsis"],
                                          style: TextStyle(color: Color(0xff868597)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );

                        },
                      );
                    }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
