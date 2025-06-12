import 'package:http/http.dart';

class ApiServices {
  String endpoint = "https://repres.in/api/users?page=2";
  getUsers() async {
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
