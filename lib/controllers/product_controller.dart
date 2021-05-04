import 'package:get/state_manager.dart';
import 'package:shop_x_api/models/product.dart';
import 'package:shop_x_api/services/remote_services.dart';

class ProductController extends GetxController {
  var productList = <Product>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts();
      if (products != null) {
        productList.value = products;
      }
    } on Exception catch (e) {
      // TODO
    } finally {
      isLoading(false);
    }
  }
}
