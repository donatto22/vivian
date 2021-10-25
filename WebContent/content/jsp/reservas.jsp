<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/WEB-INF/libreria.tld" prefix="tools"%>
<%@page import="beans.Mesas"%>
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
    <!-- css -->
    <style type="text/css">
        @import "/vivian/content/css/general.css";
        @import "/vivian/content/css/reservas.css";
    </style>
    <!-- favicon -->
	<link rel="icon" type="image/png" href="/vivian/content/img/corazon.jpg">
	<!-- JQuery -->
	<script src="/vivian/content/js/jquery.min.js"></script>
	<!-- Management js -->
	<script src="/vivian/content/js/management.js"></script>
    <!-- Sweet Alert -->
    <link rel="stylesheet" type="text/css" href="/vivian/content/lib/swal.css"/>
    <link rel="stylesheet" href="/vivian/content/lib/animate.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css" />
    <script src="/vivian/content/js/sweetalert2@11.js"></script>
    <script src="/vivian/content/js/sweetalert.min.js"></script>
    <script src="/vivian/content/js/swal.js"></script>
    <title>Vivian &#124; Reservation</title>
</head>
<body>

<c:if test="${u == null}">
	<script>
		logear();
	</script>
</c:if>

	<div class="container">
		<div id="contenedor2">
			<nav class="nav-main">
				<ul class="nav-menu-left">
					<img src="/vivian/content/img/corazon.png" alt="image not found" draggable="false">
					<li><a href="/vivian/content/html/index.jsp">Vivian's Order</a></li>
				</ul>

				<ul class="nav-menu-right">
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
		    <div id="header">
		        <div id="img">
		            <img src="/vivian/content/img/special_event.svg" alt="image not found" draggable="false">
		        </div>
		
		        <div id="text">
		            <p>Deseas reservar para una fecha especial? Ahora es el momento.</p>
		        </div>
		    </div>

	        <div id="content">
				<div>
					<form method="post" action="/vivian/reServlet" id="formulario">
						<div class="group" style="display: none;">
							<label>C&#243;digo</label>
							<input type="number" id="codigo" name="codigo" value="${u.idusuario}">
						</div>
					
						<div class="group">
							<label>Nombre:</label>
							<input type="text" id="nombreUsuario" name="usuario" value="${u.nombre} ${u.apellido}" disabled readonly>
						</div>
						
						<div class="group">
							<label>N&#250;mero de Mesa:</label>
							
							<select id="mesa" name="mesa">
								<tools:mesas/>
							</select>
						</div>
					
						<div class="group">
							<label>Fecha:</label>
							<input type="date" id="fecha" name="fecha" min="">
						</div>
						
						<div class="group">
							<label>Turno:</label>
							
							<select id="turno" name="turno">
								<tools:turnos/>
							</select>
						</div> <hr style="width: 90%; margin: 2em auto; border: 1px dashed gray;">
						
						<c:if test="${lstMesas != null}">
							<div class="group">
								<label>Id de Reservaci&#243;n</label>
								
								<select name="reservacion" title="Si deseas modificar una reserva, llena este campo">
									<tools:reservas value="${u.idusuario}"/>
								</select>
							</div>
						</c:if>
					</form>	
					
					<div id="fakeNav">
            			<button id="solicitar" name="opcion" value="r">Solicitar</button>
            			<button type="submit" name="opcion" value="a">Modificar</button>
            			<button type="reset">Limpiar</button>
        			</div>
					
				</div>
				
				<div id="relleno">
					<div id="cabecera"> <br>
						<fieldset>
							<c:if test="${lstMesas != null}">
								<h1>Tienes reservaciones!</h1>
							</c:if>
							
							<c:if test="${lstMesas == null}">
								<h1>No tienes reservaciones!</h1>
							</c:if>
						</fieldset>
					</div>
					
					<div id="contexto-relleno">
						<c:forEach items="${lstMesas}" var="x">
							<div class="relleno">
								<p>Cliente: ${u.nombre} ${u.apellido} </p>
								<p>N&#250;mero de Mesa: <c:out value="${x.numeroMesa}"></c:out> </p>
								<p>Piso: <c:out value="${x.piso}"></c:out> </p>
								<p>Turno: <c:out value="${x.descripcionTurno}"></c:out> </p>
								<p>Fecha: <c:out value="${x.fecha}"></c:out> </p>
								<hr>
								<p>Id Reservaci&#243;n: <c:out value="${x.idReserva}"></c:out> >> <a type="button" id="${x.idReserva}" class="anularReserva">Anular Reserva</a></p>
								<hr>
					        </div>
						</c:forEach>						
						
						<c:if test="${lstMesas == null}">
							<p>Puedes crear una nueva reservaci&#243;n ahora, solo llena el formulario de a lado.</p>
						</c:if>
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
</body>
<script>
	$(document).ready(function(){
		let mesa = $("#mesa");
		let codigo = $("#codigo")
		let fecha = $("#fecha");
		let nombreUsuario = $("#nombreUsuario");
		let turno = $("#turno");
					
		
		$(".anularReserva").click(function(e){						
			if(!confirm('\u00BFDesea Anular su Reservaci\u00F3n?'))return false;			
			$.ajax({
				type: 'POST',
				url: '/vivian/reServlet?opcion=e',
				data: {
					"cod": $(this).attr('id')
				},
				success: function (data){
					parent.location.href="/vivian/reServlet?opcion=mm&name="+$("#nombreUsuario").val()
					
				}
			});									
		});
		
		$("#solicitar").click(function(e){
			if (mesa.val() == null || fecha.val() == undefined || fecha.val() == '' || turno.val() == null){
				Swal.fire({
					icon: 'error',
                    title: 'Oops...',
                    text: 'Verifique datos',
				})
				return false;
			} else {
				$.ajax({
					type: 'POST',
					url: '/vivian/reServlet?opcion=r',
					data: {
						"mesa":$("#mesa").val(),
						"codigo":$("#codigo").val(),
						"fecha":$("#fecha").val(),
						"turno":$("#turno").val(),					
						"name":$("#nombreUsuario").val(),					
					},
					success: function (data){
						parent.location.href="/vivian/reServlet?opcion=mm&name="+$("#nombreUsuario").val()
						
					}
				});
			}						
		});
		
		
		
		
	});
</script>
</html>