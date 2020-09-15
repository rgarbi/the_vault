import 'package:flutter/material.dart';
import 'package:the_vault/models/whiskey_review.dart';

class ReviewDetailPage extends StatelessWidget {

  final WhiskeyReview review;

  ReviewDetailPage(this.review);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(review.name),
      ),
    );
  }

}