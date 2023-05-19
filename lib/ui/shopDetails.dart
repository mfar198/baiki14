import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:baiki/ui/theme/themeData.dart';

class shopDetails extends StatefulWidget {
  final Map<String, dynamic> selectedShop;
  shopDetails({Key? key, required this.selectedShop}) : super(key: key);
  @override
  State<shopDetails> createState() => shopDetail();
}

class shopDetail extends State<shopDetails> {

  double _rating = 0;
  String? dropdownValue;

  //Dropdownlist codes
  //String? _selectedCategory;
  //List<dynamic> _filteredData = [];

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  late Map<String, dynamic> _selectedShopData;

  int _selectedIndex1 = 0;

  @override
  void initState() {
    super.initState();
    _selectedShopData = widget.selectedShop;
    //_filteredData = widget.selectedShop['data'];
  }

  /**void _onCategorySelected(String? category) {
    setState(() {
      // Update the selected category and filter the data based on it
      _selectedCategory = category;
      _filteredData = widget.selectedShop['data'].where((item) => item['genres'] == category).toList();
    });
  }**/

  //GNavBar

  @override
  Widget build(BuildContext context) {
    String? dropdownValue = 'iPhone 14 Pro Max';
    //Tab Your Gadget
    List<Widget> _widgetOptions1 = <Widget>[
      Column(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20,),
                Row(

                  children: [
                    Text('Choose Your Model', style: GoogleFonts.poppins(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),),

                    Spacer(),

                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade400,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue;
                          });
                        },
                        items: <String>['iPhone 14 Pro Max', 'iPhone 14 Pro', 'iPhone 14', 'iPhone 13 Pro Max']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),


                    /**Expanded(

                      child: DropdownButton<String>(
                        value: _selectedCategory,
                        items: widget.selectedShop['data'].split(',').map<DropdownMenuItem<String>>((category) {
                          return DropdownMenuItem<String>(
                            value: category,
                            child: Text(category),
                          );
                        }).toList(),
                        onChanged: _onCategorySelected,
                        hint: Text('Select a category'),
                      ),
                    ),**/

                    /**Expanded(
                      child: Column(
                        children: [
                          ListView.builder(
                            itemCount: _filteredData.length,
                            itemBuilder: (context, index){
                              return ListTile(
                                title: Text(_filteredData[index]['name']),
                                subtitle: Text(_filteredData[index]['description']),
                              );
                            },
                          )
                        ],
                      ),
                    )**/

                  ],
                )
              ],
            ),
          )
        ],
      ),
      Column(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(widget.selectedShop['shopType']?? '', style: GoogleFonts.poppins(
                      color: Colors.grey, fontSize: 11,
                      fontWeight: FontWeight.normal,
                    ),),
                  ],
                )
              ],
            ),
          )
        ],
      ),
      Column(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(widget.selectedShop['shopName']?? '', style: GoogleFonts.poppins(
                      color: Colors.grey, fontSize: 11,
                      fontWeight: FontWeight.normal,
                    ),),
                  ],
                )
              ],
            ),
          )
        ],
      ),
      Column(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(widget.selectedShop['shopName']?? '', style: GoogleFonts.poppins(
                      color: Colors.grey, fontSize: 11,
                      fontWeight: FontWeight.normal,
                    ),),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ];

  List<Widget> _widgetOptions = <Widget>[

    Column(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Text('Your Gadget', style: GoogleFonts.poppins(
                     fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                    GNav(
                      rippleColor: Colors.grey, // tab button ripple color when pressed
                      hoverColor: Colors.grey, // tab button hover color
                      haptic: true, // haptic feedback
                      tabBorderRadius: 20,
                      //tabActiveBorder: Border.all(color: Colors.black, width: 1), // tab button border
                      //tabBorder: Border.all(color: Colors.grey, width: 1), // tab button border
                      tabShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 0)], // tab button shadow
                      curve: Curves.easeOutExpo, // tab animation curves
                      duration: Duration(milliseconds: 100), // tab animation duration

                      color: Colors.grey, // unselected icon color
                      activeColor: Colors.white, // selected icon and text color
                      iconSize: 24, // tab button icon size
                      tabBackgroundColor: const Color.fromRGBO(251, 31, 38, 1), // selected tab background color
                      padding: const EdgeInsets.symmetric(horizontal:5, vertical: 5), // navigation bar padding
                      tabs: const [
                        GButton(
                          icon: Icons.phone_android,
                          padding: EdgeInsets.symmetric(horizontal: 27, vertical: 8),
                        ),
                        GButton(
                          icon: Icons.tablet_mac,
                          padding: EdgeInsets.symmetric(horizontal: 27, vertical: 8),
                        ),
                        GButton(
                          icon: Icons.watch,
                          padding: EdgeInsets.symmetric(horizontal: 27, vertical: 8),
                        ),
                        GButton(
                          icon: Icons.laptop_mac,
                          padding: EdgeInsets.symmetric(horizontal: 27, vertical: 8),
                        ),
                      ],
                      gap: 50, // the tab button gap between icon and text
                      selectedIndex: _selectedIndex1,
                      onTabChange: (index) {
                        setState(() {
                          _selectedIndex1 = index;
                        });
                      },
                    ),
                ],
              ),
              Column(
                children: [
                  SizedBox(height: 10),
                  _widgetOptions1.elementAt(_selectedIndex1),
                ],
              )
            ],
          ),

        ),
      ],
    ),
    Column(
      children: [
        SizedBox(height: 20,),
        Row(
          children: [
            Icon(Icons.near_me),
            SizedBox(width: 10), // Optional spacing between icon and text
            Text('What is your review'),
            Spacer(),
            Container(
              width: 150, // Set a maxWidth for the parent container
              child: RatingBar.builder(
                initialRating: _rating,
                //initialRating: double.parse(widget.selectedShop['avg_rating']?? '0'),
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 20,
                itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    _rating = rating;
                  });
                },
              ),
            ),

          ],
        ),
        SizedBox(height: 5,),
        Text(
          '(You rated this item $_rating stars.)',
          style: TextStyle(fontSize: 12),
        ),
        SizedBox(height: 10,),

        Container(
          width: 250,
          child: TextField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              //labelText: 'Enter your text',
            ),
          ),
        )



      ],
    ),
    Column(
      children: [
        SizedBox(height: 20),
        Text(widget.selectedShop['shopDesc']?? '', style: GoogleFonts.poppins(
          color: Colors.grey, fontSize: 11,
          fontWeight: FontWeight.normal,
        ),),
        Column(
          children: [
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                Icon(Icons.local_phone, size: 18,), // specify the icon on the left
                SizedBox(width: 10), // add some space between the icon and the text
                Text(widget.selectedShop['shopNum']?.toString() ?? '',style: GoogleFonts.poppins(
                color: Colors.grey, fontSize: 11,
                fontWeight: FontWeight.normal,
                ),), // specify the text
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Icon(Icons.place, size: 18,), // specify the icon on the left
                SizedBox(width: 10), // add some space between the icon and the text
                Text((widget.selectedShop['shopCity']?? '') + ', ' + (widget.selectedShop['shopState']?? ''),style: GoogleFonts.poppins(
                  color: Colors.grey, fontSize: 11,
                  fontWeight: FontWeight.normal,
                ),), // specify the text
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Icon(Icons.watch_later, size: 18,), // specify the icon on the left
                SizedBox(width: 10), // add some space between the icon and the text
                Text(widget.selectedShop['status']?? '',style: GoogleFonts.poppins(
                  color: Colors.grey, fontSize: 11,
                  fontWeight: FontWeight.normal,
                ),), // specify the text
              ],
            ),
          ],
        ),
      ],
    ),
  ];
//GNavBar

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        //toolbarHeight: 60,
        backgroundColor: Color.fromRGBO(251, 31, 38, 1),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            color: Colors.white,
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        ),
        title: Text(widget.selectedShop['shopName']?? '', style: GoogleFonts.poppins(
          color: Colors.white, fontSize: 18,
          fontWeight: FontWeight.bold,
        ),),
        centerTitle: true,
      ),
      body: Padding(
    padding: const EdgeInsets.only(top: 40.0, left: 40.0, right: 40.0, bottom: 1),
    child: SingleChildScrollView(
      child: Column(
        children: [

          GNav(
              rippleColor: Colors.grey, // tab button ripple color when pressed
              hoverColor: Colors.grey, // tab button hover color
              haptic: true, // haptic feedback
              tabBorderRadius: 20,
              //tabActiveBorder: Border.all(color: Colors.black, width: 1), // tab button border
              //tabBorder: Border.all(color: Colors.grey, width: 1), // tab button border
              tabShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 0)], // tab button shadow
              curve: Curves.easeOutExpo, // tab animation curves
              duration: Duration(milliseconds: 100), // tab animation duration
              gap: 8, // the tab button gap between icon and text
              color: Colors.grey, // unselected icon color
              activeColor: Colors.white, // selected icon and text color
              iconSize: 24, // tab button icon size
              tabBackgroundColor: Color.fromRGBO(251, 31, 38, 1), // selected tab background color
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), // navigation bar padding
              tabs: const [
                GButton(
                  icon: Icons.build,
                  iconColor: Colors.grey,
                  text: 'Services',
                ),
                GButton(
                  icon: Icons.message_rounded,
                  iconColor: Colors.grey,
                  text: 'Reviews',
                ),
                GButton(
                  icon: Icons.info_outline,
                  iconColor: Colors.grey,
                  text: 'About',
                )
              ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),

          SizedBox(height: 20,),
      Container(
        width: 310, // specify the desired width of the image
        height: 160, // specify the desired height of the image
        /**decoration: BoxDecoration(
          shape: BoxShape.circle, // make the container circular
          border: Border.all(
            color: Colors.grey, // specify the color of the border
            width: 2, // specify the width of the border
          ),
        ),**/
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25), // make the image circular
          child: Image.network(widget.selectedShop['shopLogo']??'',
          fit: BoxFit.cover, // scale the image to cover the entire container
        ),
      ),
    ),
          SizedBox(height: 16,),
          _widgetOptions.elementAt(_selectedIndex),
          SizedBox(height: 20),

        ],
      ),
    ),
      ),
    );
  }
}

