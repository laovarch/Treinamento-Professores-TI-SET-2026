
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListarBanco extends StatefulWidget {
  const ListarBanco({super.key});

  @override
  State<ListarBanco> createState() => _ListarBancoState();
}

class _ListarBancoState extends State<ListarBanco> {

    Future listarBanco() async{
      var url = "http://localhost:8080/senac/listar.php";
      var resultado = await http.get(Uri.parse(url));
      return jsonDecode(resultado.body);
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listar banco de dados"),
      ),
      body: FutureBuilder(
        future: listarBanco(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Erro na Lista de dados");
          }

          return snapshot.hasData ? ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                List list = snapshot.data;
                return Card(child: Column(
                  children: [
                    Text(list[index]['nome']),
                    Text(list[index]['sobrenome']),
                  ],
                ),
                );
              }
          ) : CircularProgressIndicator();
        },
      ),
    );
  }}
