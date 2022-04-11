import 'package:flutter/material.dart';

class AccountInfoPage extends StatelessWidget {
  final Map? accountInfo;
  const AccountInfoPage({Key? key, this.accountInfo}) : super(key: key);

  static const String accountInfoPage = 'account info page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.pop(context);
            },
            icon: const Icon(
              Icons.notification_important,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey.withOpacity(0.2),
            width: double.infinity,
            padding: const EdgeInsets.all(50),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Color(0XFFF1F1F7),
                  child: Center(
                    child: Icon(
                      Icons.person,
                      color: Colors.green,
                      size: 40,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '${accountInfo?['first_name']} ${accountInfo?['middle_name']} ${accountInfo?['last_name']}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),

          //
          ListView(
            shrinkWrap: true,
            children: [
              Column(
                children: [
                  ListTile(
                    onTap: () {},
                    leading: const Icon(
                      Icons.person,
                      color: Colors.green,
                    ),
                    title: Text(
                      '${accountInfo?['first_name']} ${accountInfo?['middle_name']} ${accountInfo?['last_name']}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Divider(),
                ],
              ),
              Column(
                children: [
                  ListTile(
                    onTap: () {},
                    leading: const Icon(
                      Icons.phone,
                      color: Colors.green,
                    ),
                    title: Text(
                      '${accountInfo?['phone']}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Divider(),
                ],
              ),
              Column(
                children: [
                  ListTile(
                    onTap: () {},
                    leading: const Icon(
                      Icons.date_range,
                      color: Colors.green,
                    ),
                    title: Text(
                      '${accountInfo?['age']}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Divider(),
                ],
              ),
              Column(
                children: [
                  ListTile(
                    onTap: () {},
                    leading: const Icon(
                      Icons.person,
                      color: Colors.green,
                    ),
                    title: Text(
                      '${accountInfo?['sex']}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Divider(),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
