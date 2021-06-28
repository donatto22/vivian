<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/WEB-INF/libreria.tld" prefix="tools"%>
<%@page import="beans.Productos"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="La mejor receta, solo la tienen Vivian">
    <meta name="author" content="DonattoMinaya RenzoLevano SesarinaVasquez MurguiaGerson AldairCuaresma">
    <meta name="keywords" content="vivian restaurant restaurante recetas comida">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Normalize css -->
    <link rel="stylesheet" href="/vivian/content/lib/normalize.css">
   	<!-- FontAwesome css -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
	<!-- Styles -->
    <style type="text/css">
        @import "/vivian/content/css/general.css";
        @import "/vivian/content/css/menu.css";
    </style>
    <!-- jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- favicon -->
	<link rel="icon" type="image/png" href="/vivian/content/img/corazon.jpg">
	<!-- datatable css -->
	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">
	<!-- datatable js -->
	<script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
	<!-- Management js -->
	<script src="/vivian/content/js/management.js"></script>
	<!-- exporter -->
	<script src="/vivian/content/js/exporter.js"></script>
    <!-- Sweet Alert -->
    <link rel="stylesheet" type="text/css" href="/vivian/content/lib/swal.css"/>
    <link rel="stylesheet" href="/vivian/content/lib/animate.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css" />
    <script src="/vivian/content/js/sweetalert2@11.js"></script>
    <script src="/vivian/content/js/sweetalert.min.js"></script>
    <script src="/vivian/content/js/swal.js"></script>
<title>Vivian's Menu</title>
</head>
<body>
	<div class="container">
		<div id="contenedor2">
			<nav class="nav-main">
				<ul class="nav-menu-left">
					<img src="/vivian/content/img/corazon.png" alt="image not found" draggable="false">
					<li><a href="/vivian/content/html/index.jsp">Vivian's Order</a></li>
				</ul>

				<ul class="nav-menu-right">
					<c:if test="${u != null}">
	                	<li style="display:flex">
	                		<a href="car?opcion=Carrito"><i class="fas fa-shopping-cart" style="color:white;"></i>
	                		<label class="text-warning" style="float:right; margin-left: 1em; margin-top: 1px">
	                		<span style="margin-right: 5px;"> >></span> ${contador}</label>
	                		</a></li>
                	 </c:if>
				
					<tools:navegacion />

					<c:if test="${u == null}">
						<li><a id="loginRegistro">Login</a></li>
					</c:if>

					<c:if test="${u != null}">
						<li>
							<div class="dropdown">
								<button onclick="drop3()" class="dropbtn">Servicios <i class="fas fa-angle-down"></i></button>
								<div id="drop3" class="dropdown-content">
									<a href="/vivian/reServlet?opcion=mm&name=${u.nombre}%20${u.apellido}">Reservar</a> 
									<a href="/vivian/prodcrud?opcion=l">Delivery</a>
								</div>
							</div>
						</li>
					
						<c:if test="${u.idtipo == 2 || u.idtipo == 3 }">
							<li>
								<div class="dropdown">
									<button onclick="drop1()" class="dropbtn">Mantenimientos <i class="fas fa-angle-down"></i></button>
									<div id="drop1" class="dropdown-content">
										<a id="produ" onclick="crud('1');">Productos</a> 
										<a id="crudu" onclick="crud('2');">Usuarios</a>
									</div>
								</div>
							</li>
						</c:if>
						
						<li>
							<div class="dropdown">
								<button onclick="drop2()" class="dropbtn">${u.nombre} ${u.apellido} <i class="fas fa-angle-down"></i></button>
								<div id="drop2" class="dropdown-content">
									<a id="usuario">Cuenta</a>
									<hr style="width: 80%; margin: auto;"> 
									<a id="cerrarSesion" href="/vivian/userlog?opc=c">Cerrar Sesi&#243;n</a>
								</div>
							</div>
						</li>
					</c:if>
				</ul>
			</nav>
		</div>
	</div>

	<div id="central">
			<form action="/vivian/prodcrud" method="post">

			<details class="details">
				<summary>Filtro avanzado</summary>
				<div class="content">
					<div class="filtros">
						<label for="">Moneda</label> 
						<select name="moneda">
							<tools:comboMonedas value=""/>
						</select>
					</div>
	
					<div class="filtros">
						<label for="categorias">Categorias</label> 
						<select name="categoria">
							<tools:comboCategorias value=""/>
						</select>
					</div>
				</div>
			</details>
			<hr>

			<button name="opcion" value="l">Ver lista</button>
		</form>


		<div id="tabla-carta">
			<table class="egt" id="tabla-carta2">
				<caption>Vivian te presenta su carta</caption>
				<thead>
					<tr>
						<th scope="row">Tipo de Moneda</th>
						<th>Platillo</th>
						<th>Categoria</th>
						<th>Precio</th>
						<th>Reparto</th>
						<th>Stock</th>
					
						<c:if test="${u != null}">
							<th>Seleccionar</th>			
						</c:if>
					
					</tr>
				</thead>

				<tbody id="tabla">
					<c:forEach items="${lstProductos}" var="x">
						<tr>
							<th><c:out value="${x.moneda}"></c:out></th>
							<td><c:out value="${x.producto}"></c:out></td>
							<td><c:out value="${x.categoria}"></c:out></td>
							<td><c:out value="${x.precio}"></c:out></td>
							<td><c:out value="${x.reparto}"></c:out></td>
							<td><c:out value="${x.stock}"></c:out></td>
						
							<c:if test="${u != null}">
								<td><a href="car?opcion=AgregarCarrito&id=${x.idProducto}">Agregar <i class="fas fa-plus-circle"></i></a></td>
							</c:if>
							
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<div id="exporters">
				<div class="exporter">
					<div>
						<img src="/vivian/content/img/xlsx.png" alt="">
					</div>
					<button onclick="tablaExcel('tabla-carta2', 'productos')">Convertir a <em>.xls</em></button>
				</div>
				
				<div class="exporter">
					<div>
						<img src="/vivian/content/img/txt.png" alt="">
					</div>
					<button onclick="tablaTXT('productos.txt')">Convertir a <em>.txt</em></button>
				</div>
			</div>
		</div>
	</div>
	
	<footer>
        <div id="footer-min">
            <div id="control">
                <h3>Vivian's Order</h3>
                <hr>

                <p>&copy; Todos los derechos reservados.</p>
                <div id="social-media">
                    <i class="fab fa-google-plus-g"></i>
                    <i class="fab fa-twitter"></i>
                    <i class="fab fa-facebook-square"></i>
                </div>
            </div>

            <div id="terminos">
                <div>
                    <dl>
                        <dt>Plataforma</dt>
                        <dd><a id="creadores">Creadores</a></dd>
                        <dd><a href="#">Agencias</a></dd>
                        <dd><a href="#">Comunidad</a></dd>
                    </dl>
                </div>
                <div>
                    <dl>
                        <dt>Compa&#241;ia</dt>
                        <dd><a href="#">Asesores</a></dd>
                        <dd><a href="#">Encargados</a></dd>
                        <dd><a href="#">Proveedores</a></dd>
                    </dl>
                </div>
                <div>
                    <dl>
                        <dt>Recursos</dt>
                        <dd><a href="#">Ayuda</a></dd>
                        <dd><a href="#">Terminos de uso</a></dd>
                        <dd><a href="#">Privacidad</a></dd>
                        <dd><a href="#">Licencia</a></dd>
                    </dl>
                </div>
            </div>
        </div>
    </footer>
    
    <script>
    $(document).ready( function () {
    	$('#tabla-carta2').DataTable({
	    	language: {
	    		processing: 'Tratamiento en curso...',
	    		search: 'Buscar&nbsp;:',
	    		lengthMenu: 'Agrupar de _MENU_ items',
	    		info: 'Desde el producto _START_ hasta el _END_ en un total de _TOTAL_ items',
	    		infoEmpty: 'No existen productos',
	    		infoFiltered: '(filtrado de _MAX_ elementos en total)',
	    		infoPostFix: '',
	    		loadingRecords: 'Cargando...',
	    		zeroRecords: 'No se encontraron datos de tu busqueda',
	    		emptyTable: 'No hay datos disponibles en la tabla',
	    		paginate: {
	    			first: 'Primero',
	    			previous: 'Anterior',
	    			next: 'Siguiente',
	    			last: '�ltimo'
	    		},
	    		
    			aria: {
    				sortAscending: ': Active para ordenar la columna de forma ascendente',
    				sortDescending: ': Active para ordenar la columna de forma descendiente'
    			}
	    	}
	    });
	});
</script>
</body>
</html>