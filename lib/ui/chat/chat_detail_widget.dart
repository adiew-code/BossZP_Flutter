import 'package:bosszp/gen/assets.gen.dart';
import 'package:bosszp/model/appearance.dart';
import 'package:bosszp/ui/chat/chat_setting_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ChatDetailWidget extends StatelessWidget {
  const ChatDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final appear = context.read<Appearance>();

    final inputController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: FlexibleSpaceBar(
          background: Container(
            color: Colors.white,
          ),
        ),
        actions: [
          // IconButton(
          //     onPressed: () {},
          //     icon: Assets.images.chatNavRightTagsIconIphone.image()),
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return ChatSettingWidget();
                  },
                ));
              },
              icon: Assets.images.chatNavRightIconIphone.image())
        ],
        title: Center(
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "李响",
                    style: TextStyle(
                        color: appear.titleColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: 8),
                  Assets.images.cbChatOnlineIphone
                      .image(height: 20, fit: BoxFit.fitHeight)
                ],
              ),
              SizedBox(height: 3),
              Text(
                "5min-hr",
                style: TextStyle(
                    color: appear.titleColor,
                    fontSize: 14,
                    fontWeight: FontWeight.normal),
              )
            ],
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: SafeArea(
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _ButtonWidget(
                  icon: Assets.images.exchangePhoneHighlightIphone.image(),
                  text: "打电话",
                ),
                _ButtonWidget(
                  icon: Assets.images.exchangeWechatHighlightIphone.image(),
                  text: "换微信",
                ),
                _ButtonWidget(
                  icon: Assets.images.exchangeResumeHighlightIphone.image(),
                  text: "发简历",
                ),
                _ButtonWidget(
                  icon:
                      Assets.images.bbChatExchangeItemNotFitAbleIphone.image(),
                  text: "不感兴趣",
                )
              ],
            ),
            Expanded(
              child: Container(
                color: appear.backgroundColor,
                child: _ListView(),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
              child: _InputPannel(inputController: inputController),
            )
          ],
        )),
      ),
    );
  }
}

class _InputPannel extends StatefulWidget {
  const _InputPannel({
    super.key,
    required this.inputController,
  });

  final TextEditingController inputController;

  @override
  State<_InputPannel> createState() => _InputPannelState();
}

class _InputPannelState extends State<_InputPannel> {
  bool emojSelected = false;
  bool moreSelected = false;

  @override
  Widget build(BuildContext context) {
    final Appearance appear = context.read();
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {
                setState(() {
                  emojSelected = false;
                  moreSelected = false;
                });
              },
              icon: Assets.images.chatBottomCommonIconIphone.image(),
            ),
            SizedBox(width: 10),
            Expanded(
                child: TextField(
              controller: widget.inputController,
              keyboardType: TextInputType.text,
              minLines: 1,
              maxLines: 5,
              onTapOutside: (event) {
                SystemChannels.textInput.invokeMethod('TextInput.hide');
              },
              onSubmitted: (value) {
                widget.inputController.clear();
              },
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "新信息",
                  hintStyle: TextStyle(color: appear.timeColor)),
            )),
            SizedBox(width: 10),
            IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {
                setState(() {
                  emojSelected = !emojSelected;
                  moreSelected = false;
                });
              },
              icon: (!emojSelected
                      ? Assets.images.chatKeyboardExpressionNormalIphone
                      : Assets.images.chatKeyboardInputIphone)
                  .image(),
            ),
            IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {
                setState(() {
                  emojSelected = false;
                  moreSelected = !moreSelected;
                });
              },
              icon: (!moreSelected
                      ? Assets.images.chatBottomMoreDefaultIconIphone
                      : Assets.images.chatBottomMoreCloseIconIphone)
                  .image(),
            )
          ],
        ),
      ],
    );
  }
}

class _ListView extends StatelessWidget {
  const _ListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // dragStartBehavior: DragStartBehavior.down,
      itemCount: 30,
      itemBuilder: (context, index) {
        return _ChatRowTextWidget(
          isSender: index % 2 == 0,
          text: "您好，外包考虑吗？",
        );
      },
    );
  }
}

class _ChatRowTextWidget extends StatelessWidget {
  const _ChatRowTextWidget({
    super.key,
    required this.isSender,
    required this.text,
  });
  final bool isSender;
  final String text;
  @override
  Widget build(BuildContext context) {
    final Appearance appear = context.read();
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 15, bottom: 15),
      child: LayoutBuilder(builder: (context, constraints) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          textDirection: isSender ? TextDirection.rtl : TextDirection.ltr,
          children: [
            ClipOval(
                child:
                    Assets.images.avatar2Iphone.image(width: 35, height: 35)),
            SizedBox(width: 5),
            ConstraintsTransformBox(
              constraintsTransform: (pCon) => BoxConstraints(
                minHeight: pCon.minHeight,
                maxHeight: pCon.maxHeight,
                minWidth: pCon.minWidth,
                maxWidth: constraints.maxWidth * 0.75,
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                      child: (isSender
                              ? Assets.images.bhChatBubbleBlueIphone
                              : Assets.images.bhChatBubbleWhiteLeftIphone)
                          .image(centerSlice: Rect.fromLTRB(15, 15, 25, 25))),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      text,
                      style: TextStyle(
                          color: isSender ? Colors.white : appear.titleColor,
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}

class _ButtonWidget extends StatelessWidget {
  const _ButtonWidget({super.key, required this.text, required this.icon});

  final String text;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    final Appearance appear = context.read();

    return TextButton(
        onPressed: () {},
        child: Column(
          children: [
            icon,
            SizedBox(height: 4),
            Text(
              text,
              style: TextStyle(color: appear.titleColor, fontSize: 13),
            )
          ],
        ));
  }
}
