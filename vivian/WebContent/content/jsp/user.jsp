<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/WEB-INF/libreria.tld" prefix="tools"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <!-- css -->
    <style type="text/css">
        @import "/vivian/content/css/general.css";
        @import "/vivian/content/css/user.css";
    </style>
    <!-- favicon -->
	<link rel="icon" type="image/png" href="/vivian/content/img/corazon.jpg">
    <title>User Profile</title>
	<!-- Management js -->
	<script src="/vivian/content/js/management.js"></script>
	<!-- JQuery -->
	<script src="/vivian/content/js/jquery.min.js"></script>
    <!-- Sweet Alert -->
    <link rel="stylesheet" type="text/css" href="/vivian/content/lib/swal.css"/>
    <link rel="stylesheet" href="/vivian/content/lib/animate.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css" />
    <script src="/vivian/content/js/sweetalert2@11.js"></script>
    <script src="/vivian/content/js/sweetalert.min.js"></script>
    <script src="/vivian/content/js/swal.js"></script>
</head>
<body>

<c:if test="${u == null}">
	<script>
		logear();
	</script>
</c:if>

    <main>
        <div id="main">
            <div id="profile-general">
                <div id="imagen">
                    <img src="/vivian/content/img/man.png" alt="Silueta no encontrada" title="Imagen fake de perfil">
                </div>

                <div id="perfil">
                    <p><c:out value="${u.nombre}"></c:out> <c:out value="${u.apellido}"></c:out> </p>
                </div>
            </div>
    
            <div id="profile-information">
                <div id="comentarios">
                    <h1>Bienvenido a tu Perfil</h1>
                    <hr>

                    <p>Est&#225;s en tu Men&#250; de usuario! Puedes modificar lo que gustes cuando lo necesites.</p>
                </div>

                <form action="/vivian/userlog" method="POST" id="formulario">
                    <div class="group" style="display:none;">
                        <label for="codigo">C&#243;digo</label>
                        <input name="codigo" type="text" title="Este es tu código" value="${u.idusuario}" required>
                    </div>

                    <div class="group">
                        <label for="nombre">Nombre(s)</label>
                        <input name="nombre" type="text" title="Coloque su(s) nombre(s)" 
                        minlength="3" maxlength="45" onkeypress="return soloLetras(event)" value="${u.nombre}" required>
                    </div>
                    
                    <div class="group">
                        <label for="apellido">Apellido(s)</label>
                        <input name="apellido" type="text" title="Coloque su(s) apellido(s)" 
                        minlength="4" maxlength="45" onkeypress="return soloLetras(event)" value="${u.apellido}" required>
                    </div>
    
                    <div class="group">
                        <label for="correo">Correo</label>
                        <input name="correo" type="email" title="Ingresa tu correo" 
                        minlength="11" maxlength="30" value="${u.correo}" required>
                    </div>
                    
                    <div class="group">
                        <label for="clave">Contrase&#241;a</label>
                        <input name="clave" type="password" title="Ingresa tu correo" 
                        minlength="5" maxlength="20" value="${u.clave}" required>
                    </div>
    
                    <div class="group">
                        <label for="telefono">Telefono</label>
                        <input name="telefono" type="text" title="Ingrese su Telefeno" 
                        minlength="9" maxlength="9" onkeypress="return soloNumeros(event)" value="${u.telefono}" required>
                    </div>
    
                    <div class="group">
                        <label for="fechaRegistro">Fecha de Registro</label>
                        <input name="fecha" type="text" title="Este d&#237;a creaste tu cuenta" value="${u.fechareg}" disabled required>
                    </div>
    
                    <div class="group">
                        <label for="dDni">Documento (DNI)</label>
                        <input name="dni" type="text" title="Ingresa tu Documento DNI" 
                        minlength="8" maxlength="8"onkeypress="return soloNumeros(event)" value="${u.dni}" required>
                    </div>

                    <button type="submit" name="opc" value="m" style="font-family: Candara;">Grabar</button> | 
                    <button type="button" class="button-danger" style="font-family: Candara;" onclick="eliminador();">Eliminar Cuenta</button>
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
            </div>
        </div>
    </main>    
</body>
</html>