 import 'package:local_auth/local_auth.dart';

class Authentication{
  static final _auth = LocalAuthentication();
  static Future<bool> canAuth() async => await _auth.canCheckBiometrics || await _auth.isDeviceSupported();
 static Future<bool> authentication () async {
  try{
    if(!await canAuth()) return false;
    return await _auth.authenticate(localizedReason: "go to the app");
  }catch(e){
    print('error $e ');
    return false;
  }
 }
}