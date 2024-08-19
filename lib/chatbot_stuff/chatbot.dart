import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trial2/chatbot_stuff/messages.dart';
import 'package:trial2/utils/colors.dart';

class Chatbot extends StatefulWidget {
  const Chatbot({super.key});

  @override
  State<Chatbot> createState() => _ChatbotState();
}

class _ChatbotState extends State<Chatbot> {
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _chatcontroller = TextEditingController();

  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    // TODO: implement initState

    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.chatinput,
      appBar: AppBar(
        title: Text(
          'ChatBot',
          style: GoogleFonts.montserrat(
              textStyle: TextStyle(fontWeight: FontWeight.w600)),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(child: MessagesScreen(messages: messages)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            //  color: Colors.red,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _chatcontroller, // Add this line
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Type your message...',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                       
                      ),
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.green1,
                      borderRadius: BorderRadius.circular(20),
                      
                    ),
                    child: IconButton(
                            onPressed: () {
                              String text = _chatcontroller.text.trim();
                              sendMessage(text);
                              _chatcontroller.clear();
                            },
                            icon: Icon(Icons.send, color: Colors.white,),
                          ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  sendMessage(String text) async {
    if (text.isEmpty) {
      print('Message is empty');
    } else {
      print('Message sent: $text');
      setState(() {
        addMessage(Message(text: DialogText(text: [text])), true);
      });

      DetectIntentResponse response = await dialogFlowtter.detectIntent(
          queryInput: QueryInput(text: TextInput(text: text)));
      if (response.message == null) return;
      setState(() {
        addMessage(response.message!);
      });
    }
  }

  addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({'message': message, 'isUserMessage': isUserMessage});
  }
}
