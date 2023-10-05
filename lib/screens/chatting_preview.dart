import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:speso_code/util/color.dart';
import 'package:speso_code/util/dimension.dart';

import '../providers/chat_provider.dart';
import 'chat.dart';

class ChattingPreview extends StatefulHookConsumerWidget {
  const ChattingPreview({
    super.key,
    required this.mainChatItem,
  });
  final MainChatItem mainChatItem;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChattingPreviewState();
}

class _ChattingPreviewState extends ConsumerState<ChattingPreview> {
  ScrollController newScrollController = ScrollController();

  @override
  void initState() {
    Future.delayed(
      const Duration(microseconds: 800),
      () {
        ref.read(chatMainProvider.notifier).getTheData(widget.mainChatItem.id);
        newScrollController.animateTo(
          newScrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 100),
          curve: Curves.linear,
        );
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var newMsg = useTextEditingController();
    var fullMsg = ref.watch(chatMainProvider);

    return Scaffold(
      body: Column(
        children: [
          Gap(
            getScreenHeight(60),
          ),
          Row(
            children: [
              Gap(getScreenWidth(8)),
              const BackButton(),
              Container(
                height: getScreenHeight(45),
                width: getScreenWidth(45),
                decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/images/spasologo.png',
                      ),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(25)),
              ),
              Gap(getScreenWidth(8)),
              Text(
                widget.mainChatItem.name,
                style: customTextStyles(size: 21, fontWeight: FontWeight.w800),
              ),
            ],
          ),
          Gap(getScreenHeight(5)),
          const Divider(),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: fullMsg.listOfChats.length,
              controller: newScrollController,
              shrinkWrap: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              itemBuilder: (context, index) {
                SingleChatItem chatlist = fullMsg.listOfChats[index];
                return index == fullMsg.listOfChats.length
                    ? Container(
                        height: getScreenHeight(70),
                      )
                    : ChatBubble(
                        date: DateFormat.Hm().format(
                          chatlist.time,
                        ),
                        message: chatlist.msg,
                        isItReply: chatlist.isItReply,
                      );
              },
            ),
          ),
          Container(
            height: getScreenHeight(120),
            width: double.maxFinite,
            color: kWHTCOLOUR,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: getScreenWidth(25)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.add),
                  SizedBox(
                    width: getScreenWidth(260),
                    height: getScreenHeight(50),
                    child: TextFormField(
                      controller: newMsg,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      List<SingleChatItem> newFullMsg = fullMsg.listOfChats;
                      newFullMsg.add(
                        SingleChatItem(
                          msg: newMsg.text,
                          time: DateTime.now(),
                          isItReply: true,
                        ),
                      );
                      MainChatItem newOne = MainChatItem(
                        name: widget.mainChatItem.name,
                        id: widget.mainChatItem.id,
                        lastMsg: newMsg.text,
                        lastTime: DateTime.now(),
                        listOfChats: newFullMsg,
                      );
                      await ref
                          .read(chatPerticulerProvider.notifier)
                          .replyAChat(
                            id: widget.mainChatItem.id,
                            mainChatItem: newOne,
                          );
                      newMsg.clear();
                      ref
                          .read(chatMainProvider.notifier)
                          .getTheData(widget.mainChatItem.id);
                      Future.delayed(
                        const Duration(milliseconds: 300),
                        () {
                          newScrollController.animateTo(
                            newScrollController.position.maxScrollExtent,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.linear,
                          );
                        },
                      );
                    },
                    child: const Icon(Icons.send),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.date,
    required this.message,
    required this.isItReply,
  });
  final String date, message;
  final bool isItReply;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: getScreenWidth(
          isItReply ? 75 : 20,
        ),
        right: getScreenWidth(
          isItReply ? 20 : 75,
        ),
        top: getScreenHeight(10),
        bottom: getScreenHeight(10),
      ),
      child: Container(
        padding: EdgeInsets.all(getScreenHeight(10)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            getScreenHeight(20),
          ),
          color: kWHTCOLOUR,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message,
                    style: customTextStyles(),
                  ),
                  Gap(getScreenHeight(10))
                ],
              ),
            ),
            Text(
              date,
              style: customTextStyles(),
            ),
          ],
        ),
      ),
    );
  }
}
