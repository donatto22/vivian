DROP DATABASE if exists Vivian;
create database Vivian default character set utf8mb4;
use Vivian;

-- -----------------------------------------------------
## Tabla Tipo
-- -----------------------------------------------------
create table if not exists Tipo (
	idTipo char(1) not null,
    descripcion varchar(60) null
) engine = InnoDB default charset = utf8mb4;

alter table tipo add constraint pk_tipo primary key(idTipo);

insert into Tipo(idTipo, descripcion) values
	(1, 'Normal'),
    (2, 'Mantenimiento'),
    (3, 'Administrador')
;

-- -----------------------------------------------------
## Tabla Usuario
-- -----------------------------------------------------
create table if not exists Usuario (
	idUsuario int not null,
    dni char(8) not null, -- unique
    nombresUsuario varchar(45) not null,
    apellidosUsuario varchar(45) not null,
    email varchar(100) not null, -- unique
    clave blob not null,
    telefono char(9) not null,
    fechaRegistro date not null,
    idTipo char(1) default 1 not null -- tipo
) engine = InnoDB  default charset = utf8mb4 auto_increment 1;

alter table Usuario add constraint pk_usuario primary key(idUsuario);
alter table Usuario modify column `idUsuario` int auto_increment;
alter table Usuario add constraint uq_dni unique(dni);
alter table Usuario add constraint uq_email unique(email);

-- fk_tipo
alter table Usuario add constraint fk_Tipo
foreign key(idTipo) references Tipo(idTipo)
on delete cascade on update cascade;

insert into Usuario(idUsuario, dni, nombresUsuario, apellidosUsuario, email, clave, telefono, fechaRegistro, idTipo) values
	(1, 12312312, 'Donatto', 'Minaya', 'ottanod22@gmail.com', aes_encrypt('donatto22', 'rumble'), 913242570, '2021-04-01', 3),
    (2, 93766295, 'Gerson', 'Murguia', 'gerson@gmail.com', aes_encrypt('murguiaGerson', 'rumble'), 926537582, '2021-04-02', 3),
	(3, 12345678, 'Miriam', 'Lorem', 'miriam123@gmail.com', aes_encrypt('miriamL12345', 'rumble'), 987654321, '2021-05-10', default),
    (4, 23456789, 'Lidia', 'Ramirez', 'lidia_ram@gmail.com', aes_encrypt('lidia25', 'rumble'), 912345678, '2021-05-13', default),
    (5, 96817492, 'Juan', 'Escobar', 'e_juan@gmail.com', aes_encrypt('JuanEscobar', 'rumble'), 927811323, '2021-04-10', default)
;

-- -----------------------------------------------------
## Tabla Turno
-- -----------------------------------------------------
create table if not exists Turno (
	idTurno varchar(30) not null,
    descripcion varchar(35) not null
) engine = InnoDB default charset = utf8mb4;

alter table Turno add constraint pk_turno primary key(idTurno);
alter table Turno add constraint uq_descripcion unique(descripcion);

insert into Turno (idTurno, descripcion) values
	('Mañana', '07:30am - 11:30am'),
    ('Tarde', '12:00pm - 6:30pm'),
    ('Noche', '7:00pm - 11:30pm')
;

-- -----------------------------------------------------
## Tabla Mesa
-- -----------------------------------------------------
create table if not exists Mesa (
	nMesa int not null,
    piso char(1) not null,
    capacidadPersonas int not null
) engine = InnoDB default charset = utf8mb4;

alter table Mesa add constraint pk_mesa primary key(nMesa);

insert into Mesa(nMesa, piso, capacidadPersonas) values
	(1, 1, 5),
    (2, 1, 5),
    (3, 1, 4),
	(4, 1, 2),
    (5, 1, 6),
    (6, 2, 2),
    (7, 2, 5),
    (8, 2, 3),
    (9, 2, 3)
;

-- -----------------------------------------------------
## Tabla Categoria
-- -----------------------------------------------------
create table if not exists Categoria (
  idCategoria int not null,
  descripcionCategoria varchar(45) not null
) engine = InnoDB default charset = utf8mb4;

alter table categoria add constraint pk_categoria primary key(idCategoria);

insert into Categoria(idCategoria, descripcionCategoria) values 
	(1, 'Especial'),
    (2, 'Bebida'),
    (3, 'Postre'),
	(4, 'Ensalada'),
    (5, 'Bocadillo'),
    (6, 'Sandwich'),
    (7, 'Normal')
;

-- -----------------------------------------------------
## Tabla Reserva
-- -----------------------------------------------------
create table if not exists Reserva (
	idReserva char(4) not null,
    idUsuario int not null, -- Usuario
    nMesa int not null, -- Mesa
    piso char(1) not null, -- Mesa
    fechaReservacion date not null,
    idTurno varchar(20) not null -- Turno
) engine = InnoDB default charset = utf8mb4;

-- fk_usuario
alter table Reserva add constraint fk_usuario
foreign key(idUsuario) references Usuario(idUsuario)
on delete cascade on update cascade;

-- fk_mesa
alter table Reserva add constraint fk_mesa 
foreign key(nMesa) references Mesa(nMesa)
on delete cascade on update cascade;

-- fk_turno
alter table Reserva add constraint fk_turno 
foreign key(idTurno) references Turno(idTurno)
on delete cascade on update cascade;

insert into Reserva(idReserva, idUsuario, nMesa, piso, fechaReservacion, idTurno) values
	('A001', 3, 5, 1, '2021-06-10', 'Tarde'),
    ('A002', 3, 3, 1, '2021-06-15', 'Noche'),
    ('A003', 5, 6, 2, '2022-01-01', 'Mañana'),
    ('A004', 4, 1, 1, '2021-12-25', 'Noche')
;

-- -----------------------------------------------------
## Tabla Pago
-- -----------------------------------------------------
CREATE TABLE `pago` (
  `idPago` int NOT NULL AUTO_INCREMENT,
  `monto` varchar(40) NOT NULL,
  PRIMARY KEY (`idPago`)
) ENGINE=InnoDB AUTO_INCREMENT=1010 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
## Tabla Moneda
-- -----------------------------------------------------
create table if not exists Moneda (
	moneda varchar(30) not null,
    descripcion varchar(50) not null
)engine = InnoDB default charset = utf8mb4;

alter table Moneda add constraint pk_moneda primary key(moneda);

insert into Moneda(moneda, descripcion) values
	('Euro', 'Euro -> Moneda Global'),
	('Dolar', 'Dolar -> Moneda Global'),
    ('Soles', 'Soles -> Moneda Peruana'),
    ('Yen', 'Yen -> Moneda Japonesa')
;

-- -----------------------------------------------------
## Tabla Producto
-- -----------------------------------------------------
create table if not exists Producto (
	idProducto int not null,
    moneda varchar(30) not null, -- Moneda
    nombreProducto varchar(40) not null, 
    precio double not null,
    idCategoria int not null, -- categoria
    stock int null,
    reparto int not null
) engine = InnoDB default charset = utf8mb4;

-- pk_producto
alter table Producto add constraint pk_producto primary key(idProducto);
alter table Producto modify column idProducto int not null auto_increment;

-- fk_categoria
alter table Producto add constraint fk_categoria 
foreign key(idCategoria) references Categoria(idCategoria)
on delete cascade on update cascade;

-- fk_moneda
alter table Producto add constraint fk_moneda 
foreign key(moneda) references Moneda(moneda)
on delete cascade on update cascade;

insert into Producto(idProducto, moneda, nombreProducto, precio, idCategoria, stock, reparto) values 
/*
	(1, 'Especial')
    (2, 'Bebida')
    (3, 'Postre')
	(4, 'Ensalada')
    (5, 'Bocadillo')
    (7, 'Sandwich')
    (8, 'Normal')
*/
	(1, 'Euro' ,'Serendipity Sundae', 25000, 1, 2, 1),
    (2, 'Soles', 'Pollo a la Brasa', 62, 1, 13, 4),
    (3, 'Euro', 'Zillion Dollar Frittata', 1000, 1, 5, 2),
    (4, 'Yen', 'Ramen', 655, 7, 10, 1),
    (5, 'Soles', 'Ceviche', 9, 7, 20, 5),
    (6, 'Euro', 'Sandía negra Denzuke', 5600, 1, 1, 1),
    (7, 'Soles', 'Ensalada Popeye', 20, 4, 20, 2),
    (8, 'Soles', 'Hamburguesa Royal Chesse', 12, 7, 15, 1),
    (9, 'Dolar', 'Cerveza 7 Vidas', 2, 2, 34, 1),
    (10, 'Soles', 'Spagethi Carbonara', 45, 7, 7, 1),
    (11, 'Euro', 'Cocktel 27', 3200, 1, 3, 5),
    (12, 'Dolar', 'Sopa de Soja', 10, 7, 12, 1),
    (13, 'Soles', 'Pollo Tandoori', 27, 7, 4, 1),
    (14, 'Dolar', 'Azafrán', 2700, 1, 3, 1),
    (15, 'Euro', 'Kellab de Resaca', 1200, 1, 6, 1),
    (16, 'Soles', 'Langosgta al Ajillo', 129, 1, 3, 1),
    (17, 'Soles', 'Enchilada', 15, 7, 13, 1),
    (18, 'Dolar', 'Whisky Macallan 750ml', 230, 2, 7, 5)
;

-- -----------------------------------------------------
## Tabla pedido
-- -----------------------------------------------------
create table `pedido` (
  `idPedido` int not null auto_increment,
  `idUsuario` int not null,
  `idPago` int not null,
  `fechaCompra` date not null,
  `monto` decimal(10,0) not null,
  `estado` varchar(45) default 'En proceso',
  primary key (`idPedido`),
  key `fk_usuario2` (`idUsuario`),
  key `fk_pedido_pago_idx` (`idPago`),
  constraint `fk_pedido_pago` foreign key (`idPago`) references `pago` (`idPago`),
  constraint `fk_usuario2` foreign key (`idUsuario`) references `usuario` (`idUsuario`) on delete cascade on update cascade
) engine = InnoDB default charset = utf8mb4 collate = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
## Tabla detalles_pedido
-- -----------------------------------------------------
create table `detalles_pedido` (
  `idDetalle` int not null auto_increment,
  `idProducto` int not null,
  `idPedido` int not null,
  `cantidad` int not null,
  `precio` decimal(10,0) not null,
  `precioTotal` decimal(10,0) not null,
  primary key (`idDetalle`),
  key `fk_pedido` (`idPedido`),
  key `fk_producto` (`idProducto`),
  constraint `fk_pedido` foreign key (`idPedido`) references `pedido` (`idPedido`) on delete cascade on update cascade,
  constraint `fk_producto` foreign key (`idProducto`) references `producto` (`idProducto`) on delete cascade on update cascade
) engine = InnoDB default charset = utf8mb4;