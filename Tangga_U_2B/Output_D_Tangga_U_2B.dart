import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perancangan_tangga_app/Tambahan_Menu/drawer.dart';
import 'package:perancangan_tangga_app/Page/main_page.dart';
import 'package:perancangan_tangga_app/Page/second_page.dart';
import 'package:perancangan_tangga_app/Page/third_page.dart';
import 'package:perancangan_tangga_app/fourth.dart';
import 'package:perancangan_tangga_app/Tambahan_Menu/sharepreferences.dart';
import 'package:perancangan_tangga_app/save_load_data.dart';
import 'package:perancangan_tangga_app/Tangga_I/Output_Tangga_I.dart';
import 'package:perancangan_tangga_app/Main/simpanan.dart';
import 'package:perancangan_tangga_app/Main/Variable.dart';
import 'package:perancangan_tangga_app/Main/hitungan_tangga.dart';
import 'package:perancangan_tangga_app/Tangga_U_2B/Gambar_Tangga_U_2B.dart';
import 'package:perancangan_tangga_app/Tangga_U_2B/Hitung_Tangga_U_2B.dart';
import 'package:perancangan_tangga_app/Tangga_U_2B/Output_Tangga_U_2B.dart';

class OutputD_Tangga_U_2BPage extends StatefulWidget {

  final Projek projek;
  final Task task;
  OutputD_Tangga_U_2BPage({this.projek,this.task});

  @override
  State<OutputD_Tangga_U_2BPage> createState() => _OutputD_Tangga_U_2BPageState();
}

class _OutputD_Tangga_U_2BPageState extends State<OutputD_Tangga_U_2BPage> {
//variable + keadaan awal
  final _formKey = GlobalKey<FormState>();
  final controllerPanjangT1 = new TextEditingController(text: '0');
  final controllerPanjangT2 = new TextEditingController(text: '0');
  final controllerPanjangT3 = new TextEditingController(text: '0');
  final controllerTinggiT1 = new TextEditingController(text: '0');
  final controllerTinggiT2 = new TextEditingController(text: '0');
  final controllerTinggiT3 = new TextEditingController(text: '0');
  final controllerOptrade1 = new TextEditingController(text: '0');
  final controllerOptrade2 = new TextEditingController(text: '0');
  final controllerOptrade3 = new TextEditingController(text: '0');
  final controllerLebarT = new TextEditingController(text: '0');
  final controllerLebarB = new TextEditingController(text: '0');
  final controllerPanjangB = new TextEditingController(text: '0');
  final controllerNama = new TextEditingController();


  DateTime _tanggal = DateTime.now();
  String _jenis = 'Tangga U 2B';
  String _nama = '';
  String _keterangan = '';
  String _satuan = 'cm';
  String _ukuranTangga = 'Sama';
  String _pembagiA = '1 cm';
  String _pembagiO = '1 cm';
  String _mirror = '0';
  String _teratas = 'Antrede';


  List Data1_;
  List Data2_;
  List Data3_;

  //ceking
  String ini = "Cek";

  //visibel gambar
  String _visible = "0";
  bool isSetting = false;
  bool isGambar1 = false;
  bool isGambar2 = false;
  bool isGambar3 = false;
  bool DataPenulangan = false;
  bool isUkuranTangga = true;

  @override
  void initState() {
    super.initState();
    if (widget.task != null) {
      controllerNama.text = widget.task.nama;
      _jenis = widget.task.jenis;
      controllerPanjangT1.text = widget.task.panjangT1.toString();
      controllerTinggiT1.text = widget.task.tinggiT1.toString();
      controllerOptrade1.text = widget.task.optredeR1.toString();
      controllerPanjangT2.text = widget.task.panjangT2.toString();
      controllerTinggiT2.text = widget.task.tinggiT2.toString();
      controllerOptrade2.text = widget.task.optredeR2.toString();
      controllerPanjangT3.text = widget.task.panjangT3.toString();
      controllerTinggiT3.text = widget.task.tinggiT3.toString();
      controllerOptrade3.text = widget.task.optredeR3.toString();
      controllerLebarT.text = widget.task.lebarT.toString();
      controllerLebarB.text = widget.task.lebarB.toString();
      controllerPanjangB.text = widget.task.panjangB.toString();

      _satuan = widget.task.satuan;
      _ukuranTangga = widget.task.ukuranTangga;
      _pembagiA = widget.task.pembagiA;
      _pembagiO = widget.task.pembagiO;
      _visible = widget.task.visible;
      _mirror = widget.task.mirror;
      _teratas = widget.task.teratas;
    }
    MasukanData(widget.task);
    Hitung_T_U_2B();

    if(_ukuranTangga == 'Sama'){
      isUkuranTangga = true;
    }else{
      isUkuranTangga = false;
    }

    if (_visible == '1') {
      isGambar1 = true;
      isGambar2 = true;
      isGambar3 = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final LLayar = MediaQuery.of(context).size.width;
    final TLayar = MediaQuery.of(context).size.height;
    LebarCanvas = LLayar - 40;

    return Scaffold(
        appBar: AppBar(
          title: Text('Desain'),
          backgroundColor: Colors.green[500],
          // leading: IconButton(onPressed:() {Get.to(Output_Tangga_U_2BPage(projek: widget.projek,task: widget.task,));},
          //   icon:Icon(Icons.arrow_back),
          //   color: Colors.white,
          // ),
          actions: [
            IconButton(icon: Icon(Icons.more_vert_rounded), onPressed: () {})
          ],
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 5),
            child: ListView(
              children: <Widget>[
                //hasil
                Card(
                  margin:
                  EdgeInsets.only(right: 0, left: 0, top: 0, bottom: 10),
                  child: Column(
                    children: [
                      Visibility(
                        visible: isUkuranTangga,
                        child: Container(
                          padding:
                          EdgeInsets.only(right: 10, left: 10, top: 3, bottom: 3),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Center(child: Text('Hasil Perhitungan')),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Tangga Atas = Tangga Tengah = Tangga Bawah'),
                                buildContainerHasil(
                                    "Panjang Tangga", PanjangT_1.toNaN().toSatuan(_satuan),_satuan,LLayar),
                                buildContainerHasil(
                                    "Tinggi Tangga", TinggiT_1.toNaN().toSatuan(_satuan),_satuan,LLayar),
                                buildContainerHasil(
                                    "Tebal Pelat", TebalPelatTanggaPilih_1.toNaN().toSatuan(_satuan),_satuan,LLayar),
                                buildContainerHasil(
                                    "Lebar Tangga", LebarT.toNaN().toSatuan(_satuan),_satuan,LLayar),
                                buildContainerHasil("Sudut Tangga", Sudut_1.toNaN(), "°",LLayar),
                                buildContainerHasil(
                                    "Antrade", Antrede_1.toNaN().toSatuan(_satuan),_satuan,LLayar),
                                buildContainerHasil(
                                    "Antrade Total", AntredeNT_1.toNaN(), "buah",LLayar),
                                buildContainerHasil(
                                    "Antrade Biasa", AntredeN_1.toNaN(), "buah",LLayar),
                                buildContainerHasil(
                                    "Antrade + 1cm ", AntredeN1_1.toNaN(), "buah",LLayar),
                                buildContainerHasil(
                                    "Antrade - 1cm", Antrede1N_1.toNaN(), "buah",LLayar),
                                buildContainerHasil(
                                    "Optrade", Optrede_1.toNaN().toSatuan(_satuan),_satuan,LLayar),
                                buildContainerHasil(
                                    "Optrade Total", OptredeNT_1.toNaN(), "buah",LLayar),
                                buildContainerHasil(
                                    "Optrade Biasa", OptredeN_1.toNaN(), "buah",LLayar),
                                buildContainerHasil(
                                    "Optrade + 1cm", OptredeN1_1.toNaN(), "buah",LLayar),
                                buildContainerHasil(
                                    "Optrade - 1cm", Optrede1N_1.toNaN(), "buah",LLayar),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Bordes"),
                                buildContainerHasil("Panjang Bordes", PanjangB_2.toNaN().toSatuan(_satuan),_satuan,LLayar),
                                buildContainerHasil("Tinggi Balok Bordes", hB.toNaN().toSatuan(_satuan),_satuan,LLayar),
                                buildContainerHasil("Lebar Balok Bordes", bB.toNaN().toSatuan(_satuan),_satuan,LLayar),
                                buildContainerHasil("Tebal Pelat Bordes", TebalPelatBordesPilih_2.toNaN().toSatuan(_satuan),_satuan,LLayar),
                                SizedBox(
                                  height: 5,
                                ),
                              ]),
                        ),
                      ),
                      Visibility(
                        visible: !isUkuranTangga,
                        child: Container(
                          padding:
                          EdgeInsets.only(right: 10, left: 10, top: 3, bottom: 3),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Center(child: Text('Hasil Desain')),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Tangga Atas'),
                                buildContainerHasil(
                                    "Panjang Tangga", PanjangT_3.toNaN().toSatuan(_satuan),_satuan,LLayar),
                                buildContainerHasil(
                                    "Tinggi Tangga", TinggiT_3.toNaN().toSatuan(_satuan),_satuan,LLayar),
                                buildContainerHasil(
                                    "Tebal Pelat", TebalPelatTanggaPilih_3.toNaN().toSatuan(_satuan),_satuan,LLayar),
                                buildContainerHasil(
                                    "Lebar Tangga", LebarT.toNaN().toSatuan(_satuan),_satuan,LLayar),
                                buildContainerHasil("Sudut Tangga", Sudut_3.toNaN(), "°",LLayar),
                                buildContainerHasil(
                                    "Antrade", Antrede_3.toNaN().toSatuan(_satuan),_satuan,LLayar),
                                buildContainerHasil(
                                    "Antrade Total", AntredeNT_3.toNaN(), "buah",LLayar),
                                buildContainerHasil(
                                    "Antrade Biasa", AntredeN_3.toNaN(), "buah",LLayar),
                                buildContainerHasil(
                                    "Antrade + 1cm ", AntredeN1_3.toNaN(), "buah",LLayar),
                                buildContainerHasil(
                                    "Antrade - 1cm", Antrede1N_3.toNaN(), "buah",LLayar),
                                buildContainerHasil(
                                    "Optrade", Optrede_3.toNaN().toSatuan(_satuan),_satuan,LLayar),
                                buildContainerHasil(
                                    "Optrade Total", OptredeNT_3.toNaN(), "buah",LLayar),
                                buildContainerHasil(
                                    "Optrade Biasa", OptredeN_3.toNaN(), "buah",LLayar),
                                buildContainerHasil(
                                    "Optrade + 1cm", OptredeN1_3.toNaN(), "buah",LLayar),
                                buildContainerHasil(
                                    "Optrade - 1cm", Optrede1N_3.toNaN(), "buah",LLayar),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('Tangga Tengah'),
                                buildContainerHasil(
                                    "Panjang Tangga", PanjangT_2.toNaN().toSatuan(_satuan),_satuan,LLayar),
                                buildContainerHasil(
                                    "Tinggi Tangga", TinggiT_2.toNaN().toSatuan(_satuan),_satuan,LLayar),
                                buildContainerHasil(
                                    "Tebal Pelat", TebalPelatTanggaPilih_2.toNaN().toSatuan(_satuan),_satuan,LLayar),
                                buildContainerHasil(
                                    "Lebar Tangga", LebarT.toNaN().toSatuan(_satuan),_satuan,LLayar),
                                buildContainerHasil("Sudut Tangga", Sudut_2.toNaN(), "°",LLayar),
                                buildContainerHasil(
                                    "Antrade", Antrede_2.toNaN().toSatuan(_satuan),_satuan,LLayar),
                                buildContainerHasil(
                                    "Antrade Total", AntredeNT_2.toNaN(), "buah",LLayar),
                                buildContainerHasil(
                                    "Antrade Biasa", AntredeN_2.toNaN(), "buah",LLayar),
                                buildContainerHasil(
                                    "Antrade + 1cm ", AntredeN1_2.toNaN(), "buah",LLayar),
                                buildContainerHasil(
                                    "Antrade - 1cm", Antrede1N_2.toNaN(), "buah",LLayar),
                                buildContainerHasil(
                                    "Optrade", Optrede_2.toNaN().toSatuan(_satuan),_satuan,LLayar),
                                buildContainerHasil(
                                    "Optrade Total", OptredeNT_2.toNaN(), "buah",LLayar),
                                buildContainerHasil(
                                    "Optrade Biasa", OptredeN_2.toNaN(), "buah",LLayar),
                                buildContainerHasil(
                                    "Optrade + 1cm", OptredeN1_2.toNaN(), "buah",LLayar),
                                buildContainerHasil(
                                    "Optrade - 1cm", Optrede1N_2.toNaN(), "buah",LLayar),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('Tangga Bawah'),
                                buildContainerHasil(
                                    "Panjang Tangga", PanjangT_1.toNaN().toSatuan(_satuan),_satuan,LLayar),
                                buildContainerHasil(
                                    "Tinggi Tangga", TinggiT_1.toNaN().toSatuan(_satuan),_satuan,LLayar),
                                buildContainerHasil(
                                    "Tebal Pelat", TebalPelatTanggaPilih_1.toNaN().toSatuan(_satuan),_satuan,LLayar),
                                buildContainerHasil(
                                    "Lebar Tangga", LebarT.toNaN().toSatuan(_satuan),_satuan,LLayar),
                                buildContainerHasil("Sudut Tangga", Sudut_1.toNaN(), "°",LLayar),
                                buildContainerHasil(
                                    "Antrade", Antrede_1.toNaN().toSatuan(_satuan),_satuan,LLayar),
                                buildContainerHasil(
                                    "Antrade Total", AntredeNT_1.toNaN(), "buah",LLayar),
                                buildContainerHasil(
                                    "Antrade Biasa", AntredeN_1.toNaN(), "buah",LLayar),
                                buildContainerHasil(
                                    "Antrade + 1cm ", AntredeN1_1.toNaN(), "buah",LLayar),
                                buildContainerHasil(
                                    "Antrade - 1cm", Antrede1N_1.toNaN(), "buah",LLayar),
                                buildContainerHasil(
                                    "Optrade", Optrede_1.toNaN().toSatuan(_satuan),_satuan,LLayar),
                                buildContainerHasil(
                                    "Optrade Total", OptredeNT_1.toNaN(), "buah",LLayar),
                                buildContainerHasil(
                                    "Optrade Biasa", OptredeN_1.toNaN(), "buah",LLayar),
                                buildContainerHasil(
                                    "Optrade + 1cm", OptredeN1_1.toNaN(), "buah",LLayar),
                                buildContainerHasil(
                                    "Optrade - 1cm", Optrede1N_1.toNaN(), "buah",LLayar),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Bordes"),
                                buildContainerHasil("Tinggi Balok Bordes", hB.toNaN().toSatuan(_satuan),_satuan,LLayar),
                                buildContainerHasil("Lebar Balok Bordes", bB.toNaN().toSatuan(_satuan),_satuan,LLayar),
                                buildContainerHasil("Tebal Pelat Bordes", TebalPelatBordesPilih_3.toNaN().toSatuan(_satuan),_satuan,LLayar),
                                SizedBox(
                                  height: 5,
                                ),
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
                //gambar
                Visibility(
                  visible: isGambar1,
                  child: Column(
                    children: [
                      buildDivider(2),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green[500],
                          ),
                          margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          //color: Colors.green[500],
                          child: CustomPaint(
                            size: Size(LebarCanvas, TinggiCanvasa),
                            painter: Gambar_Tangga_U_2B_1(),
                          )),
                    ],
                  ),
                ),
                Visibility(
                  visible: isGambar2,
                  child: Column(
                    children: [
                      buildDivider(2),
                      Center(
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.green[500],
                            ),
                            margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            //color: Colors.green[500],
                            child: CustomPaint(
                              size: Size(LebarCanvas, TinggiCanvasb),
                              painter: Gambar_Tangga_U_2B_2(),
                            )),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: isGambar3,
                  child: Column(
                    children: [
                      buildDivider(2),
                      Center(
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.green[500],
                            ),
                            margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            //color: Colors.green[500],
                            child: CustomPaint(
                              size: Size(LebarCanvas, TinggiCanvasc),
                              painter: Gambar_Tangga_U_2B_3(),
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}