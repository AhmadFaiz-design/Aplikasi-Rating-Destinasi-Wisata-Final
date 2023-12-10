import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService{
  final CollectionReference destinasi = FirebaseFirestore.instance.collection('destinasi');
  final CollectionReference destinasiNew = FirebaseFirestore.instance.collection('destinasiNew');
  final CollectionReference komentar = FirebaseFirestore.instance.collection('komentar');

  //get
  Stream<QuerySnapshot> getDestinasi(){
    return destinasi.snapshots();
  }

  Stream<QuerySnapshot> getDestinasiNew(){
    return destinasiNew.snapshots();
  }
  Stream<QuerySnapshot> getKomentar(){
    return komentar.snapshots();
  }

  //add
  Future<void> addDestinasi(String gambar, String lokasi, String nama_destinasi, String jarak) async{
    destinasi.add({'gambar' : gambar,'lokasi' : lokasi, 'nama_destinasi' : nama_destinasi, 'jarak' : jarak});
  }

  Future<void> addKomentar(String nama, String email, String komentar) async{
    this.komentar.add({'nama' : nama, 'email' : email, 'komentar' : komentar});
  }

  //update
  Future<void> updateDestinasi(String id, String lokasi, String nama_destinasi) async{
    destinasi.doc(id).update({'lokasi' : lokasi, 'nama_destinasi' : nama_destinasi});
  }

  Future<void> updateKomentar(String id, String komentar) async{
    this.komentar.doc(id).update({'komentar' : komentar});
  }
  //delete
  Future<void> deleteDestinasi(String id) async{
    destinasi.doc(id).delete();
  }

    Future<void> deleteKomentar(String id) async{
    this.komentar.doc(id).delete();
  }
}