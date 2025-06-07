import 'package:dartz/dartz.dart';
import 'package:netflix/core/usecase/usecase.dart';
import 'package:netflix/data/auth/models/signup_req_params.dart';

import '../../../service_locator.dart';
import '../repositories/auth.dart';

class SignupUseCase extends UseCase<Either, SignupReqParams> {

  @override
  Future<Either> call({SignupReqParams? params}) async {
    return await sl<AuthRepository>().signup(params!);
  }
  
}