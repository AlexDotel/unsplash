import 'dart:convert';

import 'package:http/http.dart' as https;
import 'package:unsplash/src/models/modelo_storie.dart';


class ProvedorFotos{

  String url = 'https://api.pexels.com/v1/search?query=wallpaper&per_page=80';
  // String api  = '563492ad6f91700001000001f91ac2130e624c248f42fea306b48b62';
  String api = '563492ad6f91700001000001510ad187edc343a2adf3eb48ffaa27e9';
  String autorizacion = 'Authorization';

  Future <List<Photo>> getWallpaper() async {

    final resp = await  https.get(
                          url, 
                          headers: {autorizacion : api}
                        );

      final decodedData = json.decode(resp.body);
      final fotos = new Photos.fromJsonList(decodedData['photos']);
      return fotos.list;

    }

}