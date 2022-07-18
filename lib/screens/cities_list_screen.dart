import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:keybrad/Utils/app_theme.dart';
import 'package:flutter/services.dart' as root_bundle;
import 'package:flutter_typeahead/flutter_typeahead.dart';
import '../models/cities.dart';
import '../widgets/items_widget/fliter_widget.dart';



class  CitiesListScreen extends StatefulWidget {
  const CitiesListScreen({Key? key}) : super(key: key);
  static const routeName = '/cities_list_screen';

  @override
  State<CitiesListScreen> createState() => _CitiesListScreenState();
}

class _CitiesListScreenState extends State<CitiesListScreen> {
  late List _items = [];
  Future<void> readJson() async {
    final String response = await root_bundle.rootBundle.loadString('assets/jsonFiles/Cities.json');
    //  final String response = await rootBundle.AssetBundleloadString('assets/jsonFiles/Cities.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["Cities"];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: SafeArea(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  child: TypeAheadField<City?>(
                    hideSuggestionsOnKeyboardHide: true,
                    hideOnEmpty: false,

                    textFieldConfiguration:  TextFieldConfiguration(
                      onTap: (){
                        setState(() {
                          _items=[];
                        });
                      },
                      cursorColor: Colors.grey,







                      decoration: InputDecoration(
                        
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: AppTheme.greyTitleColor ),
                          borderRadius: BorderRadius.circular(20),

                        ),



                        prefixIcon: const Icon(Icons.search,color: AppTheme.greyTitleColor,),
                        focusColor: Colors.black,
                        border: OutlineInputBorder(
                          borderSide:const  BorderSide(color: AppTheme.greyTitleColor ),
                          borderRadius: BorderRadius.circular(20),

                        ),
                        hintText: 'Search ',
                      ),
                    ),

                    suggestionsCallback: UserApi.getUserSuggestions,
                    itemBuilder: (context, City? suggestion) {
                      final user = suggestion!;

                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        margin: const EdgeInsets.all(0),
                        child: ListTile(
                          title: Text(user.name),
                        ),
                      );
                    },
                    noItemsFoundBuilder: (context) => const SizedBox(
                      height: 100,
                      child:  Center(
                        child: Text(
                          'No Cities Found.',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                    onSuggestionSelected: (City? suggestion) {
                      final user = suggestion!;

                      Navigator.pushReplacementNamed(
                          context,
                          FilterWidget.routeName,
                          arguments:{user.name}
                      );


                    },
                  ),
                ),
                _items.isNotEmpty
                    ?

                Expanded(
                    child: Container(
                      padding:const EdgeInsets.all(16),
                      child: ListView.builder(
                        itemCount: _items.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: (){

                              Navigator.pushReplacementNamed(
                                  context,
                                  FilterWidget.routeName,
                                  arguments:{_items[index]["Name"]}
                              );

                            },
                            child: Card(
                              margin: const EdgeInsets.all(0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              child: ListTile(

                                title: Text(_items[index]["Name"]),

                              ),
                            ),
                          );
                        },
                      ),
                    )
                ):Container()
              ],
            ),
       
      ),
    );
  }
}


/*class TryScreen extends StatefulWidget {
  static final routeName = '/try_screen';



  @override
  _TryScreenState createState() => new _TryScreenState();
}

class _TryScreenState extends State<TryScreen> {
  TextEditingController editingController = TextEditingController();

  final duplicateItems = List<String>.generate(10000, (i) => "Item $i");
  var items = <String>[];
  late List _items = [];

  Future<void> readJson() async {
    final String response = await rootBundle.rootBundle.loadString('assets/jsonFiles/Cities.json');
    //  final String response = await rootBundle.AssetBundleloadString('assets/jsonFiles/Cities.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["Cities"];
    });
  }


  @override
  void initState() {
    items.addAll(duplicateItems);
    readJson();
    print(_items);
    super.initState();
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = <String>[];
    dummySearchList.addAll(duplicateItems);
    if(query.isNotEmpty) {
      List<String> dummyListData = <String>[];
      dummySearchList.forEach((item) {
        if(item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicateItems);
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  filterSearchResults(value);
                },
                controller: editingController,
                decoration: InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('${items[index]}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

 */