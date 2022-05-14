import 'package:dartz/dartz.dart';

import '../../../error/failures.dart';
import '../entities/response/comment_response_entity.dart';

abstract class Repository {
  Future<Either<Failure, List<CommentDataEntity>>> getComments();
}
