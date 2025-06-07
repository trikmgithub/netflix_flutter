import 'package:dartz/dartz.dart';
import 'package:netflix/domain/auth/repositories/auth.dart';

import '../../../core/usecase/usecase.dart';
import '../../../service_locator.dart';

class IsLoggedInUseCase extends UseCase<bool, dynamic> {
  @override
  Future<bool> call({params}) async {
    return await sl<AuthRepository>().isLoggedIn();
  }

}
