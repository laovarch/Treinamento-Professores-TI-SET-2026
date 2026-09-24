import 'package:flutter/material.dart';

class NovaPagina extends StatefulWidget {
  const NovaPagina({super.key});

  @override
  State<NovaPagina> createState() => _NovaPaginaState();
}

class _NovaPaginaState extends State<NovaPagina>
{
  @override
  Widget build (BuildContext context)
  {
    return Scaffold(
      body: Text("Nova Pagina"),
    );
  }
}



