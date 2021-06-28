<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<!-- css -->
    <style type="text/css">
        @import "/vivian/content/css/login.css";
    </style>
	<title>Vivian &#124; Login</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Sweet Alert -->
    <link rel="stylesheet" type="text/css" href="/vivian/content/lib/swal.css"/>
    <link rel="stylesheet" href="/vivian/content/lib/animate.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css" />
    <script src="/vivian/content/js/sweetalert2@11.js"></script>
    <script src="/vivian/content/js/sweetalert.min.js"></script>
    <script src="/vivian/content/js/swal.js"></script>
</head>
<body>
	<script>
		$(document).ready(function() {
			
			$(window).scroll(function() {
				var barra = $(window).scrollTop();
				var posicion = barra * 0.30;
				
				$('body').css({
					'background-position' : '0 -' + posicion + 'px'
				});
			});
			
		});
	</script>
	${mensaje}
	<main>
		<form action="/vivian/userlog" method="post">
			<div class="group">
				<label>Login</label>
				<hr>
			</div>
		
			<div class="group">
				<label>Correo :</label>
				<input type="email" minlength="6" maxlength="30" name="txtCorreo" required/>
			</div>
			
			<div class="group">
				<label>Clave :</label>
				<input type="password" minlength="4" maxlength="30" name="txtClave" required />
			</div>
			
			<div class="group">
				<button type="submit" name="opc" value="l">Ingresar</button>
			</div>
			
			<div class="group">
				<a>¿Olvidaste tu contraseña?</a>		
			</div>
			
			<c:out value="${mensaje}"></c:out>
		</form>
		
		<form action="/vivian/userlog" method="post" style="box-shadow: 0 0 30px 10px rgba(0, 0, 0, 1); margin: 1em auto;">
			<div class="group">
				<label>Registro</label>
				<hr>
			</div>
		
			<div class="group">
				<label>Nombre :</label>
				<input type="text" minlength="3" maxlength="20" name="nombre" required onkeypress="return soloLetras(event)"/>
			</div>
			
			<div class="group">
				<label>Apellido :</label>
				<input type="text" minlength="4" maxlength="30" name="apellido" required onkeypress="return soloLetras(event)"/>
			</div>
			
			<div class="group">
				<label>Correo :</label>
				<input type="email" minlength="6" maxlength="30" name="correo" required/>
			</div>
			
			<div class="group">
				<label>Clave :</label>
				<input type="password" minlength="4" maxlength="30" name="clave" required />
			</div>
                    
            <div class="group" style="display:none">
                 <label for="tipo">Tipo</label>
                 <input name="tipo" type="number" maxlength="1" value="1" required>
            </div>
			
			<div class="group">
				<label>Telefono :</label>
				<input type="text" minlength="9" maxlength="9" name="telefono" required onkeypress="return soloNumeros(event)"/>
			</div>
			
			<div class="group">
				<label>DNI :</label>
				<input type="text" minlength="8" maxlength="8" name="dni" required onkeypress="return soloNumeros(event)"/>
			</div>
			
			<div class="group">
				<button type="submit" name="opc" value="r">Registrar</button>
			</div>
			
			<c:out value="${mensaje}"></c:out>
		</form>
		
        <script>
                    function soloLetras(e) {
                        tecla = (document.all) ? e.keyCode : e.which;
                
                        if (tecla == 8) {
                            return true;
                        }
                
                        patron = /[A-Za-z\s\u00f1\u00d1]/;
                        tecla_final = String.fromCharCode(tecla);
                        return patron.test(tecla_final);
                    }
                    
                    function soloNumeros(e) {
                        tecla = (document.all) ? e.keyCode : e.which;
                
                        if (tecla == 8) {
                            return true;
                        }
                
                        patron = /[0-9]/;
                        tecla_final = String.fromCharCode(tecla);
                        return patron.test(tecla_final);
                    }
		</script>
	</main>
</body>
</body>
</html>