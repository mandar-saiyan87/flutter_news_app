// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/widgets/image_container.dart';

import '../widgets/custom_tag.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final article = ModalRoute.of(context)!.settings.arguments as Article;

    return ImageContainer(
      imgUrl: article.imgUrl,
      width: double.infinity,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: ListView(
          children: [
            _NewsHeadline(
              article: article,
            ),
            _NewsBody(article: article)
          ],
        ),
      ),
    );
  }
}

class _NewsBody extends StatelessWidget {
  const _NewsBody({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTag(
                backgroundColor: Colors.black,
                children: [
                  CircleAvatar(
                    radius: 10,
                    backgroundImage: NetworkImage(article.authorImageUrl),
                  ),
                  SizedBox(width: 10),
                  Text(
                    article.author,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
              CustomTag(
                backgroundColor: Colors.grey.shade200,
                children: [
                  Icon(
                    Icons.schedule,
                    size: 18,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 5),
                  Text(
                    '${DateTime.now().difference(article.createdAt).inHours} h',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              CustomTag(
                backgroundColor: Colors.grey.shade200,
                children: [
                  Icon(
                    Icons.visibility,
                    size: 18,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 5),
                  Text(
                    '${article.views} views',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            article.title,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            article.body,
            style:
                Theme.of(context).textTheme.bodyMedium!.copyWith(height: 1.5),
          ),
          SizedBox(height: 20),
          GridView.builder(
            shrinkWrap: true,
            itemCount: 2,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 1.25),
            itemBuilder: (context, index) {
              return ImageContainer(
                margin: EdgeInsets.only(right: 5, bottom: 5),
                imgUrl: article.imgUrl,
                width: MediaQuery.of(context).size.width * 0.42,
              );
            },
          )
        ],
      ),
    );
  }
}

class _NewsHeadline extends StatelessWidget {
  final Article article;
  const _NewsHeadline({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.15),
          CustomTag(
            backgroundColor: Colors.grey.withAlpha(150),
            children: [
              Text(
                article.category,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            article.title,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold, height: 1.25),
          ),
          SizedBox(height: 10),
          Text(
            article.subtitle,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
