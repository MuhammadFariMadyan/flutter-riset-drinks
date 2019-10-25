import 'package:drinks_flutter_before/src/models/lookupDrinksById/lookupDrinksById.dart';
import 'package:drinks_flutter_before/src/resources/drinkApiRepository.dart';

class DetailDrinksBloc {
  final _drinkRepository = DrinkApiRepository();

  dispose() {
    // TODO: do something in here
  }

  Future<LookupDrinksById> getDetailsDrinksById(String idDrink) async {
    return await _drinkRepository.getLookupDrinksById(idDrink);
  }

}

final detailsDrinksBloc = DetailDrinksBloc();