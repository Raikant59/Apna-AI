import 'package:chatbot_app/data/remote/api/api_helper.dart';
import 'package:chatbot_app/data/remote/api/urls.dart';
import 'package:chatbot_app/utils/utils_helper.dart';
import 'package:flutter/material.dart';

class Chatscreen extends StatefulWidget {
  const Chatscreen({super.key});

  @override
  State<Chatscreen> createState() => _ChatscreenState();
}

class _ChatscreenState extends State<Chatscreen> {
  var promptcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        title: const Text("Apna AI",style: TextStyle(fontFamily: 'mainfont'),),
      ),
      body: Column(
        children: [
          Expanded(child: Container(
          )),
          TextField(
            style: mTextStyle16(mColor: Colors.grey),
            controller: promptcontroller,
            enableSuggestions: true,
            decoration: InputDecoration(
              fillColor: AppColors.secondaryColor,
              filled: true,
              prefixIcon: const Icon(Icons.mic),
              suffixIcon: InkWell(
                onTap: (){
                  ApiHelper().generateAIMsg(url: urls.CHAT_COMPLETION_API, prompt: promptcontroller.text);
                  promptcontroller.clear();
                },
                  child: const Icon(Icons.send)),
              hintText: "Write a Question..",
              hintStyle: mTextStyle16(mColor: AppColors.mGreyColor),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(21),
              )
            ),
          )
        ],
      )
    );
  }
}