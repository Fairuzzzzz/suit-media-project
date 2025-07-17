import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:suit_media_project/core/ui/theme/custom_color.dart';
import 'package:suit_media_project/core/ui/widgets/appbar/primary_appbar.dart';
import 'package:suit_media_project/core/ui/widgets/layout/scaled_vertical_space.dart';
import 'package:suit_media_project/core/ui/widgets/text_label/title_heading2_widget.dart';
import 'package:suit_media_project/core/ui/widgets/text_label/title_heading3_widget.dart';
import 'package:suit_media_project/modules/third_screen/controller/third_screen_controller.dart';
import 'package:suit_media_project/modules/third_screen/ui/widget/user_list_item_widget.dart';

class ThirdScreenMobile extends StatelessWidget {
  const ThirdScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ThirdScreenController());
    final scrollController = ScrollController();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        controller.fetchUsers();
      }
    });

    return Scaffold(
      backgroundColor: CustomColor.lightBackgroundColor,
      appBar: PrimaryAppBar('Third Screen', showBackButton: true),
      body: Obx(
        () => RefreshIndicator(
          onRefresh: controller.refreshUsers,
          child: controller.users.isEmpty && !controller.isLoading.value
              ? _buildEmptyState()
              : _buildUserList(controller, scrollController),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        children: [
          const Icon(Icons.person_off, size: 64, color: Colors.grey),
          ScaledVerticalSpace(12),
          TitleHeading2Widget(
            text: 'No users found',
            color: CustomColor.darkFontColor,
          ),
        ],
      ),
    );
  }

  Widget _buildUserList(
    ThirdScreenController controller,
    ScrollController scrollController,
  ) {
    return ListView.separated(
      controller: scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      itemCount: controller.users.length + (controller.isLoading.value ? 1 : 0),
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        if (index == controller.users.length) {
          return const Center(child: CircularProgressIndicator());
        }

        final user = controller.users[index];
        return UserItemListWidget(user: user, onTap: controller.selectUser);
      },
    );
  }
}
