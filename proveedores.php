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
    <div class="col lg-5 md-5 mb-5">
            <br><br>
            <h2 class="text-center">Proveedores</h2><br>
            <table class="container text-center table table-bordered" id="eliminado" >
            <caption>Lista de Proveedores</caption>
                <thead class="container table-primary">
                <tr>
                                        <th>Rut Empresa</th>
                                        <th>Nombre Empresa</th>
                                        <th>Razon Social</th>       
                                    </tr>
                                </thead>
                                <tbody>
                                        <?php
                                        include "conexion.php";
                                        $sql="SELECT * FROM prov";
                                        $result= mysqli_query($con,$sql);
                                        while($mostrar=mysqli_fetch_array($result))
                                        {       
                                        ?>
                                        <tr>
                                        
                                        <td><?php echo $mostrar['rut_empresa']?></td>
                                        <td><?php echo $mostrar['nom_empresa']?></td>
                                        <td><?php echo $mostrar['raz_soc']?></td>
                                    </tr> <?php
                                            };?>
    </div>
</div>
</body>
 </html>