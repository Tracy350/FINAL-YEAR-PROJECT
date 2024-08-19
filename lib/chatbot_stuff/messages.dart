import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trial2/utils/colors.dart';

class MessagesScreen extends StatefulWidget {
  final List messages;
  const MessagesScreen({Key? key, required this.messages}) : super(key: key);

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return ListView.separated(
      itemBuilder: (context, index) {
        bool isUserMessage = widget.messages[index]['isUserMessage'];
        return Container(
          margin: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: isUserMessage
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(isUserMessage ? 0 : 20),
                    topLeft: Radius.circular(isUserMessage ? 20 : 0),
                  ),
                  color: isUserMessage
                      ? AppColors.green1
                      : AppColors.chatmessage,
                ),
                constraints: BoxConstraints(maxWidth: w * 2 / 3),
                child: Text(
                  widget.messages[index]['message'].text.text[0],
                  style: GoogleFonts.montserrat(textStyle: TextStyle(
                    fontSize: 20,
                    color: isUserMessage ? Colors.white : Colors.black, // Change the color here
                  ),)
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (_, i) => Padding(padding: EdgeInsets.only(top: 10)),
      itemCount: widget.messages.length,
    );
  }
}
