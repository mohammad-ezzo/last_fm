import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:last_fm/src/constants.dart';
import 'package:last_fm/src/core/domain/entities/track.dart';
import 'package:last_fm/src/core/utils/dio_error_handler.dart';
import 'package:last_fm/src/core/utils/exceptions.dart';
import 'package:last_fm/src/core/utils/md5.dart';

import '../../../constants.dart';
import '../../../injections.dart';

class LastfmApi {
  final Dio dio;
  LastfmApi(this.dio);

  Future<bool> getSession() async {
    try {
      final apiSigned = generateMd5(
          "api_key${AppConstants.apiKey}methodauth.getMobileSessionpassword${AppConstants.password}username${AppConstants.userName}format=json${AppConstants.sharedKey}");
      final response = await dio.post(
        '?method=auth.getMobileSession&password=${AppConstants.password}&username=${AppConstants.userName}&api_key=${AppConstants.apiKey}&format=json&api_sig=$apiSigned',
      );
      final sessionKey = json.encode(response.data['session']['key']);
      // then add the session key to all request that require auth
      return true;
    } on DioError catch (e) {
      throw ServerException(handleDioError(e));
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  Future<List<Track>> searchTrack(String query, int page) async {
    try {
      final response = await dio.get(
        '?method=track.search&track=$query&page=$page&api_key=${AppConstants.apiKey}&format=json',
      );

      return Track.fromJsonList(
          response.data['results']['trackmatches']['track']);
    } on DioError catch (e) {
      throw ServerException(handleDioError(e));
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  Future<Track> getTrackInfo(
      String? trackId, String? trackName, String? artistName) async {
    try {
      final query = (trackId?.isNotEmpty ?? false)
          ? "mbid=$trackId"
          : "track=$trackName&artist=$artistName";
      final response = await dio.get(
        '?method=track.getInfo&$query&api_key=${AppConstants.apiKey}&format=json',
      );

      return Track.fromJson(response.data['track']);
    } on DioError catch (e) {
      throw ServerException(handleDioError(e));
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
