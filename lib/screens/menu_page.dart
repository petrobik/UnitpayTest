import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:unitpay_test/constants.dart';
import 'package:unitpay_test/controllers/list_controller.dart';
import 'package:unitpay_test/models/product.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var listController = Get.put(ListController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: Text(
          'Меню',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () => listController.addProduct(),
            icon: Container(
              width: 30.0,
              height: 30.0,
              color: kBlueColor,
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: _body(),
    );
  }

  Widget _body() {
    return GetX<ListController>(
        init: Get.find<ListController>(),
        builder: (ListController controller) {
          if (controller.productList.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: (1 / 1),
                  ),
                  itemCount: controller.productList.length,
                  itemBuilder: (_, index) {
                    return _productItem(controller.productList[index]);
                  }),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Widget _productItem(Product product) {
    return Container(
        child: Stack(
      children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: CachedNetworkImage(
                  imageUrl: product.image,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                product.name,
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: GestureDetector(
            onTap: () => Get.find<ListController>().removeProduct(product),
            child: Container(
              color: kBlueColor,
              width: 30.0,
              height: 30.0,
              child: Icon(
                Icons.delete_outline,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
