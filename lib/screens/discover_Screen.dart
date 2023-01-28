// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:flutter/material.dart';
import 'package:news_app/widgets/image_container.dart';

import '../models/article_model.dart';
import '../widgets/bottom_navbar.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> tabs = ['Health', 'Politics', 'Arts', 'Food', 'Science'];

    return DefaultTabController(
      length: tabs.length,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              )),
        ),
        bottomNavigationBar: BottomNavBar(index: 1),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            _DiscoverNews(),
            _CategoryNews(tabs: tabs),
          ],
        ),
      ),
    );
  }
}

class _CategoryNews extends StatelessWidget {
  final List<String> tabs;
  const _CategoryNews({Key? key, required this.tabs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final articles = Article.articles;
    return Column(
      children: [
        TabBar(
          isScrollable: true,
          indicatorColor: Colors.black,
          tabs: tabs
              .map(
                (tab) => Tab(
                  icon: Text(
                    tab,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              )
              .toList(),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: TabBarView(
            children: tabs
                .map(
                  (tab) => ListView.builder(
                    shrinkWrap: true,
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/article',
                              arguments: articles[index]);
                        },
                        child: Row(
                          children: [
                            ImageContainer(
                                margin: EdgeInsets.all(10),
                                borderRadius: 5,
                                width: 80,
                                height: 80,
                                imgUrl: articles[index].imgUrl),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    articles[index].title,
                                    maxLines: 2,
                                    overflow: TextOverflow.clip,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Icon(Icons.schedule, size: 18),
                                      SizedBox(width: 5),
                                      Text(
                                        '${DateTime.now().difference(articles[index].createdAt).inHours} hrs ago',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      SizedBox(width: 20),
                                      Icon(Icons.visibility, size: 18),
                                      SizedBox(width: 5),
                                      Text(
                                        '${articles[index].views} views',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

class _DiscoverNews extends StatelessWidget {
  const _DiscoverNews({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Discover',
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Colors.black, fontWeight: FontWeight.w900),
          ),
          SizedBox(height: 5),
          Text('New from all over the world!',
              style: Theme.of(context).textTheme.bodySmall),
          SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Search',
              fillColor: Colors.grey.shade200,
              filled: true,
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
              suffixIcon: RotatedBox(
                quarterTurns: 1,
                child: Icon(
                  Icons.tune,
                  color: Colors.grey,
                ),
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none),
            ),
          )
        ],
      ),
    );
  }
}
