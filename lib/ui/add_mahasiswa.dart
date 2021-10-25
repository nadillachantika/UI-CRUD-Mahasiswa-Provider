import 'package:crud_provider/model/res_get_mahasiswa.dart';
import 'package:crud_provider/provider/mahasiswa_provider.dart';
import 'package:flutter/material.dart';

class AddMahasiswa extends StatefulWidget {
  String? title;
  MahasiswaProvider? mahasiswaProvider;
  Datum? data;

  AddMahasiswa({this.title, this.mahasiswaProvider, this.data});

  @override
  _AddMahasiswaState createState() => _AddMahasiswaState();
}

class _AddMahasiswaState extends State<AddMahasiswa> {
  // TextEditingController nama = TextEditingController();
  // TextEditingController nim = TextEditingController();
  // TextEditingController jurusan = TextEditingController();
  // TextEditingController alamat = TextEditingController();
  // TextEditingController nohp = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.data == null) {
      widget.data =
          Datum(id: '', hp: '', nama: '', nim: '', alamat: '', jurusan: '');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: Text(
          'Add Mahasiswa',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: <Widget>[
            TextFormField(
              initialValue: widget.data?.nama ?? '',
              onChanged: (value) => widget.data?.nama = value,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  ),
                  hintText: 'Nama',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: 10,
            ),

            TextFormField(
              initialValue: widget.data?.nim ?? '',
              onChanged: (value) => widget.data?.nim = value,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                  hintText: 'Nim',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              initialValue: widget.data?.jurusan ?? '',
              onChanged: (value) => widget.data?.jurusan = value,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                  hintText: 'Jurusan',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              initialValue: widget.data?.alamat ?? '',
              onChanged: (value) => widget.data?.alamat = value,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                  hintText: 'Alamat',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              initialValue: widget.data?.hp ?? '',
              onChanged: (value) => widget.data?.hp = value,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                  hintText: 'No Hp',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: 20,
            ),
            Material(
              //Wrap with Material
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              elevation: 18.0,
              color: Color(0xFF801E48),
              clipBehavior: Clip.antiAlias,
              // Add This
              child: MaterialButton(
                minWidth: 200.0,
                height: 50,
                // height: 35,
                color: Color(0xFF801E48),
                child: widget.title == null
                    ? Text('Update',
                        style:
                            new TextStyle(fontSize: 16.0, color: Colors.white))
                    : Text('${widget.title}',
                        style:
                            new TextStyle(fontSize: 16.0, color: Colors.white)),
                onPressed: () {
                  if (widget.title == null) {
                    widget.mahasiswaProvider!.updateMahasiswa(context, widget.data!);
                  } else {
                    widget.mahasiswaProvider!
                        .addMahasiswa(context, widget.data!);
                  }
                },
              ),
            ),
//          setState(() {
//            _isNeedHelp = true;
//          });
          ],
        ),
      ),
      // bottomNavigationBar:  Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: RaisedButton(
      //     color: Colors.lightBlue,
      //     onPressed: () {
      //       // if (widget.title == null) {
      //       //   widget.blocpegawai.updatePegawai(context, widget.data);
      //       // } else {
      //       //   widget.blocpegawai.addData(context, widget.data);
      //       // }
      //     },
      //     child: Text('Add'),
      //     // child: widget.title == null
      //     //     ? Text('Update')
      //     //     : Text('${widget.title}'),
      //   ),
      // ),
    );
  }
}
