import 'package:bosszp/gen/assets.gen.dart';
import 'package:bosszp/model/appearance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class PostionDetailWidget extends StatelessWidget {
  const PostionDetailWidget({super.key, this.leading = 25});
  final double leading;
  @override
  Widget build(BuildContext context) {
    final Appearance appear = context.read();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: Assets.images.bhHmpgNavShareBlackIphone.image())
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(leading, 10, leading, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(children: [
                        Text(
                          "iOS技术专家",
                          style: TextStyle(
                              color: appear.titleColor,
                              fontSize: 28,
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text(
                          "40-60K 15薪",
                          style: TextStyle(
                              color: appear.blueColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        )
                      ]),
                      SizedBox(height: 15),
                      Wrap(
                        direction: Axis.horizontal,
                        spacing: 15,
                        alignment: WrapAlignment.start,
                        runSpacing: 10,
                        children: [
                          for (int i = 0; i < 3; i++)
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Assets.images.bzGetCardDetailInfoIconIphone
                                    .image(),
                                SizedBox(width: 5),
                                Text(
                                  "北京～庄$i",
                                  style: TextStyle(
                                      color: appear.subTitleColor,
                                      fontSize: 15),
                                )
                              ],
                            )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SafeArea(
            child: Container(
              color: appear.blueColor,
              width: double.infinity,
              height: 60,
              margin: EdgeInsets.only(left: leading, right: leading),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "立即沟通",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
