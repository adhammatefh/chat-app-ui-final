
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../chats/components/body.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  int _selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body:  Body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: kPrimaryColor,
        child: const Icon(
          Icons.person_add_alt_1,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: kPrimaryColor,
      title: const Text(
        "Chats",
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        )
      ],
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectIndex,
      onTap: (value) {
        setState(() {
          _selectIndex = value;
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.messenger),
          label: "Chats",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: "People",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.call),
          label: "Calls",
        ),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            radius: 14,
            backgroundImage: AssetImage(
              "assets/images/user_2.png",
            ),
          ),
          label: "Profile",
        ),
      ],
    );
  }
}
