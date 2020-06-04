import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import  'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}




class _HomeState extends State<Home> {
  @override
Future<Map> _conecao () async {
String url = "https://blockchain.info/ticker";

http.Response response = await http.get(url);
return json.decode(response.body);
}


_post(){

  
}


  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text(
            "Expanded"
            ),
          
        ),
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  RaisedButton(onPressed: 
                  _post(),
                  child: Text(
                    "Salvar"
                  ),
                  ),
                ],
              ),
              Expanded(
                child:FutureBuilder<Map>(
    
      future: _conecao(),
      builder: (context,snapshot){
        String resultado;
        switch(snapshot.connectionState){
              case ConnectionState.none :
         
              break;
              case ConnectionState.waiting :
              print("conexão waiting"); 
                resultado = 'Carregando...';
              break;   
              case ConnectionState.active :

              break;
              case ConnectionState.done :
              print("conexão done");
              if( snapshot.hasError ){
                resultado = "Erro ao carregar os dados.";
              } else {
                double valor = snapshot.data["BRL"] ['buy'];
                resultado = "Preço do bitcoin ${valor.toString()}";
              }
              break;
        }
        return Center(
          child: Text(resultado),
        );
      },
    ), 
              
              )
            ],
          ),
        ),
    );
  
}

}