import 'NavigationHelpers.dart';
import '../../Pages/HomeScreen/HomeScreen.dart';

enum Routes {
  HomeScreen,
  FirstScreen,
  SecondScreen,
  ThirdScreen,
  BottomNavScreen
}

class Pages{
  //! Data for Bottom Nav Config 
  Object? data; 
   
  //! Screen Config
   static final PageConfig homeScreenConfig = PageConfig( route: Routes.HomeScreen, build: (_) => HomeScreen(extraData: homeScreenConfig.data));

  //! Bottom Nav Config as final not as static
  //late final PageConfig bottomNavScreenConfig = PageConfig(route: Routes.BottomNavScreen, build: (_) => BottomNavigationScreen(extraData: data), 
  //  );
}
