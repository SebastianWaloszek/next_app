import 'package:next_app/data/network/request.dart';

abstract class NetworkService {
  Future<dynamic> make<T>(Request<T> request);
}
