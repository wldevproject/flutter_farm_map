import 'dart:async';
import 'dart:convert';

import 'package:flutter_farm_map/app/data/lokasi_utama.response.model.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:http/http.dart' as http;

class ApiService {
  var socketUrl = 'YOUR_SOCKET_IO_SERVER_URL';
  var socketPatch = 'YOUR_PATCH_URL';
  Uri get lokasiUtama => Uri.parse("$socketUrl/socketPatch");

  io.Socket bidSocket() {
    return io.io(socketUrl, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
  }

  Future<LokasiUtamaRequestModel?> fetchLokasiUtama({
    int page = 1,
    int perPage = 1000,
    String value = '',
  }) async {
    try {
      var response = await http.get(lokasiUtama);

      if ((response.statusCode) >= 200 && (response.statusCode) < 404) {
        return LokasiUtamaRequestModel.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } on TimeoutException catch (_) {
      return null;
    } catch (e) {
      return null;
    }
  }
}

extension DynamicUriExtension on Uri {
  Uri withQuery(Map<String, String> queryParameters) {
    var newUri = this;
    return newUri.replace(queryParameters: queryParameters);
  }

  Uri withPaths(List<String> paths) {
    var newUri = this;

    for (var path in paths) {
      newUri = newUri.replace(path: newUri.path + path);
    }

    return newUri;
  }
}
