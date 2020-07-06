import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './sanduiche.dart';

class CadSanduiche extends StatefulWidget {

  final Sanduiche sanduiche;
  CadSanduiche(this.sanduiche);

  @override
  _CadSanduicheState createState() => _CadSanduicheState();
}


class _CadSanduicheState extends State<CadSanduiche> {

  final db = Firestore.instance;

  TextEditingController _nomeController;
  TextEditingController _paoController;
  TextEditingController _queijoController;
  TextEditingController _recheioController;
  TextEditingController _saladaController;
  TextEditingController _molhoController;
  TextEditingController _acompanhamentoController;
  TextEditingController _bebidaController;

  @override
  void initState() {
    super.initState();
    _nomeController = new TextEditingController(text: widget.sanduiche.nome);
    _paoController = new TextEditingController(text: widget.sanduiche.pao);
    _queijoController = new TextEditingController(text: widget.sanduiche.queijo);
    _recheioController = new TextEditingController(text: widget.sanduiche.recheio);
    _saladaController = new TextEditingController(text: widget.sanduiche.salada);
    _molhoController = new TextEditingController(text: widget.sanduiche.molho);
    _acompanhamentoController = new TextEditingController(text: widget.sanduiche.acompanhamento);
    _bebidaController = new TextEditingController(text: widget.sanduiche.bebida);
  }

  final _formKey = GlobalKey<FormState>();

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cadastro de Sanduiches"),
          centerTitle: true,
          backgroundColor: Colors.blue[800],
        ),
        body: Container (
          
          padding: EdgeInsets.only(
            top: 30,
            left: 40,
            right: 40,
          ),

          child: Center (

            child: SingleChildScrollView(
              
              child: Column(
        
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[

                        TextFormField(
                          validator: (value){
                            if (value.isEmpty) return "O campo é obrigatório.";
                            //if (value.length < 5) return "O campo precisa ter mais de 4 caracteres.";
                            return null;
                          },
                          controller: _nomeController,
                          autofocus: true,
                          keyboardType: TextInputType.text,
                          style: new TextStyle(
                            color: Colors.black,
                            fontSize: 20
                          ),

                          decoration: InputDecoration(
                            labelText: "* Nome do Sanduíche",
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          ),

                        ),

                        SizedBox(
                          height: 20,
                        ),

                        TextFormField(

                          validator: (value){
                            if (value.isEmpty) return "O campo é obrigatório.";
                            return null;
                          },
                          autofocus: true,
                          keyboardType: TextInputType.text,
                          style: new TextStyle(
                            color: Colors.black,
                            fontSize: 20
                          ),
                          controller: _paoController,
                          decoration: InputDecoration(
                            labelText: "Escolha seu pão dentre as opções abaixo: \n Nenhum, Integral, Três Queijos, Nove Grãos, Alho, Italiano, Sem Glúten.",
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                          ),

                        ),

                        SizedBox(
                          height: 20,
                        ),

                        TextFormField(
                          validator: (value){
                            if (value.isEmpty) return "O campo é obrigatório.";
                            return null;
                          },
                          controller: _queijoController,
                          autofocus: true,
                          keyboardType: TextInputType.text,
                          style: new TextStyle(
                            color: Colors.black,
                            fontSize: 20
                          ),
                          decoration: InputDecoration(
                            labelText: "Escolha seu queijo dentre as opções abaixo: \n Nenhum, Prato, Cheddar, Suíço, Mussarela.",
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          ),

                        ),

                        SizedBox(
                          height: 20,
                        ),

                        TextFormField(
                          validator: (value){
                            if (value.isEmpty) return "O campo é obrigatório.";
                            return null;
                          },
                          controller: _recheioController,
                          autofocus: true,
                          keyboardType: TextInputType.text,
                          style: new TextStyle(
                            color: Colors.black,
                            fontSize: 20
                          ),
                          decoration: InputDecoration(
                            labelText: "Escolha o sabor do seu recheio dentre as opções abaixo: \n Nenhum, Carne, Frango Teriyaki, Frango Defumado com Cream Cheese, Almôndega, Atum, Steak de Churrasco.",
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          ),

                        ),

                        SizedBox(
                          height: 20,
                        ),
                        
                        TextFormField(
                          validator: (value){
                            if (value.isEmpty) return "O campo é obrigatório.";
                            return null;
                          },
                          controller: _saladaController,
                          autofocus: true,
                          keyboardType: TextInputType.text,
                          style: new TextStyle(
                            color: Colors.black,
                            fontSize: 20
                          ),

                          decoration: InputDecoration(
                            labelText: "Escolha seus vegetais dentre as opções abaixo: \n Nenhum, Alface, Pepino, Pimentão, Picles, Tomate, Cebola Roxa, Rúcula, Cenoura, Azeitonas.",
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          ),

                        ),
        
                        SizedBox(
                          height: 20,
                        ),
                        
                        TextFormField(
                          validator: (value){
                            if (value.isEmpty) return "O campo é obrigatório.";
                            return null;
                          },
                          controller: _molhoController,
                          autofocus: true,
                          keyboardType: TextInputType.text,
                          style: new TextStyle(
                            color: Colors.black,
                            fontSize: 20
                          ),

                          decoration: InputDecoration(
                            labelText: "Escolha seus molhos dentre as opções abaixo: \n Nenhum, Cebola Agridoce, Chipotle, Barbecue, Parmesão, Maionese Temperada, Mostarda e Mel, Supreme, Billy & Jack.",
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          ),

                        ),

                        SizedBox(
                          height: 20,
                        ),
                        
                        TextFormField(
                          validator: (value){
                            if (value.isEmpty) return "O campo é obrigatório.";
                            return null;
                          },
                          controller: _acompanhamentoController,
                          autofocus: true,
                          keyboardType: TextInputType.text,
                          style: new TextStyle(
                            color: Colors.black,
                            fontSize: 20
                          ),

                          decoration: InputDecoration(
                            labelText: "Escolha seus acompanhamentos dentre as opções abaixo: \n Nenhum, Maçã, Chips, Brownie, Cookies, La Mousse.",
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          ),

                        ),
        
                        SizedBox(
                          height: 20,
                        ),
                        
                        TextFormField(
                          validator: (value){
                            if (value.isEmpty) return "O campo é obrigatório.";
                            return null;
                          },
                          controller: _bebidaController,
                          autofocus: true,
                          keyboardType: TextInputType.text,
                          style: new TextStyle(
                            color: Colors.black,
                            fontSize: 20
                          ),

                          decoration: InputDecoration(
                            labelText: "Escolha suas bebidas dentre as opções abaixo: \n Nenhum, Água, Suco de Laranja, Suco de Uva, H2OH!, Coca-Cola, Guaraná Antarctica, Kuat, Fanta Laranja, Fanta Uva, Sprite, Coca-Zero.",
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          ),

                        ),

                        SizedBox(
                          height: 20,
                        ),
                        
                        ButtonTheme(

                          height: 60,
                          child: RaisedButton( 

                            child: (
                              widget.sanduiche.id != null) ? Text('Atualizar') : Text('Cadastrar'),
                              textColor: Colors.white,
                            color: Colors.blue[800],
                            onPressed: () {

                              if (_formKey.currentState.validate()) {
                                if(widget.sanduiche.id != null) {
                                  db.collection("sanduiches").document(widget.sanduiche.id).setData(
                                    {
                                      "nome": _nomeController.text,
                                      "pao": _paoController.text,
                                      "queijo": _queijoController.text,
                                      "recheio": _recheioController.text,
                                      "salada": _saladaController.text,
                                      "molho": _molhoController.text,
                                      "acompanhamento": _acompanhamentoController.text,
                                      "bebida": _bebidaController.text,
                                    }
                                  );
                                  Navigator.pop(context);
                                }else {
                                  db.collection("sanduiches").document(widget.sanduiche.id).setData(
                                    {
                                      "nome": _nomeController.text,
                                      "pao": _paoController.text,
                                      "queijo": _queijoController.text,
                                      "recheio": _recheioController.text,
                                      "salada": _saladaController.text,
                                      "molho": _molhoController.text,
                                      "acompanhamento": _acompanhamentoController.text,
                                      "bebida": _bebidaController.text,
                                    }
                                  );
                                  Navigator.pop(context);
                                }
                              }
                              
                            },

                          ),
                        ),

                        SizedBox(
                          height: 50,
                        ),
                      ]
                    )
                  )
                ],
              )
            )
          )
        )
      );
      
    
    
  }
}
