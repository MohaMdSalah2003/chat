import 'package:chat/constants.dart';
import 'package:chat/pages/cubits/cubit/chat_cubit/cubit/chat_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Model/message.dart';
import '../widgets/chatBuble.dart';

class Chat_page extends StatelessWidget {
  static String id = 'ChatPage';
  final lcontroller = ScrollController();
  TextEditingController controller = TextEditingController();
  List<Message> messagesList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Scholar Chat'),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<ChatCubit,ChatState>(
              listener: (context, state) {
                if (state is ChatSuccess){
                  messagesList=state.messages;
                }
              },
              builder: (context, state) {
                
                return ListView.builder(
                    controller: lcontroller,
                    itemCount: messagesList.length,
                    itemBuilder: (context, index) {
                      return chatBuble(
                        message: messagesList[index],
                      );
                    });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: controller,
              onSubmitted: (data) {
                controller.clear();
                lcontroller.animateTo(lcontroller.position.maxScrollExtent,
                    duration: Duration(seconds: 1),
                    curve: Curves.fastOutSlowIn);
              },
              decoration: InputDecoration(
                  hintText: 'Send message',
                  suffix: Icon(
                    Icons.send,
                    color: kPrimaryColor,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: kPrimaryColor))),
            ),
          ),
        ],
      ),
    );
  }
}
