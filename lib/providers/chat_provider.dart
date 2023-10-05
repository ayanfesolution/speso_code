import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';

final chatMainProvider = StateNotifierProvider<ChatMainProvider, MainChatItem>(
    (ref) => ChatMainProvider(ref.read(chatPerticulerProvider).first, ref));

class ChatMainProvider extends StateNotifier<MainChatItem> {
  ChatMainProvider(super.state, this.ref) : super();
  Ref ref;
  getTheData(String id) {
    List<MainChatItem> dataItems = ref.read(chatPerticulerProvider);
    MainChatItem newItem = dataItems.firstWhere((element) => element.id == id);
    state = newItem;
  }
}

final chatPerticulerProvider =
    StateNotifierProvider<ChatPerticulerProvider, List<MainChatItem>>(
        (ref) => ChatPerticulerProvider([]));

class ChatPerticulerProvider extends StateNotifier<List<MainChatItem>> {
  ChatPerticulerProvider(super.state);

  getAllTheCurrentChatList() {
    SingleChatItem firstChat = SingleChatItem(
      msg:
          'Hello, Welcome to Speso. We are glad to have you with us, What can we do for you today.',
      time: DateTime.now(),
      isItReply: false,
    );
    SingleChatItem secondChat = SingleChatItem(
      msg:
          'Hello, Welcome to Speso Gist Partner. We are glad to have you with us, What can we do for you today.',
      time: DateTime.now(),
      isItReply: false,
    );
    state = [
      MainChatItem(
        name: 'Speso Support',
        lastMsg: firstChat.msg,
        lastTime: firstChat.time,
        listOfChats: [
          firstChat,
        ],
        id: '0001',
      ),
      MainChatItem(
        name: 'Speso Gist Partner',
        lastMsg: secondChat.msg,
        lastTime: secondChat.time,
        listOfChats: [
          secondChat,
        ],
        id: '0002',
      ),
    ];
  }

  replyAChat({required String id, required MainChatItem mainChatItem}) async {
    List<MainChatItem> currentChatList = state;
    currentChatList.removeWhere((element) => element.id == id);
    currentChatList.add(mainChatItem);
    await Future.delayed(
      const Duration(seconds: 1),
      () {
        Random random = Random();
        currentChatList.last.listOfChats.add(randomMsg[random.nextInt(10)]);
      },
    );
    state = currentChatList;
  }
}

List<SingleChatItem> randomMsg = [
  SingleChatItem(
    msg: 'We are glad to have you',
    time: DateTime.now(),
    isItReply: false,
  ),
  SingleChatItem(
    msg: 'Don\'t worry, we will do it for you',
    time: DateTime.now(),
    isItReply: false,
  ),
  SingleChatItem(
    msg: 'Stay with us, Someone is working on it',
    time: DateTime.now(),
    isItReply: false,
  ),
  SingleChatItem(
    msg: 'Trust is the Key, We are at it',
    time: DateTime.now(),
    isItReply: false,
  ),
  SingleChatItem(
    msg: 'Tell it to us',
    time: DateTime.now(),
    isItReply: false,
  ),
  SingleChatItem(
    msg: 'We understand you',
    time: DateTime.now(),
    isItReply: false,
  ),
  SingleChatItem(
    msg: 'We are working on it',
    time: DateTime.now(),
    isItReply: false,
  ),
  SingleChatItem(
    msg: 'We love you',
    time: DateTime.now(),
    isItReply: false,
  ),
  SingleChatItem(
    msg: 'You are our real customer',
    time: DateTime.now(),
    isItReply: false,
  ),
  SingleChatItem(
    msg: 'You are our number one',
    time: DateTime.now(),
    isItReply: false,
  ),
];

class MainChatItem {
  final String name, lastMsg, id;
  final DateTime lastTime;
  final List<SingleChatItem> listOfChats;

  MainChatItem({
    required this.name,
    required this.id,
    required this.lastMsg,
    required this.lastTime,
    required this.listOfChats,
  });
}

class SingleChatItem {
  final String msg;
  final DateTime time;
  final bool isItReply;

  SingleChatItem({
    required this.msg,
    required this.time,
    required this.isItReply,
  });
}
