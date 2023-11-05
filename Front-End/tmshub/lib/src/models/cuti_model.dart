class CutiModel {
  final int idCuti;
  final int idUser;
  final DateTime? tglMulai;
  final DateTime? tglSelesai;
  final String jenisCuti;
  final String keterangan;
  final int sisaCuti;
  final String statusCuti;
  final int idAdmin;

  CutiModel(
      {required this.idCuti,
      required this.idUser,
      required this.tglMulai,
      required this.tglSelesai,
      required this.jenisCuti,
      required this.keterangan,
      required this.sisaCuti,
      required this.statusCuti,
      required this.idAdmin});

  factory CutiModel.fromJson(Map<String, dynamic> json) {
    return CutiModel(
        idCuti: json['id_cuti'],
        idUser: json['id_user'],
        tglMulai: json['tgl_mulai'],
        tglSelesai: json['tgl_selesai'],
        jenisCuti: json['jenis_cuti'],
        keterangan: json['keterangan'],
        sisaCuti: json['sisa_cuti'],
        statusCuti: json['status_cuti'],
        idAdmin: json['id_admin']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id_cuti': idCuti,
      'id_user': idUser,
      'tgl_mulai': tglMulai,
      'tgl_selesai': tglSelesai,
      'jenis_cuti': jenisCuti,
      'keterangan': keterangan,
      'sisa_cuti': sisaCuti,
      'status_cuti': statusCuti,
      'id_admin': idAdmin,
    };
  }
}
