
import 'package:url_launcher/url_launcher.dart';


class OpenLinks {
  static Future openLink({
    required String url,
  }) =>
      _launcherUrl(url);

  static Future _launcherUrl(String url) async {
    if (await canLaunch(url)) await launch(url);
  }

  static openEmail({
    required String toEmail,
  }) async {
    final url = "mailto:$toEmail";
    await _launcherUrl(url);
  }

  static Future openPhoneCall({required String phoneNumber}) async {
    final url = "tel:$phoneNumber";
    await _launcherUrl(url);
  }

  static Future openSMS({required String sms,required String tel}) async {
    var url = "sms:"+tel+"?body="+sms;
    //final url = "sms:$sms";
    await _launcherUrl(url);
  }
  static Future openWhatsapp({required String tel,required String message}) async{
    var whatsappURlAndroid = "whatsapp://send?phone="+tel+"&text="+message;
    await _launcherUrl(whatsappURlAndroid);
  }
}