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
        $resultado = $conexao->prepare("SELECT * FROM clientes");
        $resultado->execute();

        $contar = $resultado->rowCount();
        if($contar > 0){
            while($mostrar = $resultado->fetchAll(PDO::FETCH_ASSOC))
            {
                echo json_encode($mostrar);
            }

        }

      
    }catch(PDOException $e){
        echo $e;
    }