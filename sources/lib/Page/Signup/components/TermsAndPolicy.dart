import 'package:flutter/material.dart';

class TermsPolicy extends StatelessWidget {
  final VoidCallback pressTerms;
  final VoidCallback pressPolicy;
  const TermsPolicy(
      {Key? key, required this.pressTerms, required this.pressPolicy})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Text('By signing up, I agree to the'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: pressTerms,
                child: Text(
                  ' Terms of Use',
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ),
              Text(' and'),
              GestureDetector(
                onTap: pressPolicy,
                child: Text(
                  ' Privacy Policy',
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ),
            ],
          ),
          Text('of Webtoon Manga'),
        ],
      ),
    );
  }
}
