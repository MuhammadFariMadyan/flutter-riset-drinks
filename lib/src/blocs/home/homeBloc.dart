import 'package:drinks_flutter_before/src/models/categoriesModel.dart';
import 'package:drinks_flutter_before/src/resources/drinkApiRepository.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc{
  final _repository = DrinkApiRepository();
  final _getListCategories = PublishSubject<Categories>();

  dispose() {
    _getListCategories.close();
  }

  Future<Categories> getCategories() async {
    return await _repository.getCategories();
  }

  Future<bool> getStaticData() async {
    await Future.delayed(const Duration(milliseconds: 50));
    return true;
  }

  // Future<ListCategories> getListCategoryStatic() async {
  //   return await _repository.getListCategoryStatic();
  // }
}

final homeBloc = HomeBloc();