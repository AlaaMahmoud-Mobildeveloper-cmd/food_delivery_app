import 'package:food_delivery_app/features/home/domain/entities/category.dart';
import 'package:food_delivery_app/features/home/domain/repositories/home_repository.dart';

class GetCategories {
  final HomeRepository repository;

  GetCategories(this.repository);

  Future<List<Category>> call() async {
    return await repository.getCategories();
  }
}
