import 'package:drinks_flutter_before/src/models/categoriesModel.dart';
import 'package:drinks_flutter_before/src/resources/drinkApiRepository.dart';

class HomeBloc{
  final _repository = DrinkApiRepository();

  dispose() {
    // TODO: do something in here
  }  

  Future<Categories> getCategories() async {
    return await _repository.getCategories();
  }
}

final homebloc = HomeBloc();