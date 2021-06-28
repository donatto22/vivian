-- -----------------------------------------------------
-- ⚠ No ejecutar sin tener la base de datos!! ⚠
-- -----------------------------------------------------

use Vivian;

-- -----------------------------------------------------
-- Vista de Productos
-- -----------------------------------------------------
create or replace view v_Productos as
	select p.idProducto ,p.moneda `Moneda`, p.nombreProducto `Producto`, c.idCategoria ,c.descripcionCategoria `Categoria`, p.precio `Precio`, p.reparto, p.stock
    from Producto p
    
    inner join Categoria c on p.idCategoria = c.idCategoria
;

-- -----------------------------------------------------
# PRocedimientos de Filtrado
-- -----------------------------------------------------
Delimiter $
drop procedure if exists Vivian.modView1 $
create procedure modView1()
begin
	select * from v_Productos;
end $

Delimiter $
drop procedure if exists Vivian.modView2 $
create procedure modView2(thisCategoria int)
begin
	select * from v_Productos where idCategoria = thisCategoria;
end $

Delimiter $
drop procedure if exists Vivian.modView3 $
create procedure modView3(thisMoneda varchar(30))
begin
	select * from v_Productos where moneda = thisMoneda;
end $

Delimiter $
drop procedure if exists Vivian.modView4 $
create procedure modView4(thisCategoria int, thisMoneda varchar(30))
begin
	select * from v_Productos where idCategoria = thisCategoria and moneda = thisMoneda;
end $
-- -----------------------------------------------------
# Procedimientos de los Select
-- -----------------------------------------------------
Delimiter $$
drop procedure if exists Vivian.modBox $$
create procedure modBox(thisCodigo int)
begin
	# Categorias
	if thisCodigo = 1 then
		select * from categoria;
	end if;
    
    # Moneda
    if thisCodigo = 2 then
		select * from moneda;
	end if;
    
    # Turno
    if thisCodigo = 3 then
		select * from turno;
	end if;
    
    # Mesas
    if thisCodigo = 4 then
		select * from mesa;
	end if;
end $$