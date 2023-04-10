
import '../../../Models/Add or Delete Favorite Model/change_favorite_model.dart';
import '../../../Models/Login Model/login_model.dart';

abstract class ShopStates {}

class ShopInitialState extends ShopStates {}

class ChangeBottomNavigationBarIndex extends ShopStates {}

class ChangeIndicatorIndex extends ShopStates {}

class ShopLoadingHomeDataState extends ShopStates {}

class ShopSuccessHomeDataState extends ShopStates {}

class ShopErrorHomeDataState extends ShopStates {}

class ShopSuccessCategoriesState extends ShopStates {}

class ShopErrorCategoriesState extends ShopStates
{
  final String error;

  ShopErrorCategoriesState(this.error);

}

class ShopLoadingGetProductDetailsState extends ShopStates {}

class ShopSuccessGetProductDetailsState extends ShopStates {}

class ShopErrorGetProductDetailsState extends ShopStates
{
  final String onError;

  ShopErrorGetProductDetailsState(this.onError);
}

class ShopLoadingFAQSState extends ShopStates {}

class ShopSuccessFAQSState extends ShopStates {}

class ShopErrorFAQSState extends ShopStates
{
  final String error;

  ShopErrorFAQSState(this.error);

}

class ShopLoadingGetProductsCategoriesState extends ShopStates {}

class ShopSuccessGetProductsCategoriesState extends ShopStates {}

class ShopErrorGetProductsCategoriesState extends ShopStates
{
  final String error;

  ShopErrorGetProductsCategoriesState(this.error);

}
//Favorite Screen
class ShopChangeFavoriteState extends ShopStates {}

class ShopSuccessChangeFavoriteState extends ShopStates
{
  final ChangeFavoriteModel changeFavoriteModel;

  ShopSuccessChangeFavoriteState(this.changeFavoriteModel);
}

class ShopErrorChangeFavoriteState extends ShopStates
{
  final String error;

  ShopErrorChangeFavoriteState(this.error);

}

class ShopLoadingGetFavoritesState extends ShopStates {}

class ShopSuccessGetFavoritesState extends ShopStates {}

class ShopErrorGetFavoritesState extends ShopStates {}


//Cart Screen
// class ShopChangeCartState extends ShopStates {}
//
// class ShopSuccessChangeCartState extends ShopStates
// {
//   final ChangeCartModel changeCartModel;
//
//   ShopSuccessChangeCartState(this.changeCartModel);
// }
//
// class ShopErrorChangeCartState extends ShopStates
// {
//   final String error;
//
//   ShopErrorChangeCartState(this.error);
//
// }

class ShopLoadingGetCartState extends ShopStates {}

class ShopSuccessGetCartState extends ShopStates {}

class ShopErrorGetCartState extends ShopStates {}



class ShopLoadingUserDataState extends ShopStates {}

class ShopSuccessUserDataState extends ShopStates
{
  final ShopLoginModel userData;

  ShopSuccessUserDataState(this.userData);
}

class ShopErrorUserDataState extends ShopStates
{
  final String userDataError;

  ShopErrorUserDataState(this.userDataError);
}



class ShopLoadingUpdateUserDataState extends ShopStates {}

class ShopSuccessUpdateUserDataState extends ShopStates
{
  final ShopLoginModel userData;

  ShopSuccessUpdateUserDataState(this.userData);
}

class ShopErrorUpdateUserDataState extends ShopStates
{
  final String userDataError;

  ShopErrorUpdateUserDataState(this.userDataError);
}