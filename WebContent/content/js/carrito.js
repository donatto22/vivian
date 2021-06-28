
$(document).ready(function() {
	$("td #btnDelete").click(function() {
		var it = $(this).parent().find(".it").val();
		swal.fire({
			title: '&#191;Est&#225;s seguro&#63;',
			text: "La eliminaci&#243;n no se puede revertir",
			icon: 'warning',
			showCancelButton: true,
			confirmButtonText: 'Si, borralo',
			cancelButtonText: 'No quería hacer eso',
			reverseButtons: true
		}).then((result) => {
			if (result.isConfirmed) {
				eliminar(it);
				swal.fire(
					'Eliminado!',
					'Se ha eliminado el producto.',
					'success'
				).then((result)=>{
					parent.location.href="/vivian/car?opcion=Carrito";
				});
			} else if (
				result.dismiss === Swal.DismissReason.cancel
			) {
				swal.fire(
					'Cancelado',
					'El producto no se eliminó :)',
					'error'
				)
			}
		})
	});
	function eliminar(it) {
		var url = "car?opcion=Eliminar";
		$.ajax({
			type: 'POST',
			url: url,
			data: "it=" + it,
			success: function(data, textStatus, jqXHR) {
		
			}

		})
	}
	
	$(".cantidad").click(function(){
		var idp=$(this).parent().find("#idpro").val();
		var cantidad=$(this).parent().find(".cantidad").val();
		var url="car?opcion=ActualizarCantidad"
		$.ajax({
			type: 'POST',
			url: url,
			data: "idp=" + idp+"&Cantidad="+cantidad,
			success: function(data, textStatus, jqXHR) {
				location.href="car?opcion=Carrito";
			}

		});
	});
	
	$("#btnPedido").click(function(e) {
		e.preventDefault();
		swal.fire({
			title: '&#191;Estas seguro&#63;',
			text: "El pedido se registrara en el sistema",
			icon: 'success',
			showCancelButton: true,
			confirmButtonText: 'Si!',
			cancelButtonText: 'No, cancelalo!',
			reverseButtons: true
		}).then((result) => {
			if (result.isConfirmed) {
				swal.fire(
					'Pedido registrado&#33;',
					'Tu pedido se registro en el sistema.',
					'success'
				).then(()=>{
					window.location.href = $(this).attr("href");
				});
			} else if (
				result.dismiss === Swal.DismissReason.cancel
			) {
				swal.fire(
					'Cancelado',
					'El pedido no se registro :)',
					'error'
				)
			}
		})
	});
	
	
});

