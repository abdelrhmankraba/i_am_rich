import 'package:i_am_rich/modules/shop_app/login/shop_login_screen.dart';
import 'package:i_am_rich/shared/components/components.dart';
import 'package:i_am_rich/shared/network/local/cache_helper.dart';


String? token = '';


void signOut (context){
  CacheHelper.removeData(key: 'token').then((value){
    if(value)
      {
        navigateAndFinish(context, const ShopLoginScreen());
      }

  });
}