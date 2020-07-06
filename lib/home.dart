
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import './cad_sanduiche.dart';
import './sanduiche.dart';



class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
 
  List<Sanduiche> items;
  var db = Firestore.instance;

  StreamSubscription<QuerySnapshot> sanduicheCadastro;

  @override
  void initState() {
    super.initState();

      items = List();
      sanduicheCadastro?.cancel();

      sanduicheCadastro =
      db.collection("sanduiches").snapshots().listen((snapshot){
          final List<Sanduiche> sanduiches = snapshot.documents
            .map(
              (documentSnapshot) => Sanduiche.fromMap(
                documentSnapshot.data, documentSnapshot.documentID
              ),    
            ).toList();

            setState(() {
              this.items = sanduiches;
            });

      });


  }

  @override
  void dispose() {
    sanduicheCadastro?.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Sanduíches"),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: getListaSanduiches(),
              builder: (context, snapshot) {
                switch(snapshot.connectionState){
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                  default:
                    List<DocumentSnapshot> documentos =
                      snapshot.data.documents;
                    return ListView.builder(
                      itemCount: documentos.length,
                      itemBuilder: (context, index){
                        return ListTile(
                          title: Text(items[index].nome,
                            style: TextStyle(fontSize: 20)),
                          subtitle: Text(items[index].recheio,
                            style: TextStyle(fontSize: 20)),
                          leading: Column(
                            children: <Widget>[
                              IconButton(
                                icon: const Icon(Icons.delete_forever),
                                onPressed: (){
                                  _deletaSanduiche(context, documentos[index], index);
                                }
                              )
                            ],
                          ),
                          onTap: ()=> _navegarParaSanduiche(context,items[index]),
                        );
                      },
                    );
                }
              }
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blue[800],
        onPressed: () => _criarNovoSanduiche(context, Sanduiche(null,'','','','','','','','')),
      ),
    );
  }

  Stream<QuerySnapshot> getListaSanduiches() {
    return Firestore.instance.collection('sanduiches')
      .snapshots();
  }

  void _deletaSanduiche(BuildContext context, DocumentSnapshot doc, int position) async {
    db.collection("sanduiches").document(doc.documentID).delete();

    setState( () {
        items.removeAt(position);
    });
  }

  void _navegarParaSanduiche(BuildContext context, Sanduiche sanduiche) async {
    await Navigator.push(context,
      MaterialPageRoute(builder: (context) => CadSanduiche(sanduiche)),
    );
  }
  void _criarNovoSanduiche(BuildContext context, Sanduiche sanduiche) async {
    await Navigator.push(context,
      MaterialPageRoute(builder: (context) => CadSanduiche(Sanduiche(null, '', '','','','','','',''))),
    );
  }
}
