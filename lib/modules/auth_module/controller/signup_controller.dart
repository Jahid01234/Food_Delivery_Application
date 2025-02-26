import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery_application/common/snack_bar_message/my_snackbar_message.dart';
import 'package:get/get.dart';

class SignupController extends GetxController{

  RxBool obscureText = true.obs;
  RxBool isKeepMeSignInEnabled = true.obs;
  RxBool isEmailMeAboutPricing = true.obs;

  // sign up method........
  void createAccount({required String userName,required String email,required String password,context}) async{
    try{
      final UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
      );
      if(userCredential.user !=null){
        mySnackBarMessage("User created!", context);
      }
    }on FirebaseException catch(e){
      if(e.code == "weak-password"){
        mySnackBarMessage("The password provided is too weak!", context);
      }else if(e.code == "email-already-in-use"){
        mySnackBarMessage("The account already exists for that email!", context);
      }
    } catch(e){
      mySnackBarMessage( e.toString(), context);
    }
  }


}