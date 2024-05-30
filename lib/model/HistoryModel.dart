import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'HistoryModel.g.dart';

@HiveType(typeId: 1)
class HistoryModel {
  HistoryModel(
      {required this.hotelId,
      required this.fromDate,
      required this.toDate,
      required this.time,
      required this.roomType,
      required this.roomPrice,
      required this.totalPrice});

  @HiveField(0)
  String? id;

  @HiveField(1)
  final int hotelId;

  @HiveField(2)
  final DateTime fromDate;

  @HiveField(3)
  final DateTime toDate;

  @HiveField(4)
  final TimeOfDay time;

  @HiveField(5)
  final String roomType;

  @HiveField(6)
  final String roomPrice;

  @HiveField(7)
  final String totalPrice;
}
