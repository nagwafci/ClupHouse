import 'package:clup_house/widget/user_profile_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Screens/RoomScreen.dart';
import '../models/Room.dart';

class RoomCard extends StatelessWidget {
  final Room room;

  const RoomCard({
    Key? key,
    required this.room,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          fullscreenDialog: true,
          builder: (_) => RoomScreen(room: room),
        ),
      ),

      child: Padding(
        padding: const EdgeInsets.only(top: 6.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${room.club} 🏠'.toUpperCase(),
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.0,
                  ),
                ),
                Text(
                  room.name,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 100,
                        child: Stack(
                          children: [
                            UserProfileImage(
                              imageUrl: room.speakers[1].imageURL,
                              size: 48.0,
                            ),
                            Positioned(
                              left: 28.0,
                              top: 24.0,
                              child: UserProfileImage(
                                imageUrl: room.speakers[0].imageURL,
                                size: 48.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...room.speakers.map((e) => Text(
                              '${e.FirstName} ${e.SecondName} 💬',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                fontSize: 16.0,
                              ),
                            )),
                            const SizedBox(
                              height: 8,
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                    '${room.speakers.length + room.followedBySpeakers.length + room.others.length} ',
                                  ),
                                  const WidgetSpan(
                                      child: Icon(
                                        CupertinoIcons.person_fill,
                                        size: 18,
                                        color: Colors.grey,
                                      )),
                                  TextSpan(
                                    text: ' /  ${room.speakers.length} ',
                                  ),
                                  const WidgetSpan(
                                      child: Icon(
                                        CupertinoIcons.chat_bubble_fill,
                                        size: 18,
                                        color: Colors.grey,
                                      )),
                                ],
                              ),
                              style: TextStyle(color: Colors.grey[600]),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}