import 'package:examen/base/AbstractApiHandler.dart';

class CartByIdApi extends AbstractApiHandler<int, String> {
  CartByIdApi({
    required super.httpClient,
  });

  static const String _url = 'https://fakestoreapi.com/carts';

  @override
  Future<String> doExecute(int input) async {
    return await webClientGet(
      '$_url/$input',
    );
  }
}