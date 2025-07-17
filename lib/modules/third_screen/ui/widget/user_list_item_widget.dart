import 'package:flutter/material.dart';
import 'package:suit_media_project/core/ui/widgets/layout/scaled_horizontal_space.dart';
import 'package:suit_media_project/core/ui/widgets/layout/scaled_vertical_space.dart';
import 'package:suit_media_project/core/ui/widgets/text_label/title_heading5_widget.dart';
import 'package:suit_media_project/modules/third_screen/models/third_screen_models.dart';

class UserItemListWidget extends StatelessWidget {
  final User user;
  final Function(User) onTap;

  const UserItemListWidget({
    super.key,
    required this.user,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(user),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(user.avatar),
              backgroundColor: Colors.grey[200],
            ),
            ScaledHorizontalSpace(8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleHeading5Widget(text: user.fullName),
                  ScaledVerticalSpace(4),
                  TitleHeading5Widget(text: user.email),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
