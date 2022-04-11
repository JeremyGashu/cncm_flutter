import 'package:cncm_flutter_new/presentation/pages/homepage/tab_element_account.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class TabProfilePage extends StatelessWidget {
  const TabProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getUserInfo(),
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              return SafeArea(
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding:
                            const EdgeInsets.only(left: 15, top: 5, bottom: 5),
                        // margin: const EdgeInsets.only(left: 15),
                        color: Colors.black,

                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const SizedBox(
                            //   width: 25,
                            // ),

                            const Text(
                              'Profile',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            IconButton(
                              onPressed: () {
                                // Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.notification_important,
                                color: Colors.white,
                              ),
                            ),

                            // const SizedBox(
                            //   width: 25,
                            // ),

                            // const Spacer(),
                          ],
                        ),
                      ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
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
                              '${(snapshot.data as Map)['first_name']} ${(snapshot.data as Map)['middle_name']} ${(snapshot.data as Map)['last_name']}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(
                        height: 30,
                      ),

                      ListView(
                        shrinkWrap: true,
                        children: [
                          Column(
                            children: [
                              ListTile(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, AccountInfoPage.accountInfoPage,
                                      arguments: {
                                        'accountInfo': snapshot.data,
                                      });
                                },
                                leading: const Icon(
                                  Icons.person,
                                ),
                                title: const Text('Account'),
                                trailing: const Icon(Icons.chevron_right),
                              ),
                              const Divider(),
                            ],
                          ),
                          Column(
                            children: [
                              ListTile(
                                onTap: () {},
                                leading: const Icon(Icons.group),
                                title: const Text('My Membership'),
                                trailing: const Icon(Icons.chevron_right),
                              ),
                              const Divider(),
                            ],
                          ),
                          Column(
                            children: [
                              ListTile(
                                onTap: () {},
                                leading: const Icon(
                                  Icons.history,
                                ),
                                title: const Text('Payment History'),
                                trailing: const Icon(Icons.chevron_right),
                              ),
                              const Divider(),
                            ],
                          ),
                          Column(
                            children: [
                              ListTile(
                                onTap: () {},
                                leading: const Icon(
                                  Icons.money,
                                ),
                                title: const Text('Bank Account'),
                                trailing: const Icon(Icons.chevron_right),
                              ),
                              const Divider(),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
              // return Text((snapshot.data as Map)['first_name'] ?? '');
            }
            return const Center(
              child: Text('Cannot find user information!'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}

Future getUserInfo() async {
  Box authBox = Hive.box('authData');
  var authData = await authBox.get('authData', defaultValue: null);
  return authData;
}
