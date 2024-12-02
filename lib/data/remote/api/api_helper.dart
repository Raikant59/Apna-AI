import 'dart:convert';
import 'dart:io';
import 'package:chatbot_app/data/remote/api/urls.dart';
import 'package:http/http.dart' as httpClient;
class ApiHelper{
  Future<dynamic> generateAIMsg({required String url,required String prompt})async{
    try{
      var mUri=Uri.parse(url);
      var response = await httpClient.post( mUri , body:
        jsonEncode({
            "model": "gpt-3.5-turbo-0125",
            "messages": [{"role": "user","content": prompt}],
        }),
      headers : {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${urls.CHAT_COMPLETION_API_KEY}"
      });
      print(response.body.toString());
      if(response.statusCode==200){
        var mData = jsonDecode(response.body);
        if(mData['Error']!=null){
          throw(HttpException("Error: ${mData['error']['message']}"));
        }else{
          return mData;
        }
      }else{
        throw(HttpException("Error :${response.statusCode}"));
      }
    }catch(e){
      throw(HttpException(e.toString()));
    }
  }
}