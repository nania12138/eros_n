import 'package:eros_n/component/dialog/cf_dialog.dart';
import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/network/app_dio/pdio.dart';
import 'package:eros_n/network/request.dart';
import 'package:eros_n/pages/enum.dart';
import 'package:eros_n/pages/nav/history/history_provider.dart';
import 'package:eros_n/utils/eros_utils.dart';
import 'package:eros_n/utils/get_utils/extensions/duration_extensions.dart';
import 'package:eros_n/utils/get_utils/extensions/num_extensions.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tuple/tuple.dart';

import 'gallery_page_state.dart';

class GalleryNotifier extends StateNotifier<Gallery> {
  GalleryNotifier(super.state, this.ref);

  final Ref ref;

  void initFromGallery(Gallery gallery) {
    logger.d('${gallery.toString()} ');
    state = state.copyWith(
      thumbUrl: gallery.thumbUrl,
      thumbWidth: gallery.thumbWidth,
      thumbHeight: gallery.thumbHeight,
      gid: gallery.gid,
      title: gallery.title,
      url: gallery.url,
      imageKey: gallery.imageKey,
    );

    loadData();
    // add history
    500.milliseconds.delay(() {
      ref.read(historyProvider.notifier).addHistory(gallery);
    });
  }

  void setInitialPage(int page) {
    state = state.copyWith(currentPageIndex: page);
  }

  /// 加载数据
  Future<void> loadData({bool refresh = false}) async {
    logger.d('loadData refresh $refresh  url: ${state.url}');
    if (state.images.isEmpty) {
      ref
          .read(pageStateProvider(state.gid).notifier)
          .update((state) => state.copyWith(pageStatus: PageStatus.loading));
    }

    try {
      final gallery = await getGalleryDetail(
        url: state.url ?? '',
        refresh: refresh,
      );
      state = gallery.copyWith(
        thumbUrl: state.thumbUrl,
        thumbWidth: state.thumbWidth,
        thumbHeight: state.thumbHeight,
        gid: state.gid,
        title: state.title,
        url: state.url,
        imageKey: state.imageKey,
        currentPageIndex: state.currentPageIndex,
      );
    } on HttpException catch (e) {
      if (e.code == 403 || e.code == 503) {
        logger.e('code ${e.code}');
        if (!mounted) {
          return;
        }
        await showInAppWebViewDialog(
          statusCode: e.code,
          onComplete: () async => await loadData(refresh: refresh),
        );
      } else {
        rethrow;
      }
    } finally {
      ref
          .read(pageStateProvider(state.gid).notifier)
          .update((state) => state.copyWith(pageStatus: PageStatus.none));
    }
  }

  /// 收藏
  Future<void> toggleFavorite() async {
    late final Tuple2<bool?, int?> result;
    if (state.isFavorited ?? false) {
      logger.d('取消收藏');
      result = await setFavorite(
        gid: state.gid,
        unfavorite: true,
        csrfToken: state.csrfToken,
      );
    } else {
      logger.d('收藏');
      result = await setFavorite(
        gid: state.gid,
        csrfToken: state.csrfToken,
      );
    }
    final int? numFavorite = result.item2;
    final bool? isFavorite = result.item1;

    if (isFavorite != null && numFavorite != null) {
      state = state.copyWith(
        isFavorited: isFavorite,
        favoritedNum: '$numFavorite',
      );
    }
  }

  /// 重新加载
  Future<void> reloadData() async {
    await loadData(refresh: true);
  }

  void onPageChanged(int index) {
    state = state.copyWith(
      currentPageIndex: index,
    );
  }
}

final galleryProvider =
    StateNotifierProvider.family<GalleryNotifier, Gallery, String?>(
  (ref, gid) {
    return GalleryNotifier(Gallery(gid: gid), ref);
  },
);

final pageStateProvider =
    StateProvider.family<GalleryViewState, String?>((ref, gid) {
  return const GalleryViewState(pageStatus: PageStatus.none);
});

String getGalleryImageUrl(String imageKey, int index, String extention) {
  final subDomain = radomList(['', '3', '5', '7']);
  return 'https://i.nhentai.net/galleries/$imageKey/${index + 1}$extention';
  // return 'https://i$subDomain.nhentai.net/galleries/$imageKey/${index + 1}.jpg';
}
