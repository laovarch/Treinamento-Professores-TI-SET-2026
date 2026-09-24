import 'package:flutter/material.dart';
import 'package:senacteste/NovaPagina.dart';

class SenacAula extends StatefulWidget {
  const SenacAula({super.key});

  @override
  State<SenacAula> createState() => _SenacAulaState();
} //dart para cima
//flutter para baxo

class _SenacAulaState extends State<SenacAula> {
  TextEditingController nome = TextEditingController();
  String textoTela = "http://localhost:8080/senac/listar.php";

  void nomeTeste()
  {
    setState(() {
      textoTela = nome.text;
    });

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Senac Aula"),
      ),body: SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: TextField(
                    controller: nome,
                    decoration: InputDecoration(
                      labelText: "Nome: "
                    ),
                  )
              ),
              SizedBox(width: 20,),
              Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: "Nome: "
                    ),
                  )
              ),
            ],
          ),

          Row(
            children: [
              Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: "Nome: "
                    ),
                  )
              ),
              Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: "Nome: "
                    ),
                  )
              ),
            ],
          ),
          Row(
            children: [
              MaterialButton(
                color: Colors.blue,
                  textColor: Colors.black,
                  child: Text("Mostrar"),
                  onPressed: nomeTeste,
              ),

              Text(textoTela),
              MaterialButton(
                color: Colors.blue,
                textColor: Colors.black,
                child: Text("Ir"),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => NovaPagina(), ));
                },
              )
            ],
          )

        ],
      ),
    ),
    );
  }
}
