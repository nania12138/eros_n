import 'package:eros_n/component/dialog/cf_dialog.dart';
import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/network/app_dio/pdio.dart';
import 'package:eros_n/network/request.dart';
import 'package:eros_n/pages/enum.dart';
import 'package:eros_n/utils/eros_utils.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GalleryNotifier extends StateNotifier<Gallery> {
  GalleryNotifier(super.state, this.ref);

  final Ref ref;

  void initFromGallery(Gallery gallery) {
    logger.d('${gallery.toString()} ');
    state = state.copyWith(
      thumbUrl: gallery.thumbUrl,
      imgWidth: gallery.imgWidth,
      imgHeight: gallery.imgHeight,
      gid: gallery.gid,
      title: gallery.title,
      url: gallery.url,
      imageKey: gallery.imageKey,
    );

    loadData();
  }

  Future<void> loadData() async {
    if (state.images.isEmpty) {}
    ref
        .read(pageStateProvider(state.gid).notifier)
        .update((state) => PageStatus.loading);
    try {
      final gallery = await getGalleryDetail(url: state.url ?? '');
      state = state.copyWith(
        images: gallery.images,
      );
    } on HttpException catch (e) {
      if (e.code == 403 || e.code == 503) {
        logger.e('code ${e.code}');
        if (!mounted) {
          return;
        }
        await showInAppWebViewDialog(
          statusCode: e.code,
          onComplete: () async => await getGalleryDetail(
            url: state.url ?? '',
          ),
        );
      } else {
        rethrow;
      }
    } finally {
      ref
          .read(pageStateProvider(state.gid).notifier)
          .update((state) => PageStatus.none);
    }
  }
}

final galleryProvider =
    StateNotifierProvider.family<GalleryNotifier, Gallery, String?>((ref, gid) {
  return GalleryNotifier(Gallery(gid: gid), ref);
});

final pageStateProvider = StateProvider.family<PageStatus, String?>((ref, gid) {
  return PageStatus.none;
});

String getGalleryImageUrl(String imageKey, int index) {
  final subDomain = radomList(['', '3', '5', '7']);
  return 'https://i.nhentai.net/galleries/$imageKey/${index + 1}.jpg';
  // return 'https://i$subDomain.nhentai.net/galleries/$imageKey/${index + 1}.jpg';
}