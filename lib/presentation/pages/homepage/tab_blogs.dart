import 'package:cncm_flutter_new/presentation/blocs/newsfeed/newfeed_state.dart';
import 'package:cncm_flutter_new/presentation/blocs/newsfeed/newsfeed_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeago/timeago.dart' as timeago;

class TabsBlog extends StatelessWidget {
  const TabsBlog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsFeedBloc, NewsFeedState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            'Blogs',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              state is LoadedNewsFeed
                  ? SliverToBoxAdapter(
                      child: ListView.builder(
                          itemCount: state.newsFeed.length,
                          shrinkWrap: true,
                          primary: false,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (ctx, index) {
                            return Container(
                              height: 350,
                              margin: const EdgeInsets.all(5),
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      height: 250,
                                      child: Image.asset(
                                        'assets/header_element.png',
                                        fit: BoxFit.cover,
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Text(state.newsFeed[index].title,
                                        style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15,
                                            letterSpacing: 1.05)),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    width: double.infinity,
                                    child: Text(
                                        timeago
                                            .format(state.newsFeed[index].time),
                                        textAlign: TextAlign.right,
                                        style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                            letterSpacing: 1.05)),
                                  ),
                                ],
                              ),
                            );
                          }),
                    )
                  : const SliverToBoxAdapter(
                      child: SizedBox(),
                    )
            ],
          ),
        ),
      );
    });
  }
}
