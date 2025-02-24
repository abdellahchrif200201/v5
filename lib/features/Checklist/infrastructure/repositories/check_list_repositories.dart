

import 'package:dartz/dartz.dart';
import 'package:devti_agro/core/error/failures.dart';
import 'package:devti_agro/features/Checklist/domain/entities/check_list.dart';
import 'package:flutter/material.dart';

abstract class CheckListRepositories{
  Future<Either<Failure , List<CheckList>>> getAllCheckList();
  Future<Either<Failure , List<CheckList>>> getCheckListsByDateRange(DateTimeRange dateRange);
  Future<Either<Failure , List<CheckList>>> getCheckListsByName(String name);
}