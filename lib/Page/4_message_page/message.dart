import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class messagePage extends StatefulWidget {
  const messagePage({super.key});

  @override
  State<messagePage> createState() => _messagePageState();
}

class _messagePageState extends State<messagePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '쪽지 기능',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserListScreen(),
    );
  }
}

class Message {
  final String text;
  final String nickname;
  final DateTime timestamp;

  Message(this.text, this.nickname, this.timestamp);
}

class UserListScreen extends StatelessWidget {
  final List<String> users = ["유저1", "유저2", "유저3"];

  UserListScreen({super.key}); // 유저 목록

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('쪽지'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(users[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen(user: users[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  final String user;

  const ChatScreen({super.key, required this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Message> _messages = [];
  final TextEditingController _textController = TextEditingController();
  final String _currentNickname = "닉네임";

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  void _loadMessages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? messageList = prefs.getStringList(widget.user);
    if (messageList != null) {
      setState(() {
        _messages.addAll(
          messageList.map((msg) {
            List<String> msgData = msg.split('|');
            return Message(
              msgData[0],
              msgData[1],
              DateTime.parse(msgData[2]),
            );
          }),
        );
      });
    }
  }

  void _handleSubmitted(String text) async {
    _textController.clear();
    setState(() {
      _messages.insert(0, Message(text, _currentNickname, DateTime.now()));
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> messageList = _messages.map((msg) {
      return "${msg.text}|${msg.nickname}|${msg.timestamp.toIso8601String()}";
    }).toList();
    prefs.setStringList(widget.user, messageList);
  }

  Widget _buildTextComposer() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextField(
              controller: _textController,
              onSubmitted: _handleSubmitted,
              decoration: const InputDecoration.collapsed(
                hintText: "쪽지 보내기",
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () => _handleSubmitted(_textController.text),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user), // 대화 상대 이름 표시
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (_, int index) {
                return _buildMessage(_messages[index]);
              },
            ),
          ),
          const Divider(height: 1.0),
          _buildTextComposer(),
        ],
      ),
    );
  }

  Widget _buildMessage(Message message) {
    final bool isMe = message.nickname == _currentNickname;
    final Container messageBox = Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: isMe ? Colors.white : Colors.blue[100],
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            message.nickname,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isMe ? const Color.fromARGB(255, 0, 0, 0) : Colors.black,
            ),
          ),
          const SizedBox(height: 5.0),
          Text(
            message.text,
            style: const TextStyle(fontSize: 16.0),
          ),
          const SizedBox(height: 5.0),
          Text(
            DateFormat('HH:mm').format(message.timestamp),
            style: const TextStyle(color: Colors.grey, fontSize: 12.0),
          ),
        ],
      ),
    );

    if (isMe) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          messageBox,
        ],
      );
    }

    return messageBox;
  }
}
