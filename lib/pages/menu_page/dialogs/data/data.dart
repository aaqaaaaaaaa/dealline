class MagzinModel {
  String dokon;
  String region;

  MagzinModel({
    required this.dokon,
    required this.region,
  });

  factory MagzinModel.fromJson(Map<String, dynamic> json) {
    return MagzinModel(
      dokon: json['dokon'],
      region: json['region'],
    );
  }
}

final market_list = <MagzinModel>[
  MagzinModel(dokon: 'Dokon1', region: 'Toshkent'),
  MagzinModel(dokon: 'Dokon2', region: 'Margilan'),
  MagzinModel(dokon: 'Dokon3', region: 'Fergana'),
  MagzinModel(dokon: 'Dokon4', region: 'Samarqand'),
  MagzinModel(dokon: 'Dokon1', region: 'Toshkent'),
  MagzinModel(dokon: 'Dokon2', region: 'Margilan'),
  MagzinModel(dokon: 'Dokon3', region: 'Fergana'),
  MagzinModel(dokon: 'Dokon4', region: 'Samarqand'),
];

// Map brandMap = {
//   'assets/dokons/brand_logo/samsungLog.png': 'Samsung',
//   'assets/dokons/brand_logo/chigoLogo.png': 'Chigo',
//   'assets/dokons/brand_logo/artelLogo.png': 'Artel',
//   'assets/dokons/brand_logo/lg-logo-png-3 1.png': 'LG',
//   'assets/dokons/brand_logo/phillipsLogo.png': 'Phillips',
//   'assets/dokons/brand_logo/Panasonic_logo_blue 1.png': 'Panasonic',
//   'assets/dokons/brand_logo/indesit-logo-logotype 1.png': 'Indesit',
//   'assets/dokons/brand_logo/pioneer.png': 'Pioneer',
//   'assets/dokons/brand_logo/Beko.png': 'Beko',
//   'assets/dokons/brand_logo/sony Logo.png': 'Sony',
//   'assets/dokons/brand_logo/miLogo.png': 'MI',
//   'assets/dokons/brand_logo/1009px-Apple_logo_black 1.png': 'Apple',
//   'assets/dokons/brand_logo/Canon 1.png': "Canon",
//   'assets/dokons/brand_logo/huawei 2.png': 'Huawei',
// };
// List brandList = [
//   'assets/dokons/brand_logo/samsungLog.png',
//   'assets/dokons/brand_logo/chigoLogo.png',
//   'assets/dokons/brand_logo/artelLogo.png',
//   'assets/dokons/brand_logo/lg-logo-png-3 1.png',
//   'assets/dokons/brand_logo/phillipsLogo.png',
//   'assets/dokons/brand_logo/Panasonic_logo_blue 1.png',
//   'assets/dokons/brand_logo/indesit-logo-logotype 1.png',
//   'assets/dokons/brand_logo/pioneer.png',
//   'assets/dokons/brand_logo/Beko.png',
//   'assets/dokons/brand_logo/sony Logo.png',
//   'assets/dokons/brand_logo/miLogo.png',
//   'assets/dokons/brand_logo/1009px-Apple_logo_black 1.png',
//   'assets/dokons/brand_logo/Canon 1.png',
//   'assets/dokons/brand_logo/huawei 2.png',
// ];
