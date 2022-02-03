class BrandModel {
  String image;
  String title;

  BrandModel({
    required this.image,
    required this.title,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      image: json['image'],
      title: json['title'],
    );
  }
}

final model_list = <BrandModel>[
  BrandModel(
      image: 'assets/images/brand_logo/samsungLog.png', title: 'Samsung'),
  BrandModel(image: 'assets/images/brand_logo/chigoLogo.png', title: 'Chigo'),
  BrandModel(image: 'assets/images/brand_logo/artelLogo.png', title: 'Artel'),
  BrandModel(
      image: 'assets/images/brand_logo/lg-logo-png-3 1.png', title: 'LG'),
  BrandModel(
      image: 'assets/images/brand_logo/phillipsLogo.png', title: 'Phillips'),
  BrandModel(
      image: 'assets/images/brand_logo/Panasonic_logo_blue 1.png',
      title: 'Panasonic'),
  BrandModel(
      image: 'assets/images/brand_logo/indesit-logo-logotype 1.png',
      title: 'Indesit'),
  BrandModel(image: 'assets/images/brand_logo/pioneer.png', title: 'Pioneer'),
  BrandModel(image: 'assets/images/brand_logo/Beko.png', title: 'Beko'),
  BrandModel(image: 'assets/images/brand_logo/sony Logo.png', title: 'Sony'),
  BrandModel(image: 'assets/images/brand_logo/miLogo.png', title: 'MI'),
  BrandModel(
      image: 'assets/images/brand_logo/1009px-Apple_logo_black 1.png',
      title: 'Apple'),
  BrandModel(image: 'assets/images/brand_logo/Canon 1.png', title: 'Canon'),
  BrandModel(image: 'assets/images/brand_logo/huawei 2.png', title: 'Huawei'),
];

Map brandMap = {
  'assets/images/brand_logo/samsungLog.png': 'Samsung',
  'assets/images/brand_logo/chigoLogo.png': 'Chigo',
  'assets/images/brand_logo/artelLogo.png': 'Artel',
  'assets/images/brand_logo/lg-logo-png-3 1.png': 'LG',
  'assets/images/brand_logo/phillipsLogo.png': 'Phillips',
  'assets/images/brand_logo/Panasonic_logo_blue 1.png': 'Panasonic',
  'assets/images/brand_logo/indesit-logo-logotype 1.png': 'Indesit',
  'assets/images/brand_logo/pioneer.png': 'Pioneer',
  'assets/images/brand_logo/Beko.png': 'Beko',
  'assets/images/brand_logo/sony Logo.png': 'Sony',
  'assets/images/brand_logo/miLogo.png': 'MI',
  'assets/images/brand_logo/1009px-Apple_logo_black 1.png': 'Apple',
  'assets/images/brand_logo/Canon 1.png': "Canon",
  'assets/images/brand_logo/huawei 2.png': 'Huawei',
};
// List brandList = [
//   'assets/images/brand_logo/samsungLog.png',
//   'assets/images/brand_logo/chigoLogo.png',
//   'assets/images/brand_logo/artelLogo.png',
//   'assets/images/brand_logo/lg-logo-png-3 1.png',
//   'assets/images/brand_logo/phillipsLogo.png',
//   'assets/images/brand_logo/Panasonic_logo_blue 1.png',
//   'assets/images/brand_logo/indesit-logo-logotype 1.png',
//   'assets/images/brand_logo/pioneer.png',
//   'assets/images/brand_logo/Beko.png',
//   'assets/images/brand_logo/sony Logo.png',
//   'assets/images/brand_logo/miLogo.png',
//   'assets/images/brand_logo/1009px-Apple_logo_black 1.png',
//   'assets/images/brand_logo/Canon 1.png',
//   'assets/images/brand_logo/huawei 2.png',
// ];
