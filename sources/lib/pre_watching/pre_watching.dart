import 'package:flutter/material.dart';
// import 'sub_pre/animation_sub.dart';
import 'sub_pre/introduce.dart';

class PreWatching extends StatelessWidget {
  const PreWatching({
    required this.ref,
    required this.title,
    required this.genre,
    required this.descr,
    required this.author,
  });

  final String ref, title, genre, descr, author;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_sharp),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // actions: [
        //   TextButton.icon(
        //     onPressed: () {},
        //     icon: AnimationSub(),
        //     label: Text('Subscribe'),
        //   )
        // ],
      ),
      body: Container(
        child: Introduce(
          ref: ref,
          author: author,
          title: title,
          descr: descr,
          genre: genre,
        ),
      ),
    );
  }
}
