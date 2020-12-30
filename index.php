
    <head>
        <!--JQUERY-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        
        <!-- FRAMEWORK BOOTSTRAP para el estilo de la pagina-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        
        <!-- Los iconos tipo Solid de Fontawesome-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/solid.css">
        <script src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>

        <!-- Nuestro css-->
        <link rel="stylesheet" type="text/css" href="./css/index.css" th:href="@{/css/index.css}">
        
            <title>S.C.I.G.E.D.C</title>
    </head>

<!DOCTYPE html>
<html>
    <body>
        <div class="container">
            <div class="modal-dialog text-center"><h3>Sistema de control de Información y Gestión para la Empresa de Colores.</h3><hr></div>
        </div>
        <div class="modal-dialog text-center">
           <div class="col-sm-8 main-section">
               <div class="modal-content">
                   <div class="col-12 user-img">
                       <img src="./images/decolores.jpg" th:src="@{/img/user.png}"/>
                   </div>
                   <form action="index.php" method="POST" class="form-floating">
                       <div class="form-group" id="user-group">
                           <input type="text" class="form-control" required="required" placeholder="Ingrese nombre de usuario" name="nom_usuario"/>
                       </div>
                       <div class="form-group" id="contrasena-group">
                           <input type="password" class="form-control" required="required" placeholder="Ingrese clave" name="password"/>
                       </div>
                       <button type="submit" class="btn btn-primary"><i class="fas fa-sign-in-alt"></i>  Ingresar </button>
                   </form>
               </div>
           </div>
        </div>
       <div class="container">
               <div class="container card col-md-5 mb-5 text-center modal-content" id="mensaje">
                   <p>Ingresa para acceder al sistema de control y gestión</p>
               </div>
       </div>
       
    </body>
</html>
    

<?php
        if(!empty($_POST))
        {
          if ($_POST['nom_usuario']=="admin" and $_POST['password']=="admin123")
          {
              echo sha1($_POST['password']);
              header("location: panel.php");
          }
          else{
              ?>
              <script>
                  var element = document.getElementById("mensaje");
                  element.style.color = '#d00' 
                  element.className = "container card col-md-5 mb-5 text-center alert alert-danger"; 
                  element.innerHTML ="<span class='alert-danger'> Usuario y/o contraseña incorrecto, por favor verifique los datos </span>";
              </script>
          <?php
          }
        }
?>