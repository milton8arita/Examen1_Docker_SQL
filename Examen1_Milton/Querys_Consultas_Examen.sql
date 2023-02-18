Use examen;
Create table Proveedores
(
Id_Proveedor int identity(1,1) primary key not null,
Nombre_Proveedor varchar(45) not null,
Telefono int not null,
correo varchar(35),
Tipo_Proveedor varchar(45) not null,
Tipos_De_Entrega varchar(35) not null
);


Create table Productos
(
Id_Producto int identity(1,1) primary key not null,
Id_Proveedor int Foreign key References Proveedores(Id_proveedor),
Nombre_Producto varchar(50) not null,
Descripcion_Producto varchar(50) not null,
Precio_Unitario int not null,
Tipo_Moneda varchar(15) not null,
Fecha_Compra Datetime not null,
Impuesto int not null,
Precio_Compra int not null,
Precio_Venta int not null,
);

Create table Productos_Innovadores
(
Id_ProductoInnovador int identity(1,1) primary key not null,
Id_Proveedor int Foreign key References Proveedores(Id_proveedor),
Nombre_Producto varchar(50) not null,
Descripcion_Producto varchar(50) not null,
Precio_Unitario int not null,
Tipo_Moneda varchar(15) not null,
Fecha_Compra Datetime not null,
Fecha_Venta Datetime not null,
Impuesto int not null,			
Precio_Compra int not null,								  
Precio_Venta int not null,
);

Create table Productos_Almacen
(
Id_Almacen int identity(1,1) primary key not null,
Id_Producto int Foreign key references Productos(Id_Producto),
Nombre_Producto varchar(50) not null,
Cantidad int not null,
Fecha_Ingresado datetime not null
);



Create table Productos_Inno_Almacen
(
Id_Almacen_Inno int identity(1,1) primary key not null,
Id_ProductoInnovador int Foreign key references Productos_Innovadores(Id_ProductoInnovador),
Nombre_Producto varchar(50) not null,
Cantidad int not null,
Fecha_Ingresado datetime not null
);


Create table Clientes 
(
Id_Clientes int identity(1,1) primary key not null,
Nombre_Cliente varchar(50) not null,
Apellido varchar(50) not null,
Sexo varchar(20) not null,
Identidad int not null,
Telefono int not null,
Residencia_Actual varchar(45) not null
);

create table Clientes_Credito
(
Id_Clientes int foreign key references Clientes(Id_Clientes),
Fecha_Inicio_Credito datetime not null,
Total_A_Deber int not null,
Cuotas_A_Pagar int not null,
Fecha_Limite_Pagar datetime not null,

);


Create table CLientes_Factura
(
Id_Factura int identity(1,1) primary key not null,
Id_Cliente int foreign key references Clientes(Id_Clientes) not null,
Id_Producto int foreign key references Productos(Id_Producto) not null, 
Fecha_Compra datetime not null,
Precio_Unitario int not null,
Cantidad int not null, 
Total_Pagar int not null
);


											/*los productos comprados como innovadores se venderan aparte como innovadores*/


Create table CLientes_Factura_Innovadora
(
Id_Factura_Inno int identity(1,1) primary key not null,
Id_Cliente int foreign key references Clientes(Id_Clientes) not null,
Id_ProductoInnovador int Foreign key references Productos_Innovadores(Id_ProductoInnovador) not null,
Fecha_Compra datetime not null,
Precio_Unitario int not null,
Cantidad int not null, 
Total_Pagar int not null
);

Use examen;

Create table Usuarios
(
Id_Usuario int Identity(1,1) primary key not null,
Nombre varchar(50) not null,
Apellido varchar(50) not null, 
Direccion varchar(30),
Telefono int not null
);

 
Create table Caja
(
Id_Caja int identity(1,1) primary key not null,
Numero_Maquina int not null,
Ip_Maquina Varchar(40) not null
);


Create table Detalles_Caja
(
Id_Detalles int identity(1,1) primary key not null,
Fecha_Apertura datetime not null,
Fecha_Cierre datetime not null,
Monto_Apertura int not null,
Monto_Cierre int not null,
Id_Caja int foreign key references Caja(Id_Caja) not null,
Id_Usuario int foreign key references Usuarios(Id_Usuario) not null

);

Create table Gastos_Productos
(
Id_GastosProductos int Identity(1,1) primary key not null,
Productos_Utilizado int foreign key references Productos(Id_Producto) not null,
Cantidad int not null,
Fecha_Gasto datetime not null,
Total_Gasto int not null
);

Create table Otros_Gastos
(
Id_OtrosGastos int IDentity(1,1) primary key not null,
Tipo_Gasto varchar(50) not null,
Descripcion_Gasto varchar(50) not null,
Fecha_Gasto datetime not null,
Total_Gasto int not null
);

/*Proveedores*/
Insert into Proveedores values('Francisco',9845785,'francisco@gmail.com','Locales','Al Instante');
Insert into Proveedores values('Ivan',95485474,'Ivan@gmail.com','Internacionales','Al Instante');
Insert into Proveedores values('Leonel',9514248,'Leonel@gmail.com','Globales','Tardio');
Insert into Proveedores values('Ian',96174445,'Ian@gmail.com','Locales','Al Instante');
Insert into Proveedores values('Norman',96174443,'Norman@gmail.com','Locales','Al Instante');
Insert into Proveedores values('David',33112255,'David@gmail.com','Globales','A los 15 dias');
Insert into Proveedores values('Roberto',33225566,'Roberto@gmail.com','Locales','Al Instante');
Insert into Proveedores values('Fabricio',33556985,'Fabricio@gmail.com','Locales','Al Instante');
Insert into Proveedores values('Miguel',35654568,'Miguel@gmail.com','Internacionales','Al Instante');
Insert into Proveedores values('Manuel',32445587,'Manuel@gmail.com','Locales','A los 15 dias');
use examen
/*Productos*/
Insert into Productos values (1,'Pepsi','Pepsi 1 litro',25,'Lps','2023/01/01','2023/02/05',15,28,35);
Insert into Productos values (2,'Coca','Coca 1 litro',24,'Lps','2023/01/01','2023/03/05',15,26,30);
Insert into Productos values (3,'Anillito','1 Ristra',3,'Lps','2023/01/01','2023/04/05',0,3,5);
Insert into Productos values (1,'Tozteca','Tozteca Picante',3,'Lps','2023/01/01','2023/02/05',0,3,5);
Insert into Productos values (1,'Chetos','Hot',15,'Lps','2023/01/01','2023/05/05',12,17,20);
Insert into Productos values (3,'Doritos','Queso',18,'Lps','2023/01/01','2023/01/05',15,20,25);
Insert into Productos values (4,'Buckana','12',850,'Lps','2023/01/01','2023/02/18',30,900,1250);
Insert into Productos values (5,'Salva Vida','Lata',20,'Lps','2023/01/01','2023/02/12',12,23,28);
Insert into Productos values (6,'7 UP','1 litro',24,'Lps','2023/01/01','2023/02/12',15,26,28);
Insert into Productos values (9,'Arroz','1 libra',10,'Lps','2023/01/01','2023/02/14',30,15,20);

/*Innovadores*/
Insert into Productos_Innovadores values (1,'Detalles Aniversario','chocolates,frutas',150,'Lps','2023/01/01','2023/04/15',0,160,250);
Insert into Productos_Innovadores values (2,'Detalles A la Madre','chocolates,frutas',150,'Lps','2023/01/01','2023/05/10',0,160,250);
Insert into Productos_Innovadores values (2,'Frutas Internacionales','Frescas',50,'Lps','2023/05/01','2023/02/05',15,65,75);
Insert into Productos_Innovadores values (2,'Cerveza Internacional','Mediana',75,'Lps','2023/06/01','2023/08/05',30,90,100);


/*Almacen*/
Insert into Productos_Almacen values(1,'Pepsi',10,'2023/01/01');
Insert into Productos_Almacen values(2,'coca',15,'2023/01/01');
Insert into Productos_Almacen values(3,'Anillito',70,'2023/01/01');
Insert into Productos_Almacen values(4,'Tozteca',20,'2023/01/01');
Insert into Productos_Almacen values(5,'Chetos',40,'2023/01/01');
Insert into Productos_Almacen values(6,'Doritos',30,'2023/02/01');
Insert into Productos_Almacen values(7,'Buckana',8,'2023/02/01');
Insert into Productos_Almacen values(8,'Salva Vida',100,'2023/01/01');
Insert into Productos_Almacen values(9,'7 UP',50,'2023/01/01');
Insert into Productos_Almacen values(10,'Arroz',50,'2023/01/01');


/*Clientes*/
Use examen
Insert into Clientes values ('Francisco','Altamirano','Masculino',1604199400413,95458854,'El centro Azacualpa');
Insert into Clientes values ('RIgoberto','Arita','Masculino',160415216541,95458854,'Barrio Guadalupe Azacualpa');
Insert into Clientes values ('Roberto','Machado','Masculino',0405654156541,95458854,'Barrio Bella Azacualpa');
Insert into Clientes values ('Maynor','Suazo','Masculino',01246464146,95458854,'Barrio El centro Azacualpa');
Insert into Clientes values ('Cristiano','Rodriguez','Masculino',051245414454,95458854,'Barrio El centro Azacualpa');
Insert into Clientes values ('Josue','Rodriguez','Masculino',160419981145,95458854,'Barrio El centro Azacualpa');
Insert into Clientes values ('Alicia','Arita','Femenina',16044884544,95458854,'Barrio El centro Azacualpa');
Insert into Clientes values ('Francisca','Paz','Femenina',15041544665,95458854,'Barrio El centro Azacualpa');
Insert into Clientes values ('Estela','Arita','Femenina',1504199544584,95458854,'Barrio El centro Azacualpa');
Insert into Clientes values ('Carla','Altamirano','Femenina',160419954458,95458854,'Barrio El centro Azacualpa');

Alter table Clientes alter column Telefono BIGINT;


/*Clientes que tienen Credito*/

Insert into Clientes_Credito values(4,'2023/03/15',500,5,'2023/08/15');
Insert into Clientes_Credito values(35,'2023/02/26',350,7,'2023/09/26');
Insert into Clientes_Credito values(36,'2023/05/25',200,2,'2023/07/25');
Insert into Clientes_Credito values(38,'2022/12/05',800,5,'2023/05/05');
Insert into Clientes_Credito values(43,'2023/01/11',80,1,'2023/02/11');

/*Factura de compra del cliente*/

insert into CLientes_Factura values(4,2,'2023/02/18',30,2,60);
insert into CLientes_Factura values(34,1,'2023/02/18',35,2,70);
insert into CLientes_Factura values(35,1,'2023/02/18',35,3,105);
insert into CLientes_Factura values(4,10,'2023/02/18',20,1,20);
insert into CLientes_Factura values(36,7,'2023/02/18',1250,1,1250);
insert into CLientes_Factura values(38,8,'2023/02/18',28,6,168);
insert into CLientes_Factura values(39,10,'2023/02/18',20,2,40);
insert into CLientes_Factura values(40,3,'2023/02/18',5,3,15);
insert into CLientes_Factura values(41,6,'2023/02/18',25,2,50);
insert into CLientes_Factura values(34,2,'2023/02/18',30,1,30);


/*Factura cliente productos innovadores*/
insert into CLientes_Factura_Innovadora values(34,1,'2023/01/14',150,2,300);
insert into CLientes_Factura_Innovadora values(38,2,'2023/04/11',150,2,300);
insert into CLientes_Factura_Innovadora values(4,3,'2023/03/10',150,2,300);
insert into CLientes_Factura_Innovadora values(39,1,'2023/04/13',150,1,150);
insert into CLientes_Factura_Innovadora values(41,4,'2023/01/13',75,3,225);

/*Usuarios que trabajan en la tienda*/

insert into Usuarios values('Milton','Arita', 'El Centro Azacualpa',96174443);
insert into Usuarios values('Melvin','Arita', 'El Centro Azacualpa',96174443);
insert into Usuarios values('Leonel','Machado', 'El Centro Azacualpa',95144665);
insert into Usuarios values('Katerin','Machado', 'El Centro Azacualpa',94444584);
insert into Usuarios values('Cristian','Arita', 'El Centro Azacualpa',33025556);

/*Tabla Caja*/
Insert into Caja values(1,'192.168.1.0');
Insert into Caja values(2,'192.168.1.64');
Insert into Caja values(3,'192.168.1.128');

/*Manejo de caja Usuarios inician a trabajar*/

Insert into Detalles_Caja values ('2023/01/02 08:30:00:000','2023/01/02 03:00:00:000',500,4000,1,1);
Insert into Detalles_Caja values ('2023/01/02 03:00:00:000','2023/01/02 07:00:00:000',4000,7500,1,2);
Insert into Detalles_Caja values ('2023/01/03 08:30:00:000','2023/01/03 03:00:00:000',250,3500,2,3);
Insert into Detalles_Caja values ('2023/01/03 03:00:00:000','2023/01/03 07:00:00:000',3500,8070,2,1);


/*Gastos Realizados en la tienda para comida*/

insert into Gastos_Productos values(10,3,'2023/02/01',60);
insert into Gastos_Productos values(6,2,'2023/02/05',50);
insert into Gastos_Productos values(1,1,'2023/02/14',35);
insert into Gastos_Productos values(3,4,'2023/01/01',20);
insert into Gastos_Productos values(5,1,'2023/02/14',20);

/*Gastos Realizados Pagos luz impuestos etc*/

insert into Otros_Gastos values ('Pago de energia','Se paga mensual la energia','2023/01/02',560);
insert into Otros_Gastos values ('Pago de Agua','Pago mensual de el Agua','2023/02/01',140);
insert into Otros_Gastos values ('Pago de Impuestos','Pago a la Alcaldia','2023/01/02',1400);
insert into Otros_Gastos values ('Pago de Telefono','A la Agencia Claro','2023/04/02',750);


/*Ganancia de productos*/

Select p.Id_Producto, p.Nombre_Producto, pr.Nombre_Proveedor, p.Precio_Compra, p.Precio_Venta, p.Precio_Venta-p.Precio_Compra as Ganancia from Productos p
inner join Proveedores pr
on p.Id_Proveedor=pr.Id_Proveedor


/*Deudores*/
Select c.Id_Clientes, c.Nombre_Cliente, cc.Total_A_Deber, cc.Cuotas_A_Pagar from Clientes c
inner join Clientes_Credito cc
on cc.Id_Clientes=c.Id_Clientes

/*Usuarios horario en caja*/

Select u.Nombre as NombreUsuario, c.Id_Caja, d.Fecha_Apertura, d.Fecha_Cierre from Detalles_Caja d
inner join Usuarios u
on d.Id_Usuario=u.Id_Usuario
inner join Caja c
on d.Id_Caja=c.Id_Caja

Select * from Otros_Gastos ot
inner join Gastos_Productos gp
on gp.Id_GastosProductos=ot.Id_OtrosGastos


/*TODOS LOS GASTOS*/

Select * from Otros_Gastos 
CROSS JOIN Gastos_Productos;

Use examen
/*TIPO DE ENTREGA*/

Select pd.Id_Producto, pd.Nombre_Producto, pv.Nombre_Proveedor, pv.Tipos_De_Entrega from Productos pd
inner join Proveedores pv
on pv.Id_Proveedor=pd.Id_Proveedor;


/*PRODUCTOS CON 30% IMPUESTO*/

Select * from Productos pd
Right join Proveedores pv
on pd.Id_Proveedor=pv.Id_Proveedor
where pd.Impuesto = 30;
 
 /* Todo lo que compro */

Select  Sum(cf.Total_Pagar) as TotalCompra, c.Nombre_Cliente from CLientes_Factura cf
Right join Clientes c
on cf.Id_Cliente=c.Id_Clientes
where c.Id_Clientes = 4
group by c.Nombre_Cliente




