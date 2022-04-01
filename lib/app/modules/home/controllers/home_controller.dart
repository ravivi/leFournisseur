
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  //TODO: Implement ProductlistController
  var maquisId;
  String serverUrl = "https://e-maquis.herokuapp.com";
  RxBool isLoading = false.obs;
  RxList category = [].obs;
  RxBool isProblem = false.obs;
  final count = 0.obs;
  @override
  void onInit() {
    // print("object");
    // getCategory();

    super.onInit();
  }

  @override
  void onReady() {
    print("object");
    getCategory();
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  //recuperation des category

  getCategory() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   maquisId = prefs.get('maquisId');

  //   print("ok");
  //   var formData = {
  //     '_id': maquisId,
  //   };
  //   isLoading(true);
  //   isProblem(false);
  //   BaseOptions options = BaseOptions(
  //     connectTimeout: 10000,
  //     sendTimeout: 10000,
  //     baseUrl: "${serverUrl}/categorie_par_client",
  //     headers: {
  //       'Accept': 'application/json',
  //     },
  //     followRedirects: false,
  //   );
  //   Dio dio = new Dio(options);
  //   try {
  //     final response = await dio.post(
  //       "${serverUrl}/categorie_par_client",
  //       data: formData,
  //     );
  //     print(response.statusCode);
  //     var data = response.data;
  //     print(isLoading);

  //     if (response.statusCode == 200) {
  //       for (var item in data["data"]) {
  //         print("Premier visuel $category");
  //         category.add(Category.fromJson(item));
  //         print("deuxième visuel $category");
  //         isLoading(false);
  //         isProblem(false);
  //       }
  //       print(data);
  //     }
      
      
  //      else {
  //       isLoading(false);
  //       print("Non non");
  //     }
  //   } on DioError catch (e) {
  //     isProblem(true);
  //     print("probleme ================== $isProblem+ $e");
  //   }
  }
}
