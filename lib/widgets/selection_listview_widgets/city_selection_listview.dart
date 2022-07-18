
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Utils/app_theme.dart';
import '../../Utils/city_utils.dart';
import '../../models/cities.dart';
import '../../providers/city_provider.dart';
import '../search_widget.dart';
import 'city_listtile_widget.dart';


class CitySelectionListview extends StatefulWidget {
  static const  routeName = '/city_selection_listview_screen';
  final bool isMultiSelection;
  final List<City> countries;
  final String returnPage;

   const CitySelectionListview({Key? key,
    this.isMultiSelection = true,
    this.countries = const [],
    this.returnPage = ''
  }) : super(key: key);
@override
  _CitySelectionListviewState createState() => _CitySelectionListviewState();
}

class _CitySelectionListviewState extends State<CitySelectionListview> {
  String text = '';
  List<City> selectedCountries = [];
  bool isNative = false;

  @override
  void initState() {
    super.initState();
    selectedCountries = widget.countries;
  }


  bool containsSearchText(City country) {
    final name =  country.name;
    final textLower = text.toLowerCase();
    final countryLower = name.toLowerCase();

    return countryLower.contains(textLower);
  }

  List<City> getPrioritizedCountries(List<City> countries) {
    final notSelectedCountries = List.of(countries)
      ..removeWhere((country) => selectedCountries.contains(country));

    return [
      ...List.of(selectedCountries)..sort(Utils.ascendingSort),
      ...notSelectedCountries,
    ];
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CityProvider>(context);
    final allCountries = getPrioritizedCountries(provider.countries);
    final countries = allCountries.where(containsSearchText).toList();
    final label = widget.isMultiSelection ? 'Countries' : 'Country';

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: Text('Select $label ',style:const TextStyle(color: Colors.black),),
        backgroundColor: AppTheme.greyBackgroundColor,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: SearchWidget(
            text: text,
            onChanged: (text) => setState(() => this.text = text),
            hintText: 'Search ',
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: countries.map((country) {
                final isSelected = selectedCountries.contains(country);
                return CityListTileWidget(

                  country: country,
                  isNative: isNative,
                  isSelected: isSelected,
                  onSelectedCountry: selectCountry,
                );

              }).toList(),
            ),
          ),
          buildSelectButton(context),
        ],
      ),
    );
  }

  Widget buildAppBar() {
    final label = widget.isMultiSelection ? 'Countries' : 'Country';

    return AppBar(
      title: Text('Select $label'),

      bottom: PreferredSize(
        preferredSize:const Size.fromHeight(60),
        child: SearchWidget(
          text: text,
          onChanged: (text) => setState(() => this.text = text),
          hintText: 'Search $label',
        ),
      ),
    );
  }

  Widget buildSelectButton(BuildContext context) {
    final label = widget.isMultiSelection
        ? 'Select ${selectedCountries.length} Countries'
        : 'Continue';

    return Container(
      padding:const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
      color: Theme.of(context).primaryColor,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:const StadiumBorder(),
          minimumSize:const Size.fromHeight(40),
          primary: Colors.white,
        ),
        child: Text(
          label,
          style:const TextStyle(color: Colors.black, fontSize: 16),
        ),
        onPressed: submit,
      ),
    );
  }

  void selectCountry(City country) {
    if (widget.isMultiSelection) {
      final isSelected = selectedCountries.contains(country);
      setState(() => isSelected
          ? selectedCountries.remove(country)
          :selectedCountries = [...selectedCountries, country]

      );
    } else {
      Navigator.pop(context, country);
    }
  }

  void submit() {
    final args = ModalRoute.of(context)!.settings.arguments;
    Navigator.pushReplacementNamed(
        context,
        args.toString(),
        arguments: ScreenArguments(selectedCountries, selectedCountries.length));

  }
}
class ScreenArguments {
  final List<City> city;
  final int nbrOfCities;

  ScreenArguments(this.city, this.nbrOfCities);
}