-- -----------------------------------------------------
-- ⚠ No ejecutar sin tener la base de datos!! ⚠
-- -----------------------------------------------------
use Vivian;

-- -----------------------------------------------------
## Procedimientos de Reservaciones
-- -----------------------------------------------------
Delimiter ||
drop procedure if exists Vivian.listarReservas ||
create procedure listarReservas(codigo int)
	begin
		select * from Reserva  where idUsuario = codigo;
    end ||

Delimiter ||
drop procedure if exists Vivian.mostrarReservas ||
create procedure mostrarReservas(thisUsuario int)
	begin
		select * from Reserva where idUsuario = thisUsuario;
	end ||


Delimiter ||
drop procedure if exists Vivian.verificarMesas ||
create procedure verificarMesas(thisNombreCompleto varchar(50))
	begin
		declare codigoUsuario int;
        set codigoUsuario = (select idUsuario from Usuario where concat(nombresUsuario, ' ', apellidosUsuario) = thisNombreCompleto);
        
        call mostrarReservas(codigoUsuario);
	end ||
    
Delimiter ||
drop procedure if exists Vivian.AgregarReservacion ||
create procedure AgregarReservacion(thisCliente int, thisNumeroMesa int, thisFecha varchar(20), thisTurno varchar(20))
	begin
		declare randomize varchar(4);
        declare piso2 int;
        
        set randomize = (select concat('A', (select floor(rand() * 1000))) Generado);
        set piso2 = (select piso from Mesa where nMesa = thisNumeroMesa group by piso);
    
		insert into Reserva(idReserva, idUsuario, nMesa, piso, fechaReservacion, idTurno) 
        values (randomize, thisCliente, thisNumeroMesa, piso2, thisFecha, thisTurno);
    end ||


-- Procedimientos del formulario / Verificar por casillero
# solo mesa
Delimiter ||
drop procedure if exists Vivian.modReserva_M ||
create procedure modReserva_M(thisReserva char(4), thisNumeroMesa int)
	begin
		declare piso2 int;
        set piso2 = (select piso from Mesa where nMesa = thisNumeroMesa group by piso);
        
        update Reserva set
			nMesa = thisNumeroMesa,
            piso = piso2
		where idReserva = thisReserva;
    end ||

# solo fecha
Delimiter ||
drop procedure if exists Vivian.modReserva_F ||
create procedure modReserva_F(thisReserva char(4), thisFecha varchar(20))
	begin        
        update Reserva set
			fechaReservacion = thisFecha
		where idReserva = thisReserva;
    end ||
    
# solo turno
Delimiter ||
drop procedure if exists Vivian.modReserva_T ||
create procedure modReserva_T(thisReserva char(4), thisTurno varchar(20))
	begin        
        update Reserva set
			idTurno = thisTurno
		where idReserva = thisReserva;
    end ||
    
# mesa y fecha
Delimiter ||
drop procedure if exists Vivian.modReserva_MF ||
create procedure modReserva_MF(thisReserva char(4), thisNumeroMesa int, thisFecha varchar(20))
	begin
		declare piso2 int;
        set piso2 = (select piso from Mesa where nMesa = thisNumeroMesa group by piso);
        
        update Reserva set
			nMesa = thisNumeroMesa,
            piso = piso2,
            fechaReservacion = thisFecha
		where idReserva = thisReserva;
    end ||

# fecha y turno
Delimiter ||
drop procedure if exists Vivian.modReserva_FT ||
create procedure modReserva_FT(thisReserva char(4), thisFecha varchar(20), thisTurno varchar(20))
	begin
		update Reserva set
			fechaReservacion = thisFecha,
            idTurno = thisturno
		where idReserva = thisReserva;
    end ||
    
# mesa y turno
Delimiter ||
drop procedure if exists Vivian.modReserva_MT ||
create procedure modReserva_MT(thisReserva char(4), thisNumeroMesa int, thisTurno varchar(20))
	begin
		declare piso2 int;
        set piso2 = (select piso from Mesa where nMesa = thisNumeroMesa group by piso);
        
        update Reserva set
			nMesa = thisNumeroMesa,
            piso = piso2,
            idTurno = thisTurno
		where idReserva = thisReserva;
    end ||

# Todos los casilleros marcados
Delimiter ||
drop procedure if exists Vivian.modificarReserva ||
create procedure modificarReserva(thisReserva char(4), thisNumeroMesa int, thisFecha varchar(20), thisTurno varchar(20))
	begin
		declare piso2 int;
        set piso2 = (select piso from Mesa where nMesa = thisNumeroMesa group by piso);
        
        update Reserva set
			nMesa = thisNumeroMesa,
            piso = piso2,
            fechaReservacion = thisFecha,
            idTurno = thisTurno
		where idReserva = thisReserva;
    end ||
    
Delimiter ||
drop procedure if exists Vivian.delReserva ||
create procedure delReserva(cod char(4))
	begin
		delete from Reserva where idReserva = cod;
    end ||
-- -----------------------------------------------------
## Procedimientos de Usuario
-- -----------------------------------------------------
Delimiter %
drop procedure if exists Vivian.vUsuario %
create procedure vUsuario (thisEmail varchar(100), thisClave varchar(20))
begin
	select idUsuario, dni, nombresUsuario, apellidosUsuario, email, aes_decrypt(clave, 'rumble') clave, telefono, fechaRegistro, idTipo 
    from Usuario where email = thisEmail and clave = aes_encrypt(thisClave, 'rumble');
end %

Delimiter %
drop procedure if exists Vivian.AgregarUsuario %
create procedure AgregarUsuario
	(thisDni char(8), thisNombres varchar(45), thisApellidos varchar(45), thisCorreo varchar(100), 
    thisClave varchar(30), thisTelefono char(9), thisIdTipo int)
begin
	insert into Usuario(idUsuario, dni, nombresUsuario, apellidosUsuario, email, clave, telefono, fechaRegistro, idTipo) values
    (null, thisDni, thisNombres, thisApellidos, thisCorreo, aes_encrypt(thisClave, 'rumble'), thisTelefono, curdate(), if(isnull(thisIdTipo), 1, thisIdTipo));
end %

-- -----------------------------------------------------
Delimiter %
drop procedure if exists Vivian.ModificarUsuario %
create procedure ModificarUsuario
	(thisCodigo int, thisDni char(8), thisNombres varchar(45), thisApellidos varchar(45), 
	thisCorreo varchar(100), thisClave varchar(30), thisTelefono char(9))
begin
	update Usuario set
    dni = thisDni,
    nombresUsuario = thisNombres,
    apellidosUsuario = thisApellidos,
    email = thisCorreo,
    clave = aes_encrypt(thisClave, 'rumble'),
    telefono = thisTelefono
    where idUsuario = thisCodigo
    ;
end %

-- -----------------------------------------------------
Delimiter %
drop procedure if exists Vivian.EliminarUsuario %
create procedure EliminarUsuario(thisCodigo int)
begin
	delete from Usuario where idUsuario = thisCodigo;
end %

-- -----------------------------------------------------
## Procedimientos de Pedidos
-- -----------------------------------------------------
Delimiter !!
drop procedure if exists Vivian.AgregarPedido !!
create procedure AgregarPedido(idPedido int, thisIdUsuario int, thisIdPago int)
begin
	insert into Pedido(idPedido, idUsuario, idPago) values
    (thisIdPedido, thisIdUsuario, thisIdPago);
end !!

Delimiter !!
drop procedure if exists Vivian.EliminarPedido !!
create procedure EliminarPedido(thisCodigo int)
begin
	delete from Pedido where idPedido = thisCodigo;
end !!

-- -----------------------------------------------------
## Procedimientos de Productos
-- -----------------------------------------------------
Delimiter ||
drop procedure if exists Vivian.AgregarProducto ||
create procedure AgregarProducto(thisMoneda varchar(30), thisProducto varchar(40), thisPrecio double, thisCategoria int, thisStock int, thisReparto int)
begin
	insert into Producto(idProducto, moneda, nombreProducto, precio, idCategoria, stock, reparto) values
    (null, thisMoneda, thisProducto, thisPrecio, thisCategoria, thisStock, thisReparto);
end ||

Delimiter ||
drop procedure if exists Vivian.EliminarProducto ||
create procedure EliminarProducto(thisCodigo int)
begin
	delete from Producto where idProducto = thisCodigo;
end ||
-- -----------------------------------------------------
## Procedimientos de Boleta
-- -----------------------------------------------------
Delimiter /
drop procedure if exists Vivian.GenerarBoleta /
create procedure GenerarBoleta
	(thisIdPedido int, thisIdUsuario int, thisApellidos varchar(45), 
    thisIdProducto int, thisProducto varchar(45), thisIdPago int, thisCantidad int, thisMonto varchar(45))
begin
	insert into `Detalles Pedido`(idPedido, idUsuario, apellidosUsuario, idProducto, nombreProducto, idPago, cantidadTotal, monto) values
    (thisIdPedido, thisIdUsuario, thisApellidos, thisIdProducto, thisProducto, thisIdPago, thisCantidad, thisMonto);
end /

Delimiter /
drop procedure if exists Vivian.EliminarBoleta /
create procedure EliminarBoleta(thisCodigo int)
begin
	delete from `Detalles Pedido` where idPedido = thisCodigo;
end /