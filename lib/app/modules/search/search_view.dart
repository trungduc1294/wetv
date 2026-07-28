import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wetv/app/core/i18n/tr_keys.dart';
import 'package:wetv/app/core/theme/app_color.dart';
import 'package:wetv/app/modules/search/search_controller.dart';
import 'package:wetv/app/widgets/molecules/top_search_list_item.dart';

// [VN] Màn hình Search: ô tìm kiếm, lịch sử, tìm kiếm hàng đầu
class SearchView extends GetView<SearchPageController> {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Column(
          children: [
            // [VN] Header: search field + Huỷ bỏ
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: AppColors.gray_800,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.search,
                            color: AppColors.white_primary,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              controller: controller.textController,
                              autofocus: true,
                              cursorColor: AppColors.orange_primary,
                              style: const TextStyle(
                                color: AppColors.white_primary,
                                fontSize: 15,
                              ),
                              decoration: InputDecoration(
                                isDense: true,
                                border: InputBorder.none,
                                hintText: TrKeys.searchHint.tr,
                                hintStyle: const TextStyle(
                                  color: AppColors.gray_600,
                                  fontSize: 15,
                                ),
                              ),
                              textInputAction: TextInputAction.search,
                              onSubmitted: controller.onSubmit,
                            ),
                          ),
                          Obx(() {
                            if (controller.query.value.isEmpty) {
                              return const SizedBox.shrink();
                            }
                            return GestureDetector(
                              onTap: () {
                                controller.textController.clear();
                                controller.query.value = '';
                              },
                              child: const Icon(
                                Icons.cancel,
                                color: AppColors.gray_600,
                                size: 18,
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: controller.onCancel,
                    behavior: HitTestBehavior.opaque,
                    child: Text(
                      TrKeys.cancel.tr,
                      style: const TextStyle(
                        color: AppColors.white_primary,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Obx(() {
                final history = controller.history.toList();
                final topSearches = controller.topSearches.toList();

                return ListView(
                  padding: const EdgeInsets.fromLTRB(12, 8, 12, 24),
                  children: [
                    // [VN] Section lịch sử tìm kiếm
                    if (history.isNotEmpty) ...[
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              TrKeys.history.tr.toUpperCase(),
                              style: const TextStyle(
                                color: AppColors.gray_600,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: controller.clearHistory,
                            child: const Icon(
                              Icons.delete_outline,
                              color: AppColors.gray_600,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: history
                            .map(
                              (keyword) => GestureDetector(
                                onTap: () => controller.onHistoryTap(keyword),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.gray_800,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    keyword,
                                    style: const TextStyle(
                                      color: AppColors.white_primary,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      const SizedBox(height: 24),
                    ],

                    // [VN] Section tìm kiếm hàng đầu
                    Text(
                      TrKeys.topSearches.tr,
                      style: const TextStyle(
                        color: AppColors.white_primary,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ...List.generate(topSearches.length, (index) {
                      final item = topSearches[index];
                      return TopSearchListItem(
                        item: item,
                        rank: index + 1,
                        onTap: () => controller.onTopSearchTap(item),
                      );
                    }),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
