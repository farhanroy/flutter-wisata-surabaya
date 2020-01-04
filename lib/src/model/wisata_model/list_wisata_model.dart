

import 'item_wisata_model.dart';

import 'dart:convert';

class ListWisataModel {
    final List<Datum> data;

    ListWisataModel({
        this.data,
    });

    factory ListWisataModel.fromRawJson(String str) => ListWisataModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListWisataModel.fromJson(Map<String, dynamic> json) => ListWisataModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}