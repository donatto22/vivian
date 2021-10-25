function logear() {
	Swal.fire({
		icon: 'error',
		title: 'Oops!...',
		html: '<p class="type-text-swal">No puedes acceder sin estar logeado.</p>',
		showCancelButton: true,
		confirmButtonText: 'Acceder',
		allowOutsideClick: false,
		allowEscapeKey: false,
	}).then((result) => {	
		if (result.isConfirmed) {
			window.location.href = "/vivian/content/jsp/login.jsp";
		} 
		  
		else if (result.isDismissed) {
			window.location.href = "/vivian/content/html/index.jsp";
		}
	})
}

function bueno(icono, titulo) {
	const Toast = Swal.mixin({
		toast: true,
		position: 'bottom-start',
		showConfirmButton: false,
		timer: 4000,
		timerProgressBar: true,
		didOpen: (toast) => {
			toast.addEventListener('mouseenter', Swal.stopTimer)
		  	toast.addEventListener('mouseleave', Swal.resumeTimer)
		}
	})
	  
	  Toast.fire({
		icon: icono,
		title: titulo
	})
}

function logeoBueno() {
	bueno('success', 'Ingreso Existoso');
}

function logeoMalo() {
	bueno('error', 'Datos incorrectos o cuenta inexistente');
}

function eliminadoBueno() {
	bueno('success', 'Eliminado correcto');
}

function eliminadoMalo() {
	bueno('error', 'Fallo al Eliminar');
}

function modificadoBueno() {
	bueno('success', 'Modificado correcto');
}

function modificadoMalo() {
	bueno('error', 'Modificado incorrecto o error de servidor');
}

function eliminador() {
	Swal.fire({
		icon: 'question',
		title: 'Eliminar cuenta',
		text: 'Se le enviará un correo de confirmación a su correo vinculado para poder completar en requerimiento.',
		footer: 'Podr&#225; anular la solicitud en el mismo correo'
	})
}

function crud(valor) {
	Swal.fire({
		icon: 'question',
		title: 'Que deseas hacer?',
		html: '<p class="type-text-swal">Puedes salir de la alerta en cualquier momento</p>',
		  showDenyButton: true,
		  showCancelButton: true,
		  confirmButtonText: 'Agregar',
		  denyButtonText: 'Eliminar',
		  cancelButtonText: 'Cancelar'
	}).then((result) => {
		  if (result.isConfirmed) { //Agregar
			if(valor == 1) { // Producto
				Swal.fire({
					showConfirmButton: false,
					title: 'Agregar Producto',
					html: 
					'<form method="post" action="/vivian/prodcrud" id="form-swal-prodcrud">'
					+ '<input name="producto" type="text" placeholder="Nombre del platillo o producto" required>'
					+ '<input name="precio" type="text" placeholder="Precio" required>'
					+ '<select name="moneda">'
						+ '<option value="-1" disabled hidden selected>Selecciona Moneda</option>'
						+ '<option value="Euro">Euro</option>'
						+ '<option value="Dolar">Dolar</option>'
						+ '<option value="Soles">Soles</option>'
						+ '<option value="Yen">Yen</option>'
					+ '</select>'
					+ '<select name="categoria">'

						// !!! ADVERTENCIA !!!
						//no usar tag jstl o generará error
						//puedes colocar el tag jstl siempre y cuando se coloque el script en la misma página jsp

						/*otro dato, es que generará error por las comillas, pero colocarselas en el wrapper,
						generará error en el menú.jsp y en otro donde implique los select, sin contar que necesitarían el operador de concatenación
						y eso no se puede colocar desde el wrapper*/

						+ '<option value="-1" disabled hidden selected>Selecciona categoria</option>'
						+ '<option value="1">Especial</option>'
						+ '<option value="2">Bebida</option>'
						+ '<option value="3">Postre</option>'
						+ '<option value="4">Ensalada</option>'
						+ '<option value="5">Bocadillo</option>'
						+ '<option value="6">Sandwich</option>'
						+ '<option value="7">Normal</option>'
					+ '</select>'
					+ '<input name="stock" type="number" placeholder="Stock" required>'
					+ '<input name="reparto" type="number" placeholder="Reparto" required>'
					+ '<button class="swal2-confirm swal2-styled" type="submit" name="opcion" value="r">Agregar</button>'
					+ '<button class="swal2-cancel swal2-styled" type="reset">Resetear</button>'
					+ '</form>',
					footer: 'Puedes salir del mantenimiento en cualquier momento.',
					showClass: {
						popup: 'animate__animated animate__fadeInDown'
					},
					hideClass: {
						popup: 'animate__animated animate__fadeOutUp'
					}
				})
			}
			
			if(valor == 2) { //Usuario
				Swal.fire({
					showConfirmButton: false,
					title: 'Agregar Usuario',
					html: 
					'<form method="post" action="/vivian/userlog" id="form-swal-prodcrud">'
					+ '<input name="nombre" type="text" placeholder="Nombre del usuario" required>'
					+ '<input name="apellido" type="text" placeholder="Apellido del usuario" required>'

						// !!! ADVERTENCIA !!!
						//no usar tag jstl o generará error
						//puedes colocar el tag jstl siempre y cuando se coloque el script en la misma página jsp

						/*otro dato, es que generará error por las comillas, pero colocarselas en el wrapper,
						generará error en el menú.jsp y en otro donde implique los select, sin contar que necesitarían el operador de concatenación
						y eso no se puede colocar desde el wrapper*/

					+ '<select name="tipo" required>'
						+ '<option value="-1" disabled hidden selected>Selecciona el tipo de usuario</option>'
						+ '<option value="1">Normal</option>'
						+ '<option value="2">Mantenimiento</option>'
						+ '<option value="3">Administrador</option>'
					+ '</select>'
					+ '<input name="dni" type="text" minlenght="8" maxlenght="8" placeholder="Documento (DNI)" required>'
					+ '<input name="telefono" type="text" maxlenght="9" placeholder="Telefono" required>'
					+ '<input name="correo" type="email" minleght="5" maxlenght="40" placeholder="Correo" required>'
					+ '<input name="clave" type="clave" minleght="5" placeholder="Clave" required>'
					+ '<button class="swal2-confirm swal2-styled" type="submit" name="opc" value="r">Agregar</button>'
					+ '<button class="swal2-cancel swal2-styled" type="reset">Resetear</button>'
					+ '</form>',
					footer: 'Puedes salir del mantenimiento en cualquier momento.',
					showClass: {
						popup: 'animate__animated animate__fadeInDown'
					},
					hideClass: {
						popup: 'animate__animated animate__fadeOutUp'
					}
				})
			}
		  } 
  
		  else if (result.isDenied) { //Eliminar
			if(valor == 1) {
				Swal.fire({
					icon: 'warning',
					showConfirmButton: false,
					title: 'Eliminar Producto',
					html: 
					'<p class="type-text-swal warning">Esta acci&#243;n no se puede revertir</p>'
					+ '<form method="post" action="/vivian/prodcrud" id="form-swal-prodcrud">'
					+ '<input type="number" name="codigo" placeholder="C&#243;digo del platillo o producto" required>'
					+ '<button class="swal2-deny swal2-styled" type="submit" name="opcion" value="e">Eliminar</button>'
					+ '<button class="swal2-cancel swal2-styled" type="reset">Resetear</button>'
					+ '</form>',
					footer: 'Puedes salir del mantenimiento en cualquier momento.'
				})
			}
			
			if(valor == 2) {
				Swal.fire({
					icon: 'warning',
					showConfirmButton: false,
					title: 'Eliminar Usuario',
					html: 
					'<p class="type-text-swal warning">Esta acci&#243;n no se puede revertir</p>'
					+ '<form method="post" action="/vivian/userlog" id="form-swal-prodcrud">'
					+ '<input type="number" name="codigo" placeholder="C&#243;digo del usuario a eliminar" required>'
					+ '<button class="swal2-deny swal2-styled" type="submit" name="opc" value="e">Eliminar</button>'
					+ '<button class="swal2-cancel swal2-styled" type="reset">Resetear</button>'
					+ '</form>',
					footer: 'Puedes salir del mantenimiento en cualquier momento.'
				})
			}
		}
	})	
}