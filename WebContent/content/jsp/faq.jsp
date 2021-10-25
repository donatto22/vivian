<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/WEB-INF/libreria.tld" prefix="tools"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- FontAwesome css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <!-- Normalize css -->
    <link rel="stylesheet" href="/vivian/content/lib/normalize.css">
    <!-- css -->
    <style type="text/css">
        @import "/vivian/content/css/general.css";
        @import "/vivian/content/css/faq.css";
    </style>
    <!-- favicon -->
    <link rel="icon" type="image/png" href="/vivian/content/img/corazon.jpg">
    <!-- Jquery -->
   	<script src="/vivian/content/js/jquery.min.js"></script>
	<script src="/vivian/content/js/jquery.bxslider.min.js"></script>
	<!-- Management js -->
	<script src="/vivian/content/js/management.js"></script>
    <!-- Sweet Alert -->
    <link rel="stylesheet" type="text/css" href="/vivian/content/lib/swal.css"/>
    <link rel="stylesheet" href="/vivian/content/lib/animate.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css" />
    <script src="/vivian/content/js/sweetalert2@11.js"></script>
    <script src="/vivian/content/js/sweetalert.min.js"></script>
    <script src="/vivian/content/js/swal.js"></script>
    <title>Vivian | Faq's</title>
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
					<tools:navegacion />

					<c:if test="${u == null}">
						<li>
							<div class="dropdown">
								<button onclick="drop4()" class="dropbtn">Login<i class="fas fa-angle-down"></i></button>
								<div id="drop4" class="dropdown-content">
									<a id="loginRegistro">Cliente</a> 
									<a href="http://localhost:8091/login">Administrador</a>
								</div>
							</div>
						</li>
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
									<a id="cerrarSesion" href="/vivian/userlog?opc=c">Cerrar Sesión</a>
								</div>
							</div>
						</li>
					</c:if>
				</ul>
			</nav>
		</div>
	</div>

	<div id="central">
	    <main>
	        <div id="separador">
	            <img src="/vivian/content/img/separador.png" alt="imagen separador">
	        </div>
	        
	        <hr style="border: 1px dashed gray; width: 90%; margin: 3em auto;">
	
	        <div id="contexto">
				<div class="pregunta">
					<p class="titulo">Hay opciones si padezco de alergias alimentarias?</p>
					
					<p class="respuesta">
						Sí, existen restaurantes en los que se adaptarán a tus necesidades: 
						comida vegetariana, alergias, dietas con restricciones médicas, kosher... No olvides informar en el restaurante.
					</p>
				</div>
				
				<div class="pregunta">
					<p class="titulo">Como me Avisa Vivian.com de las reservas realizadas?</p>
					
					<p class="respuesta">
						<em>Vivian.com</em> envia inmediatamente después de generar la reserva una notificación al su número móvil y/o un e-mail de confirmación.
						Asimismo, siempre podrá observar sus reservas a través de la extranet. En casos de cancelación de la reserva, este se le noriticará.
					</p>
				</div>
				
				<div class="pregunta">
					<p class="titulo">Ofrecen pedidos en linea?</p>
					
					<p class="respuesta">
						Sí, ofrecemos pedidos en línea. Haga clic en el botón "Delivery" para acceder al sistema de pedidos. <br> 
						<em>* Nota: no disponible a todas horas del día.</em>
					</p>
				</div>
				
				<div class="pregunta">
					<p class="titulo">Está abierto durante Covid-19 / n-cov19 ?</p>
					
					<p class="respuesta">
						Somos un nuevo restaurante que planea abrir pronto. 
						Sí, estamos abiertos durante Covid-19 e implementaremos una serie de funciones que incluyen:
						
						<ul>
							<li>Capacidad limitada</li>
							<li>Máscaras necesarias</li>
							<li>Pago sin contacto</li>
							<li>Proveedor de desinfectante</li>
							<li>Aplicación de distanciamiento social</li>
						</ul>
					</p>
				</div>
				
				<div class="pregunta">
					<p class="titulo">Deseo casarme en Vivian, Con quien debo de hablar?</p>
					
					<p class="respuesta">
						Solicita información en el 987 654 321, nuestra Wedding Planner te proporcionará toda la información que necesitas. <br>
						Buscamos aconsejar, no vender a cualquier precio. Tu boda a medida ya es un hecho.
					</p>
				</div>
	        </div>
	    </main>
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
</html>