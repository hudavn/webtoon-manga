import 'package:flutter/material.dart';
import 'singleItemSearched.dart';

class ListRecommend extends StatefulWidget {
  const ListRecommend(
      {required this.listURL,
      required this.listTitle,
      required this.listGenre,
      required this.listLike,
      required this.listDescr,
      required this.listAuthor});

  final List listURL, listTitle, listGenre, listLike, listAuthor, listDescr;

  @override
  _ListRecommendState createState() => _ListRecommendState();
}

class _ListRecommendState extends State<ListRecommend> {
  List<Widget> listImg = [];

  fetchData() {
    List _listURL = widget.listURL;
    List _listTitle = widget.listTitle;
    List _listGenre = widget.listGenre;
    List _listLike = widget.listLike;
    List _listAuthor = widget.listAuthor;
    List _listDescr = widget.listDescr;
    List<Widget> _listImg = [];

    for (var i = 0; i < _listURL.length; i++) {
      var img = singleRecommend(
        ref: _listURL[i],
        title: _listTitle[i],
        genre: _listGenre[i],
        like: _listLike[i].toString(),
        author: _listAuthor[i],
        descr: _listDescr[i],
      );

      _listImg.add(img);
    }

    setState(() {
      listImg = _listImg;
    });
  }

  @override
  void didUpdateWidget(covariant ListRecommend oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 11, right: 11, top: 10, bottom: 10),
      child: Column(children: listImg),
    );
  }
}
