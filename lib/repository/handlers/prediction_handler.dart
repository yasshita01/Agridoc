import 'dart:developer';
import 'dart:io';

import 'package:agridoc/blocs/api_handler/api_handler_bloc.dart';
import 'package:agridoc/repository/services/api_request.dart';

class Predictionhandler {
  ApiBaseHelper _helper = ApiBaseHelper();
  Future<String> analyzeImage(File file) async {
    var response = await _helper.uploadImage(file, 'predict/plant');
    log(response.toString());
    return response['disease'];
  }
}
