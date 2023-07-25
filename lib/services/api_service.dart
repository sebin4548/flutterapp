// import 'package:http/http.dart' as http;

// class ApiService {
//   final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev/";
//   final String today = "today";

// //async programming
// //작업이 완료될때까지 기다린다 (API 요청이 처리돼서 응답을 반환할 때까지 기다린다.)
// //async 라고 지정해둔 함수 안에서 await를 적고 기다리는것 가능
//   void getTodaysToons() async {
//     final url = Uri.parse("$baseUrl/$today");
//     final response = await http.get(url); //응답이 이뤄질때까지 기다린다
//     if (response.statusCode == 200) {
//       print(response.body);
//       return;
//     }
//     throw Error();
//   }
// }

import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";

  void getTodaysToons() async {
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      return;
    }
    throw Error();
  }
}
