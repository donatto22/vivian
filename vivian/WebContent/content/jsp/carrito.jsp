<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
	<!-- Font Awesome  -->  
 	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <!-- Normalize css -->
    <link rel="stylesheet" href="/vivian/content/lib/normalize.css">
	<!-- Styles -->
    <style type="text/css">
    	@import "/vivian/content/css/general.css";
    </style>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
	<!-- Sweet alert / Bootstrap / JQuery -->
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="/vivian/content/js/carrito.js"></script>
</head>
<body>

<c:if test="${u == null}">
	<script>
		logear();
	</script>
</c:if>

	<div class="container-fluid mt-4">
		<h3 class="display-4">Pedido</h3>
		<br />
		<div class="row">
			<div class="col-md-8">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>ITEM</th>
							<th>NOMBRE</th>
							<th>DESCRIPCION</th>
							<th>PRECIO</th>
							<th>CANTIDAD</th>
							<th>SUBTOTAL</th>
							<th>ACCION</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach var="car" items="${carrito}">
						<tr>
							<td>${car.getItem()}</td>
							<td>${car.getProducto()}</td>
							<td>${car.getCategoria()}</td>
							<td>${car.getPrecio()}</td>
							<td><input type="hidden" id="idpro" value="${car.getIdProducto()}" />
							<input type="number" id="Cantidad" value="${car.getCantidad()}" class="form-control text-center cantidad" min="1" /></td>
							<td>${car.getSubTotal()}</td>
							<td>
								<input type="hidden" class="it" value="${car.getItem()}" />
								<a href="#" id="btnDelete">Eliminar</a>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="col-md-3  d-flex flex-column justify-content-start">
				<div class="card pt-0 ">
					<div class="card-header">
						<h3>Generar Compra</h3>
					</div>
					<div class="card-body">
						<label>Subtotal:</label> 
						<input type="text" value="S/. ${totalPagar}" readonly="readonly" class="form-control" />
						<label>Descuento:</label>  
						<input type="text" value="S/. 0.00" readonly="readonly" class="form-control" />
						<label>Total a pagar:</label>  
						<input type="text" value="S/. ${totalPagar}" readonly="readonly" class="form-control" />
					</div>
					<div class="card-footer">
						<div class="d-flex justify-content-around">
						<a href="/vivian/car?opcion=GenerarPedido" class="me-2 btn btn-outline-dark flex-grow-1" id="btnPedido">Realizar Pago</a>
						<a href="/vivian/reser?reporte=boleta" class="me-2 btn btn-outline-dark flex-grow-1 ">Generar Compra</a>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>
</html>