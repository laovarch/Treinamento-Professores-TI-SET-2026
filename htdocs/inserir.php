<?php
    
    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
    header("Access-Control-Allow-Headers: Content-Type");

    try{
        $conexao = new PDO('mysql:host=localhost;dbname=flutterapp', 'root', '');
        $conexao->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
      //  echo "ok";

      
    }catch(PDOException $e){
        echo $e;
    }
    
    try{
        $nome = $_POST['nome'];
        $sobrenome = $_POST['sobrenome'];

        $resultado = $conexao->prepare("INSERT INTO clientes (nome, sobrenome) VALUES (:nome,:sobrenome)");
        $resultado->bindParam(":nome", $nome);
        $resultado->bindParam(":sobrenome", $nome);
        $resultado->execute();
        

      
    }catch(PDOException $e){
        echo $e;
    }