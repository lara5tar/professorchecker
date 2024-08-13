import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/consts/blocks.dart';
import 'block_button_widget.dart';
import 'blocks_buttons_controller.dart';

class BlocksButtonsView extends GetView<BlocksButtonsController> {
  // final ValueChanged<String> onBlockSelected;
  const BlocksButtonsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Wrap(
        alignment: WrapAlignment.center,
        children: [
          for (var block in blocks)
            BlockButtonWidget(
              block: block,
              onPressed: () {
                controller.selectBlock(block);
              },
              isSelected: controller.isSelected(block),
            ),
        ],
      ),
    );
  }
}
