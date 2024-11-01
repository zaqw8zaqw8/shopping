import 'dart:io';

class Product {
  String name;
  int price;

  Product(this.name, this.price);
}

class ShoppingMall {
  List<Product> products = [
    Product('셔츠', 45000),
    Product('원피스', 30000),
    Product('반팔티', 35000),
    Product('반바지', 38000),
    Product('양말', 5000),
  ];

  List<Product> cart = [];
  int totalPrice = 0;

  void showProducts() {
    for (var product in products) {
      print('${product.name} / ${product.price}원');
    }
  }

  void addToCart() {
    stdout.write('상품 이름을 입력하세요: ');
    String? productName = stdin.readLineSync();
    stdout.write('상품 개수를 입력하세요: ');
    String? quantityInput = stdin.readLineSync();

    if (productName == null || quantityInput == null) {
      print('입력값이 올바르지 않아요!');
      return;
    }

    try {
      int quantity = int.parse(quantityInput);
      if (quantity <= 0) {
        print('0개보다 많은 개수의 상품만 담을 수 있어요!');
        return;
      }

      var product = products.firstWhere(
        (p) => p.name == productName,
        orElse: () => Product('', 0),
      );

      if (product.name.isEmpty) {
        print('입력값이 올바르지 않아요!');
        return;
      }

      for (int i = 0; i < quantity; i++) {
        cart.add(product);
        totalPrice += product.price;
      }
      print('장바구니에 상품이 담겼어요!');
    } catch (e) {
      print('입력값이 올바르지 않아요!');
    }
  }

  void showTotal() {
    print('장바구니에 ${totalPrice}원 어치를 담으셨네요!');
  }
}

void main() {
  ShoppingMall mall = ShoppingMall();
  bool isRunning = true;

  while (isRunning) {
    print('\n[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니 총 금액 보기 / [4] 프로그램 종료');
    stdout.write('원하는 기능의 번호를 입력하세요: ');
    String? input = stdin.readLineSync();

    switch (input) {
      case '1':
        mall.showProducts();
        break;
      case '2':
        mall.addToCart();
        break;
      case '3':
        mall.showTotal();
        break;
      case '4':
        print('이용해 주셔서 감사합니다 ~ 안녕히 가세요!');
        isRunning = false;
        break;
      default:
        print('지원하지 않는 기능입니다! 다시 시도해 주세요..');
    }
  }
}
