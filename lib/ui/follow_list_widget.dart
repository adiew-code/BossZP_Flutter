import 'package:bosszp/gen/assets.gen.dart';
import 'package:bosszp/ui/follow_item_widget.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FollowListWidget extends StatelessWidget {
  const FollowListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const avatarWidth = 32.0;
    const leading = 15.0;
    return Scaffold(
      appBar: AppBar(
          leading: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: leading),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(avatarWidth / 2),
                child: Assets.images.avatar2Iphone
                    .image(width: avatarWidth, height: avatarWidth),
              ),
            ),
          ),
          actions: [
            IconButton(
                onPressed: null,
                icon: Assets.images.bzGetNaviSearchIconIphone.image()),
            IconButton(
                onPressed: null,
                icon: Assets.images.bzGetNaviMsgGrayIconIphone.image()),
          ],
          flexibleSpace: FlexibleSpaceBar(
              background: Assets.images.basicBgNaviBackImgIphone
                  .image(fit: BoxFit.cover))),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return FollowItemWidget(
            leading: leading,
          );
        },
      ),
    );
  }
}
