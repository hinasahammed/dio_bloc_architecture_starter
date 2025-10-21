import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio_bloc_architecture_starter/core/network/networkInfo/network_info.dart';

class NetworkInfoImpl implements NetworkInfo {
  NetworkInfoImpl({required this.connectivity});

  final Connectivity connectivity;

  @override
  Future<bool> get isConnected async {
    final result = await connectivity.checkConnectivity();
    return !result.contains(ConnectivityResult.none);
  }
}
