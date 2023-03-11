import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:omnipro_test/core/utils/screen_size.dart';
import 'package:omnipro_test/features/home/data/models/api_photo.dart';
import 'package:omnipro_test/features/home/presentation/widgets/photo_item.dart';

class PhotosList extends StatelessWidget {
  final List<ApiPhoto> photos;
  final RefreshController refreshController;
  final Function onLoading;

  const PhotosList({
    super.key,
    required this.photos,
    required this.refreshController,
    required this.onLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenSize.height(context) * 0.8,
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Scrollbar(
        child: SmartRefresher(
          enablePullDown: false,
          enablePullUp: true,
          controller: refreshController,
          onLoading: () => onLoading(),
          footer: const ClassicFooter(
            loadingText: "Cargando nuevas fotos",
            failedText: "Error al cargar nuevas fotos",
            idleText: "Desliza para cargar nuevas fotos",
            canLoadingText: "Suelta para cargar nuevas fotos",
            noDataText: "No hay más fotos para cargar",
          ),
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
