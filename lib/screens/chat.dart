import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:speso_code/providers/chat_provider.dart';
import 'package:speso_code/util/dimension.dart';
import 'package:speso_code/util/padded.dart';
import 'package:speso_code/util/route_navigators.dart';

import '../util/color.dart';
import 'chatting_preview.dart';

class CartScreen extends StatefulHookConsumerWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 1),
      () {
        if (ref.read(chatPerticulerProvider).isEmpty) {
          ref.read(chatPerticulerProvider.notifier).getAllTheCurrentChatList();
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<MainChatItem> allChat = ref.watch(chatPerticulerProvider);
    return Scaffold(
      body: Padded(
        child: Column(
          children: [
            Gap(getScreenHeight(60)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Chats',
                  style: customTextStyles(
                    size: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.contact_emergency_rounded,
                      color: kTextColor,
                    ),
                    Gap(getScreenWidth(10)),
                    const Icon(
                      Icons.circle_notifications,
                      color: kTextColor,
                    ),
                  ],
                ),
              ],
            ),
            Gap(getScreenHeight(20)),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Search'),
            ),
            Gap(getScreenHeight(20)),
            Expanded(
                child: ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: getScreenHeight(8),
                  ),
                  child: InkWell(
                    onTap: () => RouteNavigators.route(
                      context,
                      ChattingPreview(
                        mainChatItem: allChat[index],
                      ),
                    ),
                    child: Row(
                      children: [
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
                        Gap(getScreenWidth(10)),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    allChat[index].name,
                                    style: customTextStyles(
                                        size: 16, fontWeight: FontWeight.w800),
                                  ),
                                  Text(
                                    DateFormat.Hm()
                                        .format(allChat[index].lastTime),
                                    style: customTextStyles(
                                        size: 16, fontWeight: FontWeight.w800),
                                  )
                                ],
                              ),
                              Text(
                                allChat[index].lastMsg,
                                style: customTextStyles(
                                  size: 14,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: allChat.length,
            ))
          ],
        ),
      ),
    );
  }
}

TextStyle customTextStyles(
    {double size = 16,
    Color color = kTextColor,
    FontWeight fontWeight = FontWeight.w500}) {
  return TextStyle(
    fontSize: getScreenHeight(size),
    color: kTextColor,
    fontWeight: fontWeight,
  );
}
