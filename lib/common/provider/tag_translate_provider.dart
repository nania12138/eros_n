import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:eros_n/common/global.dart';
import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/network/request.dart';
import 'package:eros_n/store/db/entity/tag_translate.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path/path.dart' as path;

const String kReleaseUrl =
    'https://api.github.com/repos/EhTagTranslation/Database/releases/latest';
const String kReleaseUrlWithCDN =
    'https://fastly.jsdelivr.net/gh/EhTagTranslation/DatabaseReleases/db.raw.json.gz';

class TagTranslateNotifier extends StateNotifier<TagTranslateInfo> {
  TagTranslateNotifier() : super(hiveHelper.getTagTranslateInfo());

  /// 检查更新
  Future<void> getUpdateInfo({bool force = false}) async {
    final releaseInfoMap = await getGithubApi(kReleaseUrl);

    // 获取发布时间 作为远程版本号
    final remoteVer = releaseInfoMap['published_at']?.trim() as String;

    if (remoteVer == state.version && force == false) {
      return;
    }

    final List<dynamic> assList = releaseInfoMap['assets'] as List<dynamic>;
    final Map<String, String> assMap = <String, String>{};
    for (final dynamic assets in assList) {
      assMap[assets['name'] as String? ?? ''] =
          assets['browser_download_url'] as String;
    }
    final lastReleaseUrl = assMap['db.raw.json.gz'] ?? '';

    state = state.copyWith(
      remoteVersion: remoteVer,
      lastReleaseUrl: lastReleaseUrl,
    );
    hiveHelper.setTagTranslateInfo(state);
  }

  Future<void> updateDb({bool check = true, bool force = false}) async {
    if (check) {
      await getUpdateInfo(force: force);
    }

    logger.d('state $state');

    final dataList = await _fetchLastVersionData(force: force);
    if (dataList == null) {
      return;
    }

    final tagTranslates = <TagTranslate>[];

    for (final data in dataList) {
      final namespace = data['namespace'] as String;
      Map dataMap = data['data'] as Map;
      dataMap.forEach((name, value) {
        final translateName = (value['name'] ?? '') as String;
        final intro = (value['intro'] ?? '') as String;
        final links = (value['links'] ?? '') as String;

        tagTranslates.add(TagTranslate(
            namespace: namespace,
            name: name as String,
            translateName: translateName,
            intro: intro,
            links: links));
      });
    }
    // log len
    logger.d('tagTranslates len: ${tagTranslates.length}');
    await isarHelper.putAllTagTranslate(tagTranslates);
    state = state.copyWith(
      version: state.remoteVersion,
    );
    hiveHelper.setTagTranslateInfo(state);
  }

  Future<List?> _fetchLastVersionData({bool force = false}) async {
    logger.v('_fetchData start');
    if (state.remoteVersion == null ||
        (!force && state.remoteVersion == state.version) ||
        state.lastReleaseUrl == null) {
      return null;
    }

    final gzFilePath = path.join(Global.appDocPath, 'db.raw.json.gz');
    await nhDownload(url: state.lastReleaseUrl!, savePath: gzFilePath);
    List<int> bytes = File(gzFilePath).readAsBytesSync();
    List<int> data = GZipDecoder().decodeBytes(bytes);
    final String dbJson = utf8.decode(data);

    final dataMap = jsonDecode(dbJson);
    final List listData = dataMap['data'] as List;

    return listData;
  }
}

final tagTranslateProvider =
    StateNotifierProvider<TagTranslateNotifier, TagTranslateInfo>((ref) {
  return TagTranslateNotifier();
});
