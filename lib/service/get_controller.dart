import 'package:e_commerce/api/items_model.dart';
import 'package:e_commerce/service/service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var products = <Products>[].obs;
  // Assuming RemoteService is your service class

  @override
  void onInit() {
    super.onInit();
    fetchproduct(); // Automatically fetch products when the controller is initialized
  }

  void fetchproduct() async {
    try {
      var fetchedProducts = await remoteService
          .fetchproduct(); // Fetch products from remote service
      if (fetchedProducts != null) {
        products.assignAll(fetchedProducts); // Update the observable list
      }
    } catch (e) {
      print(e); // Handle errors appropriately
    }
  }
}
