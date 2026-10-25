import 'package:examen/base/AbstractApiHandler.dart';

class UserByIdApi extends AbstractApiHandler<int, String> {
  UserByIdApi({
    required super.httpClient,
  });

  static const String _url = 'https://fakestoreapi.com/users';

  @override
  Future<String> doExecute(int input) async {
    return await webClientGet(
      '$_url/$input',
    );
  }
}