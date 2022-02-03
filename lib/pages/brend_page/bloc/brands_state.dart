part of 'brands_cubit.dart';

class BrandsState {
  late List<BrandModel> brands;
  TextEditingController? filter = TextEditingController();

  BrandsState({required this.brands, required this.filter});
}
