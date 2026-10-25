import 'package:examen/base/Response.dart';

abstract interface class Adapter<I, O> {
  Response<O> execute(I input);
}