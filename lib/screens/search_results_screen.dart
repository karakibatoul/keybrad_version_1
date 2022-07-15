import 'package:flutter/material.dart';
import 'package:keybrad/widgets/search_result_widgets/search_result_grid_final.dart';

class SearchResultsScreen extends StatelessWidget {
  const SearchResultsScreen({Key? key}) : super(key: key);
  static const routeName = '/search_results_screen.dart';

  @override
  Widget build(BuildContext context) {
    return
    const Scaffold(body: SearchResultFinal() );
  }
}
