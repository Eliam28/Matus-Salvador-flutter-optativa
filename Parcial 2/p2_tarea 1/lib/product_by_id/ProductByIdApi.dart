import 'package:examen/base/AbstractApiHandler.dart';

class ProductByIdApi extends AbstractApiHandler<int, String> {
  ProductByIdApi({
    required super.httpClient,
  });

  static const String _url = 'https://fakestoreapi.com/products';

  @override
  Future<String> doExecute(int input) async {
    return await webClientGet(
      '$_url/$input',
    );
  }
}