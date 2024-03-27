import 'package:bosszp/gen/assets.gen.dart';
import 'package:bosszp/model/appearance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ChatSettingWidget extends StatelessWidget {
  const ChatSettingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Appearance appear = context.read();
    const leading = 20.0;
    final line = Container(color: appear.backgroundColor, height: 2);
    final arrow = Assets.images.basicMoreArrowiphone
        .image(width: 14, height: 14, fit: BoxFit.fitHeight);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "聊天设置",
          style: TextStyle(
              color: appear.titleColor,
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: leading, top: 8, right: leading),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Row(
                        children: [
                          ClipOval(
                              child: Assets.images.avatar2Iphone
                                  .image(width: 50, height: 50)),
                          SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "郑爽",
                                style: TextStyle(
                                    color: appear.titleColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "百车宝 招聘经理",
                                style: TextStyle(
                                  color: appear.subTitleColor,
                                  fontSize: 15,
                                ),
                              )
                            ],
                          ),
                          Spacer(),
                          arrow
                        ],
                      ),
                    ),
                    line,
                    SizedBox(height: 10),
                    _Row(text: "查看近30天聊天记录"),
                    _Row(text: "查看个人竞争力分析"),
                    _Row(text: "查看隐私状态"),
                    line,
                    _Row(text: "举报对方"),
                    SizedBox(height: 10),
                    line,
                    SizedBox(height: 40),
                    Container(
                      decoration: BoxDecoration(
                          color: appear.backgroundColor,
                          borderRadius: BorderRadius.circular(6)),
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "删除联系人",
                            style: TextStyle(
                                color: appear.titleColor, fontSize: 18),
                          )),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({super.key, required this.text});

  final String text;
  // final

  @override
  Widget build(BuildContext context) {
    final Appearance appear = context.read();

    final arrow = Assets.images.basicMoreArrowiphone
        .image(width: 14, height: 14, fit: BoxFit.fitHeight);
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(color: appear.titleColor, fontSize: 17),
          ),
          Spacer(),
          arrow
        ],
      ),
    );
  }
}
