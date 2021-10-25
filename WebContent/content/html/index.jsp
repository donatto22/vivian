<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/WEB-INF/libreria.tld" prefix="tools"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="description" content="La mejor receta, solo la tienen Vivian">
	<meta name="author" content="DonattoMinaya RenzoLevano SesarinaVasquez MurguiaGerson AldairCuaresma">
	<meta name="keywords" content="vivian restaurant restaurante recetas comida">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- FontAwesome css -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
	<!-- Normalize css -->
	<link rel="stylesheet" href="/vivian/content/lib/normalize.css">
	<!-- css -->
	<style type="text/css">
		@import "/vivian/content/css/general.css";
		@import "/vivian/content/css/index.css";
	</style>
	<!-- AOS css -->
	<link rel="stylesheet" href="/vivian/content/lib/aos.css" type="text/css">
	<!-- favicon -->
	<link rel="icon" type="image/png" href="/vivian/content/img/corazon.jpg">
	<!-- jquery -->
	<link rel="stylesheet" href="/vivian/content/lib/jquery.bxslider.css">
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
<title>Vivian &#124; The best place to enjoy</title>
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
		<header>
			<div id="header_img">
				<div id="color">
					<img src="/vivian/content/img/fondo.jpg" alt="image not found" draggable="false"> 
					<img src="/vivian/content/img/fondo1.jpg" alt="image not found" draggable="false">
					<img src="/vivian/content/img/fondo2.jpg" alt="image not found" draggable="false">
				</div>
			</div>

			<script>
				$('#color').bxSlider({
					auto : true,
					autoControls : false,
					stopAutoOnClick : false,
					pager : false,
					oneToOneTouch : false,
					touchEnabled : false,
					slideWidth : 1200,
					speed : 500
				});
			</script>
		</header>
		${mensaje}
		<main>
			<section>
				<article>
					<div class="center-promotion" data-aos="zoom-in">
						<div class="icono-center">
							<img src="/vivian/content/svg/017-income.svg" alt="image-svg"
								draggable="false">
						</div>

						<div class="texto-center">
							<p>Precio econ&#243;mico y accesible</p>
						</div>
					</div>

					<div class="center-promotion" data-aos="zoom-in">
						<div class="icono-center">
							<img src="/vivian/content/svg/006-atm machine.svg"
								alt="image-svg" draggable="false">
						</div>

						<div class="texto-center">
							<p>Afiliado a mas de 10 bancos nacionales.</p>
						</div>
					</div>

					<div class="center-promotion" data-aos="zoom-in">
						<div class="icono-center">
							<img src="/vivian/content/svg/011-coin.svg" alt="image-svg"
								draggable="false">
						</div>

						<div class="texto-center">
							<p>Descuentos en nuestros men&#250;es</p>
						</div>
					</div>
				</article>

				<article id="noti-post">
					<div id="noti-texto">
						<p>Siendo parte de nuestra comunidad podr&#225;s tener acceso a
							futuras recetas, localidades y m&#225;s!</p>
						<br>
						<p>Incluyen notificaciones instantaneos si un platillo deseado
							a sido rebajado.</p>
					</div>
					<div>
						<img src="/vivian/content/img/Just_saying.svg"
							alt="img-notificaciones" draggable="false">
					</div>
				</article>
			</section>

			<section id="sectionInfo">
				<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320">
                    <path fill="#011c39" fill-opacity="1"
						d="M0,0L24,37.3C48,75,96,149,144,176C192,203,240,181,288,165.3C336,149,384,139,432,160C480,181,528,235,576,234.7C624,235,672,181,720,160C768,139,816,149,864,154.7C912,160,960,160,1008,176C1056,192,1104,224,1152,218.7C1200,213,1248,171,1296,144C1344,117,1392,107,1416,101.3L1440,96L1440,0L1416,0C1392,0,1344,0,1296,0C1248,0,1200,0,1152,0C1104,0,1056,0,1008,0C960,0,912,0,864,0C816,0,768,0,720,0C672,0,624,0,576,0C528,0,480,0,432,0C384,0,336,0,288,0C240,0,192,0,144,0C96,0,48,0,24,0L0,0Z">
                    </path>
                </svg>
				<div id="container2">
					<div id="contactInfo">
						<div>
							<h2>Informaci&#243;n de Contacto</h2>
							<hr>

							<ul>
								<li data-aos="fade-right"><i class="fas fa-globe-americas"></i>Con más de 13 localidades en el rededor del mundo!</li>
								<li data-aos="fade-right"><i class="fas fa-envelope"></i>Cont&#225;ctanos v&#237;a email: vivian@gmail.com</li>
								<li data-aos="fade-right"><i class="fas fa-phone-alt"></i>Cont&#225;ctanos v&#237;a tel&#233;fono: <br> (+51) 987-654-321</li>
							</ul>
						</div>
					</div>

					<div id="contactQuest">
						<div>
							<p>Nobis tempora ratione sunt eos laboriosam, assumenda rerum
								dolorum, consectetur quasi, placeat ducimus ullam minus nostrum
								officia. Excepturi maxime magnam itaque, placeat minima nesciunt
								et dolorem voluptas ab accusantium repudiandae eveniet cum
								doloremque natus soluta alias porro voluptatum quis nemo
								perspiciatis praesentium, eaque nam! Esse nam commodi, adipisci
								earum harum expedita magni dignissimos sapiente aperiam.
								Nesciunt quisquam quia doloribus quam libero in veniam corrupti
								quas accusantium voluptates consequuntur possimus, quasi
								recusandae repudiandae eos labore totam expedita odit officiis
								obcaecati temporibus ratione vero laboriosam? Commodi culpa
								rerum laudantium! Atque architecto quas numquam harum
								necessitatibus aperiam nostrum provident ipsam, quasi corrupti
								quis. Aspernatur mollitia ipsum itaque recusandae quos quis
								voluptate at porro incidunt doloremque quisquam, praesentium,
								laboriosam illo quibusdam consequuntur dolorem maxime
								repudiandae nihil? Beatae consectetur non ea modi enim voluptas
								quasi. Inventore qui voluptatum vero consectetur dolores fugiat
								fugit ipsum, error quasi cum, ipsa dolorum laborum sequi
								laboriosam, doloribus beatae cupiditate. Maxime debitis
								asperiores quia molestias quidem delectus laborum nam aliquam
								ratione, deserunt optio alias odio sunt blanditiis totam qui
								dignissimos dicta similique, dolorem iusto, nesciunt doloribus
								corrupti ducimus sed! A repellendus necessitatibus rerum
								consectetur impedit, maiores aperiam ab consequuntur accusantium
								libero quasi explicabo obcaecati veritatis atque ducimus neque
								tempora dolores?</p>
						</div>
					</div>
				</div>
			</section>
		</main>
	</div>

	<footer>
		<div id="footer-min">
			<div id="control">
				<h3>Vivian's Order</h3>
				<hr>

				<p>&copy; Todos los derechos reservados.</p>
				<div id="social-media">
					<i class="fab fa-google-plus-g"></i> <i class="fab fa-twitter"></i>
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

	<!-- Jquery CDN -->
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<!-- AOS js -->
	<script src="/vivian/content/js/aos.js"></script>

	<script>
		AOS.init({
			duration : 600,
			offset : 120,
			easing : 'ease in out'
		});
	</script>
</body>

</html>