class PresensiModel {
  final int idPresensi;
  final int idUser;
  final String namaUser;
  final DateTime checkIn;
  final DateTime checkOut;
  final String mapsCheckin;
  final String mapsCheckout;

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
        idPresensi: json['idPresensi'],
        idUser: json['idUser'],
        namaUser: json['namaUser'],
        checkIn: json['checkIn'],
        checkOut: json['checkOut'],
        mapsCheckin: json['mapsCheckin'],
        mapsCheckout: json['mapsCheckout']);
  }
}
