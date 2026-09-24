import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:senacteste/ListarBanco.dart';

class CadastroCliente extends StatefulWidget {
  const CadastroCliente({super.key});

  @override
  State<CadastroCliente> createState() => _CadastroClienteState();
}

class _CadastroClienteState extends State<CadastroCliente> {

  TextEditingController nome = TextEditingController();
  TextEditingController sobrenome = TextEditingController();

  Future inserirDados() async {

    var url =  "http://localhost:8080/senac/inserir.php";
    var resultado = await http.post(Uri.parse(url),

        body:{
          "nome" : nome.text,
          "sobrenome" : nome.text,
        }
    );
    print(resultado.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de Cliente"),
      ),
      body: SingleChildScrollView(
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
                      controller: sobrenome,
                      decoration: InputDecoration(
                          labelText: "Sobrenome: "
                      ),
                    )
                ),
                SizedBox(width: 20, height: 20,),
                MaterialButton(
                    onPressed: (){inserirDados();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ListarBanco()));
                      },

                child: Text("Cadastro Cliente"),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}