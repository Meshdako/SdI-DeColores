<head>
    <title>Administrador</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>
<div class="row">
    <div class="col-3">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center">
                    <div class="sidebar-brand-text mx-3">Panel de administrador</div>
                </a>

                <!-- Divider -->
                <hr class="sidebar-divider my-0">

                <!-- Divider -->
                <hr class="sidebar-divider">

                <!-- Heading -->
                <div class="sidebar-heading">
                    <h5>Entradas</h5>
                </div>
                <li class="nav-item">
                    <a href="ingprod.php"  class="nav-link"><span>Ingresar Productos</span> </a>
                </li>
                <li class="nav-item">
                    <a href="admin.php?pagina=comunas" class="nav-link"><span>Ingresar Ventas</span> </a>
                </li>
                <li class="nav-item">
                    <a href="admin.php?pagina=ccursos" class="nav-link"><span>Ingresar Datos de Cliente</span> </a>
                </li>
                <li class="nav-item">
                    <a href="admin.php?pagina=buscador" class="nav-link"><span>Ingresar Datos de Proveedor</span> </a>
                </li>
                <li class="nav-item">
                    <a href="admin.php?pagina=buscador" class="nav-link"><span>Ingresar Datos de Cliente</span> </a>
                </li>
                <!-- Divider -->
                <hr class="sidebar-divider">
                <div class="sidebar-heading">
                    <h5>Salidas</h5>
                </div>
                <li class="nav-item">
                <a href="productos.php"  class="nav-link"><span>Información de Productos</span> </a>
                </li>
                <li class="nav-item">
                    <a href="clientes.php"  class="nav-link"><span>Información Clientes </span> </a>
                </li>
                <li class="nav-item">
                    <a href="proveedores.php"  class="nav-link"><span>Información de Proveedores</span> </a>
                </li>
                <li class="nav-item">
                    <a href="ventas.php"  class="nav-link"><span>Información Ventas</span> </a>
                </li>
                <hr class="sidebar-divider">
                <li class="nav-item">
                <a href="index.php"  class="nav-link"><span>Cerrar Sesion</span> </a>
            </ul>

            <br>
        </div>
    </div>
    <div class="container col lg-12 md-12 mb-5">
        <br><br>
        <h2 class="text-center">Ingresar nuevos productos</h2><br>
        <div class="container col-sm-8">
            <div class="container">
                <form class="container form-floating" action="ingprod.php" id="ingreso" method="POST">
                            <input class="container" type="number" name="codprod" placeholder="Ingrese codigo de producto"> <br>
                            <input class="container" type="number" name="codcat" placeholder="Ingrese codigo de categoria"> <br>
                            <input class="container" type="number" name="codsub" placeholder="Ingrese codigo de subcategoria"> <br>
                            <input class="container" type="number" name="codvent" placeholder="Ingrese codigo venta"> <br>
                            <input class="container" type="number" name="codstock" placeholder="Ingrese stock"> <br>
                            <input class="container" type="number" name="codsala" placeholder="Ingrese sala"> <br>
                            <input class="container" type="text" name="codnombre" placeholder="Ingrese nombre"> <br>
                            <input type="hidden" name="opcion" value="<?php echo $opcion?>">
                            <div>
                                <br>
                                <input class="container btn btn-primary" type="submit" name="boton" value="Añadir Curso">
                            </div>
                </form>
                <?php
                        
                        if(isset($_POST['codprod']))
                        {
                            include "conexion.php";
                            $codigo=$_POST['codprod'];
                            $codcategoria=$_POST['codcat'];
                            $codsubcategoria=$_POST['codsub'];
                            $prventa=$_POST['codvent'];
                            $stock=$_POST['codstock'];
                            $sala=$_POST['codsala'];
                            $nombre=$_POST['codnombre'];
                            $sql="INSERT INTO `productos` (`cod_prod`, `cod_cat`, `cod_subcat`, `prec_vent`,
                             `stock_tot`, `sala`, `nom_prod`) VALUES ('$codigo','$codcategoria','$codsubcategoria','$prventa',
                             '$stock','$sala','$nombre')";
                            $con->query($sql);
                            ?>
                            <script>
                            var element = document.getElementById("ingreso");
                            element.style.color = '#d00' 
                            element.className = "container col lg-8 md-8 mb-5 alert alert-success"; 
                            element.innerHTML ="<span class='alert-success'> Producto agregado con exito en la base de datos </span>";
                            window.setTimeout(function() { window.location = "ingprod.php" },1000);
                        </script><?php
                            
                            }