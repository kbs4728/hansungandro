// models/sale_post.dart

class SalePost {
  final String title;
  final String description;
  final int price;
  final String seller;

  SalePost({
    required this.title,
    required this.description,
    required this.price,
    required this.seller,
  });
}

List<SalePost> salePosts = [
  SalePost(
    title: '아이폰 12 팝니다',
    description: '새로 산 아이폰 12 팝니다. 사용 일주일.',
    price: 1200000,
    seller: 'user1',
  ),
  SalePost(
    title: '맥북 프로 2021',
    description: '맥북 프로 2021 모델 팝니다. 최상의 상태.',
    price: 2500000,
    seller: 'user2',
  ),
  // ... 더 많은 판매 글 추가
];
