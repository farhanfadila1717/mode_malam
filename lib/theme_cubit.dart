import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.light);

  //// Fungsi yang akan merubah state(ThemeMode)
  //// dan akan meng-emit state terakhir
  //// dan akan menyimpannya melalui override toJson
  changeThame() {
    if (state == ThemeMode.light) {
      emit(ThemeMode.dark);
    } else {
      emit(ThemeMode.light);
    }
  }

  //// Berfungsi mengambil data yang disimpan melalui override toJson ketika ThemeCubit ini
  //// Pertama kali di panggill
  //// Karena data yang disimpan berbentuk String kita harus merubahnya kembali
  //// Kebentuk enum ThemeMode menggunakan Extensions
  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    try {
      return (json['theme'] as String).toThemeMode;
    } catch (_) {
      throw UnimplementedError();
    }
  }

  ////Ini berfungsi menyimpan state(ThemeMode) terakhir ke database(Hive) dalam format Json
  @override
  Map<String, dynamic>? toJson(ThemeMode state) => {'theme': state.toString()};
}

//// Extensions ini berfungsi mengubah String ThemeMode.. ke bentuk Enum ThemeMode..
extension ThemeModeExtension on String {
  ThemeMode get toThemeMode =>
      this == 'ThemeMode.dark' ? ThemeMode.dark : ThemeMode.light;
}
