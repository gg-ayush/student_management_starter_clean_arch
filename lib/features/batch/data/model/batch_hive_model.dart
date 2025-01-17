import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:student_management_starter/app/constants/hive_table_constant.dart';
import 'package:student_management_starter/features/batch/domain/entity/batch_entity.dart';
import 'package:uuid/uuid.dart';

// 'dart run build_runner build -d' by using this command generate the 'batch_hive_model.g.dart' automatically

part 'batch_hive_model.g.dart';

final batchHiveModelProvider = Provider(
  (ref) => BatchHiveModel.empty(),
);

@HiveType(typeId: HiveTableConstant.batchTableId)
class BatchHiveModel {
  @HiveField(0)
  final String? batchId;
  @HiveField(1)
  final String batchName;

  // BatchHiveModel({
  //   this.batchId,
  //   required this.batchName,
  // });

  BatchHiveModel({
    String? batchId,
    required this.batchName,
  }) : batchId = batchId ?? const Uuid().v4();

  BatchHiveModel.empty()
      : batchId = '',
        batchName = '';

  //Convert Hive Object to entity

  BatchEntity toEntity() => BatchEntity(
        batchId: batchId,
        batchName: batchName,
      );

  //Convert Entity to Hive Object
  BatchHiveModel fromEntity(BatchEntity entity) =>
      BatchHiveModel(batchId: batchId, batchName: batchName);

  //Convert Hive List to Entity List
  List<BatchEntity> toEntityList(List<BatchHiveModel> models) =>
      models.map((model) => model.toEntity()).toList();
}
