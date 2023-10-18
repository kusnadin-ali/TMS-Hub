class PresensiModel {
  final int idPresensi;
  final int idUser;
  final String namaUser;
  final DateTime checkIn;
  final DateTime checkOut;
  final String? mapsCheckin;
  final String? mapsCheckout;

  const PresensiModel(
      {required this.idPresensi,
      required this.idUser,
      required this.namaUser,
      required this.checkIn,
      required this.checkOut,
      required this.mapsCheckin,
      required this.mapsCheckout});

  factory PresensiModel.formJson(Map<String, dynamic> json) {
    return PresensiModel(
        idPresensi: json['id_presensi'],
        idUser: json['id_user'],
        namaUser: json['nama_user'],
        checkIn: DateTime.parse(json['check_in']),
        checkOut: DateTime.parse(json['check_out']),
        mapsCheckin: json['maps_checkin'],
        mapsCheckout: json['maps_checkout']);
  }
}
