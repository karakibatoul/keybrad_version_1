import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' as root_bundle;
import 'package:keybrad/screens/cities_list_screen.dart';
import 'package:keybrad/widgets/items_widget/fliter_widget.dart';

import '../widgets/search_widget.dart';


class CitiesListScreenUnused extends StatefulWidget {
  const CitiesListScreenUnused({Key? key}) : super(key: key);
  static const routeName = '/cities_list_screen_unused';

  @override
  State<CitiesListScreenUnused> createState() => _CitiesListScreenUnusedState();
}

class _CitiesListScreenUnusedState extends State<CitiesListScreenUnused> {
  late List _items = [];
  String searchString='';
  String query = '';

  final selectedCountry= ValueNotifier('') ;



  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await root_bundle.rootBundle.loadString('assets/jsonFiles/Cities.json');
  //  final String response = await rootBundle.AssetBundleloadString('assets/jsonFiles/Cities.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["Cities"];
    });
  }

  /*Future<void> _goToPage2() async {
    await Navigator.push(

      context,

      MaterialPageRoute(

        builder: (context) => FilterWidget(selectedCountry: null,),
      ),

    );
    print("Page2 is poped");
  }

   */

  @override
  void initState() {
    // TODO: implement initState
    readJson();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    void searchBook(String query) {

      final List books = _items.where((city) {

        final titleLower = city["Name"].toLowerCase();
        // final authorLower = book.author.toLowerCase();
        final searchLower = query.toLowerCase();

        return titleLower.contains(searchLower) ;

      }).toList();

      setState(() {
        this.query = query;
        _items = books;
      });
    }
    Widget buildSearch() => SearchWidget(
      text: query,
      hintText: 'Title or Author Name',
      onChanged: searchBook,
    );



    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Kindacode.com',
        ),
       /* actions: [
          IconButton(icon: const Icon(Icons.search),
            onPressed: (){
            showSearch(context: context, delegate: MySearchDelegate());
            },
          )
        ],*/
      ),
      body: ValueListenableBuilder<String>(
        valueListenable: selectedCountry,
        builder: (context, value, child) =>
       Padding(
      padding: const EdgeInsets.all(0),
      child: Column(
        children: [
          ElevatedButton(
            child: const Text('Load Data'),
            onPressed: readJson,
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: TextField(
              onTap: (){
                Navigator.pushNamed(context, CitiesListScreen.routeName);
              },
              onChanged: (value) {
                setState(() {
                  searchString = value.toLowerCase();
                });
              },
              decoration: const InputDecoration(
                labelText: 'Search',
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          const SizedBox(height: 10),
          buildSearch(),




          // Display the data loaded from sample.json
          _items.isNotEmpty
              ?

          Expanded(
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      //_goToPage2();

                      selectedCountry.value = _items[index]["Name"];
                     /* Navigator.push(

                        context,

                        MaterialPageRoute(

                          builder: (context) => FilterWidget(),
                        ),

                      );

                      */

                      Navigator.pushNamed(
                          context,
                          FilterWidget.routeName,
                          arguments:{_items[index]["Name"]}
                      );


                    },
                    child: Card(
                      margin: const EdgeInsets.all(0),
                      child: ListTile(

                        title: Text(_items[index]["Name"]),

                      ),
                    ),
                  );
                },
              )
          ):Container()



        ],
      ),
    ),),

      );


  }


}


