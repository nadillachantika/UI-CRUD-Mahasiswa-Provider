import 'package:crud_provider/model/res_get_mahasiswa.dart';
import 'package:crud_provider/provider/mahasiswa_provider.dart';
import 'package:crud_provider/ui/add_mahasiswa.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // theme: ThemeData(
      //  // primarySwatch: Color,
      // ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final listKey = GlobalKey<AnimatedListState>();
  //
  // final List<Datum> items = List.from(listMa);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MahasiswaProvider())
      ],
      child: Consumer<MahasiswaProvider>(builder: (context, mhsprovider, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'CRUD Provider',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            elevation: 0,
            backgroundColor: Colors.white,
          ),
          body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView.builder(
              itemCount: mhsprovider.listMahasiswa.length,
              itemBuilder: (context, index) {
                Datum data = mhsprovider.listMahasiswa[index];
                return Column(
                  children: [
                    InkWell(
                      onTap: () async {
                        var result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => AddMahasiswa(
                                      // title: 'Update',
                                      mahasiswaProvider: mhsprovider,
                                      data: data,
                                    )));
                        if (result != null) {
                          mhsprovider.rebuildData();
                        }
                      },
                      child: Card(
                        shadowColor: Colors.black,
                        child: ListTile(
                          title: Text(
                            '${data.nama}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            '${data.nim}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          trailing: InkWell(
                              onTap: () {
                                print('clicked');
                              },
                              child: InkWell(
                                onTap: (){
                                  mhsprovider.deleteMahasiswa(index, data);
                                },
                                child: Container(
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width*0.1,
                                  child: Icon(
                                    Icons.delete,
                                    color: Color(0xFF801E48),
                                  ),
                                ),
                              )),
                        ),
                      ),
                    ),
                    // FloatingActionButton(
                    //   backgroundColor: Color(0xFF801E48),
                    //   foregroundColor: Colors.white,
                    //   onPressed: () async {
                    //     var result = await Navigator.push(
                    //         context, MaterialPageRoute(builder: (_) => AddMahasiswa(
                    //       mahasiswaProvider: mhsprovider,
                    //       data: data,
                    //     )));
                    //
                    //     // Respond to button press
                    //   },
                    //   child: Icon(Icons.add),
                    // )
                  ],
                );
              },
            ),
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: FloatingActionButton(
              backgroundColor: Color(0xFF801E48),
              foregroundColor: Colors.white,
              onPressed: () async {
                var result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => AddMahasiswa(
                              title: 'Add',
                              mahasiswaProvider: mhsprovider,
                              // data: ,
                            )));
                if (result != null) {
                  mhsprovider.rebuildData();
                }

                // Respond to button press
              },
              child: Icon(Icons.add),
            ),
          ),
        );
      }),
    );
  }
}
