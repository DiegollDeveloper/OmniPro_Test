import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:omnipro_test/core/utils/screen_size.dart';
import 'package:omnipro_test/features/home/data/models/api_photo.dart';
import 'package:omnipro_test/features/home/presentation/widgets/photo_item.dart';

class PhotosList extends StatelessWidget {
  final bool loading;
  final List<ApiPhoto> photos;
  final RefreshController refreshController;
  final Function onLoading;

  const PhotosList({
    super.key,
    required this.loading,
    required this.photos,
    required this.refreshController,
    required this.onLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenSize.height(context) * 0.7,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300]!,
            blurRadius: 5,
          ),
        ],
      ),
      child: loading
          ? const Center(child: CircularProgressIndicator())
          : Scrollbar(
              child: SmartRefresher(
                enablePullDown: false,
                enablePullUp: true,
                controller: refreshController,
                onLoading: () => onLoading(),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  primary: true,
                  padding: EdgeInsets.zero,
                  itemCount: photos.length,
                  itemBuilder: (context, index) => PhotoItem(
                    photoUrl: photos[index].url,
                    title: photos[index].title,
                  ),
                ),
              ),
            ),
    );
  }
}
