import 'package:google_sign_in/google_sign_in.dart';
import 'package:pocketbase/pocketbase.dart';

final pb = PocketBase('https://aiden.pockethost.io');
 var authData;
class Authentication {
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  
  // Future<UserCredential?> signInWithGoogle() async {
  //   try {
  //     final GoogleSignInAccount? googleSignInAccount =
  //         await GoogleSignIn().signIn();
  //     final GoogleSignInAuthentication googleSignInAuthentication =
  //         await googleSignInAccount!.authentication;

  //     final OAuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleSignInAuthentication.accessToken,
  //       idToken: googleSignInAuthentication.idToken,
  //     );

  //     return await FirebaseAuth.instance.signInWithCredential(credential);
  //   } catch (e) {
  //     print("Google Sign-In Error: $e");
  //     return null;
  //   }
  // }

  // Future<void> signOut() async {
  //   await _auth.signOut();
  //   await GoogleSignIn().signOut();
  // }






adminLogin({email,password})async{
print("-----------------------");
 authData = await pb.admins.authWithPassword(email, password);

print("au${pb.authStore.isValid}");
print(pb.authStore.token);
print(pb.authStore.model);


}

}
