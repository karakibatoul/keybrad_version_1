// @dart=2.9


import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keybrad/providers/categories.dart';
import 'package:keybrad/providers/category_provider.dart';
import 'package:keybrad/providers/city_provider.dart';
import 'package:keybrad/providers/imageFiles.dart';
import 'package:keybrad/providers/image_file.dart';
import 'package:keybrad/providers/item_image.dart';
import 'package:keybrad/providers/item_images.dart';
import 'package:keybrad/providers/item_images_prime.dart';
import 'package:keybrad/screens/about_us_screen.dart';
import 'package:keybrad/screens/add_item_screen.dart';
import 'package:keybrad/screens/add_item_step_2_screen.dart';
import 'package:keybrad/screens/categories_screen.dart';
import 'package:keybrad/screens/cities_list_screen_unused.dart';
import 'package:keybrad/screens/common_item_screen.dart';
import 'package:keybrad/screens/contact_us_screen.dart';
import 'package:keybrad/screens/edit_item_screen.dart';
import 'package:keybrad/screens/favorite_empty_screen.dart';
import 'package:keybrad/screens/favorites_screen.dart';
import 'package:keybrad/screens/filter_image_page.dart';
import 'package:keybrad/screens/image_filter_screen.dart';
import 'package:keybrad/screens/image_filter_screen_without_filters.dart';
import 'package:keybrad/screens/item_details.dart';
import 'package:keybrad/screens/item_edit_screen.dart';
import 'package:keybrad/screens/landing_all_empty_screen.dart';
import 'package:keybrad/screens/landing_categories.dart';
import 'package:keybrad/screens/login_screen.dart';
import 'package:keybrad/screens/my_items_empty_1.dart';
import 'package:keybrad/screens/my_items_empty_2.dart';
import 'package:keybrad/screens/my_items_empty_3.dart';
import 'package:keybrad/screens/my_items_screen.dart';
import 'package:keybrad/screens/my_profile_screen.dart';
import 'package:keybrad/screens/normal_screen.dart';
import 'package:keybrad/screens/phising_screen.dart';
import 'package:keybrad/screens/recently_viewed_items_screen.dart';
import 'package:keybrad/screens/search_results_screen.dart';
import 'package:keybrad/screens/search_screen.dart';
import 'package:keybrad/screens/show_picture_final%20_screen.dart';
import 'package:keybrad/screens/sign_up_screen.dart';
import 'package:keybrad/screens/splash_screen.dart';
import 'package:keybrad/screens/tabs_screen.dart';
import 'package:keybrad/screens/cities_list_screen.dart';
import 'package:keybrad/screens/take_picture_screen.dart';
import 'package:keybrad/screens/try_screen.dart';
import 'package:keybrad/screens/user_details_screen.dart';
import 'package:keybrad/widgets/add_item_widgets/choose_library_camera_dialog.dart';
import 'package:keybrad/widgets/image_effects_widget.dart';
import 'package:keybrad/widgets/items_widget/fliter_widget.dart';
import 'package:keybrad/widgets/items_widget/items_widget.dart';
import 'package:keybrad/widgets/selection_listview_widgets/city_selection_listview.dart';
import '/Utils/app_theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'screens/show_picture_page.dart';
import 'widgets/login_widgets/half_background_widget.dart';
import 'widgets/login_widgets/sign_up_model.dart';
import 'package:provider/provider.dart';
import 'package:keybrad/providers/items.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:keybrad/Utils/app_theme.dart';


/*void main()  {

  runApp( MyApp());
}

 */


Future<void> main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  /*WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;

  runApp(MyApp(firstCamera: firstCamera,));

   */
  GestureBinding.instance?.resamplingEnabled = true;
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
   MyApp({Key key, this.firstCamera}) : super(key: key);
   final selectedCountry=new ValueNotifier('') ;
   final firstCamera;


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppTheme.greyBackgroundColor,
      //statusBarBrightness: Brightness.dark
      statusBarIconBrightness: Brightness.dark

    ));
    return
    MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (ctx) => Categories(),
          ),
          ChangeNotifierProvider(
            create: (ctx) => Items(),
          ),
          ChangeNotifierProvider(
            create: (ctx) => ItemImages(),
          ),
          ChangeNotifierProvider(
            create: (ctx) => ItemImagesPrime(),
          ),
          ChangeNotifierProvider(
            create: (ctx) => CityProvider(),
          ),
          ChangeNotifierProvider(
            create: (ctx) => CategoryProvider(),
          ),
          ChangeNotifierProvider(
            create: (ctx) => ImageFiles(),
          ),
        ],
        child:


       MaterialApp(
         debugShowCheckedModeBanner: false,
          builder: (context, widget) => ResponsiveWrapper.builder(
              BouncingScrollWrapper.builder(context, widget),
              maxWidth: 1200,
              minWidth: 450,
              defaultScale: true,
              breakpoints: [
                const ResponsiveBreakpoint.resize(450, name: MOBILE),
                const ResponsiveBreakpoint.autoScale(800, name: TABLET),
                const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
                const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
                const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
              ],
              background: //Container(color: const Color(0xFFF5F5F5))
              Container(
                  color:  AppTheme.greyBackgroundColor)
          ),

          title: 'Flutter Demo',
          theme: ThemeData(
            backgroundColor: AppTheme.greyBackgroundColor,
            accentColor: AppTheme.textOrange,
            primaryColor: AppTheme.greyBackgroundColor,
              scaffoldBackgroundColor: AppTheme.greyBackgroundColor,

          ),

          home:
          ResponsiveSizer(
    builder: (context, orientation, screenType) {
            return
            SplashScreen();
    }),
          // const MyHomePage(title: 'Flutter Demo Home Page'),
          routes: {
            LoginScreen.routeName: (ctx) => const LoginScreen(),
            ImageFilterScreen.routeName: (ctx) => const ImageFilterScreen(title: 'title'),
            ImageEffectWidget.routeName: (ctx) => const ImageEffectWidget(),
            EditItemScreen.routeName: (ctx) => const EditItemScreen(),
            MyItemsScreen.routeName: (ctx) => const MyItemsScreen(),
            CommonItemScreen.routeName: (ctx) =>  const CommonItemScreen(index: 0),
           // TakePictureScreen.routeName: (ctx) => TakePictureScreen(camera: firstCamera),
            AboutUsScreen.routeName: (ctx) =>const  AboutUsScreen(),
            ItemDetails.routeName: (ctx) =>const  ItemDetails(indexPage: 0,),
            AddItemScreen.routeName: (ctx) =>const  AddItemScreen(),
            AddItemStep2Screen.routeName: (ctx) =>const  AddItemStep2Screen(),
            ItemEditScreen.routeName: (ctx) =>  ItemEditScreen(pageIndex: 0,),
            SearchScreen.routeName: (ctx) =>const  SearchScreen(),
            SearchResultsScreen.routeName: (ctx) => const SearchResultsScreen(),
            MyProfileScreen.routeName: (ctx) => const MyProfileScreen(),
            ContactUsScreen.routeName: (ctx) => const ContactUsScreen(),
            RecentlyViewedItemsScreen.routeName: (ctx) => const RecentlyViewedItemsScreen(),
            FavoriteScreen.routeName: (ctx) =>const  FavoriteScreen(),
            UserDetailsScreen.routeName: (ctx) =>const UserDetailsScreen(),
            PhishingScreen.routeName: (ctx) =>const PhishingScreen(phisingIndex: 0,),
            LandingCategories.routeName: (ctx) => const LandingCategories(),
            MyItemsEmpty1.routeName: (ctx) =>const  MyItemsEmpty1(),
            MyItemsEmpty2.routeName: (ctx) => const MyItemsEmpty2(),
            MyItemsEmpty3.routeName: (ctx) =>const MyItemsEmpty3(showAppbar: true,),
            TryScreen.routeName: (ctx) => TryScreen(),
            CitySelectionListview.routeName: (ctx) =>const  CitySelectionListview(),
            FilterWidget.routeName: (ctx) => FilterWidget(),
            CitiesListScreenUnused.routeName: (ctx) => const CitiesListScreenUnused(),
            SignUpScreen.routeName: (ctx) =>const  SignUpScreen(),
            CategoriesScreen.routeName: (ctx) => const CategoriesScreen(),
            TabsScreen.routeName: (ctx) => const TabsScreen(),
            ItemWidget.routeName: (ctx) => const ItemWidget(index: 0,),
            CitiesListScreen.routeName:(ctx)=>const CitiesListScreen(),
            LandingAllEmptyScreen.routeName:(ctx)=>const LandingAllEmptyScreen(),
            FilterImagePage.routeName:(ctx)=> FilterImagePage(),
            ShowPicturePage.routeName:(ctx)=> ShowPicturePage(),
            FavoriteEmptyScreen.routeName:(ctx)=>const FavoriteEmptyScreen(),
            ChooseLibraryCameraDialog.routeName:(ctx)=>const ChooseLibraryCameraDialog(),
            NormalPage.routeName:(ctx)=>const NormalPage(),
            ImageFilterScreenWithoutFilters.routeName:(ctx)=>const ImageFilterScreenWithoutFilters(title: '',),
          },
        )
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, @required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.greyBackgroundColor,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HalfBackgroundWidget(),
            SignUpModel(),
          ],
        ),
      ),
    );
  }
}