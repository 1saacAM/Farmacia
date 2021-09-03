DROP DATABASE Farmacia;
CREATE DATABASE Farmacia;
USE Farmacia;

CREATE TABLE Usuario(
    idUser  int auto_increment,
    nom     varchar(40),
    contra  varchar(20),
    email   varchar(64),
    tipo    int,
    PRIMARY KEY (idUser)
)ENGINE=InnoDB;

CREATE TABLE Direccion(
    idDirec  int auto_increment,
    calle    varchar(20),
    inte     varchar(10),
    exte     varchar(10),
    col      varchar(30),
    mun      varchar(30),
    est      varchar(20),
    cp       varchar(10),
    PRIMARY KEY(idDirec)
)ENGINE=InnoDB;

CREATE TABLE PersDates(
    idDp int auto_increment,
    nombre  varchar(30),
    app     varchar(25),
    apm     varchar(25),
    telM    varchar(10),
    telF    varchar(10),
    direccion int ,
    PRIMARY KEY (idDp),
    FOREIGN KEY (direccion) REFERENCES Direccion(idDirec)
)ENGINE=InnoDB;

CREATE TABLE Cargo(
    idCargo    int auto_increment,
    nombre     varchar(20),
    sueldo     numeric(15,2),
    PRIMARY KEY (idCargo)
)ENGINE=InnoDB;

CREATE TABLE Empleado(
    idEmpleado  int auto_increment,
    RFC         varchar(13),
    CURP        varchar(18),
    user        int,
    idDp        int,
    idCargo     int,
    PRIMARY KEY (idEmpleado),
    FOREIGN KEY (user)    REFERENCES Usuario(idUser),
    FOREIGN KEY (idDp)    REFERENCES PersDates(idDp),
    FOREIGN KEY (idCargo) REFERENCES Cargo(idCargo)
)ENGINE=InnoDB;

CREATE TABLE Cliente(
    idCliente   int auto_increment,
    user        int,
    idDp        int,
    PRIMARY KEY (idCliente),
    FOREIGN KEY (user)    REFERENCES Usuario(idUser),
    FOREIGN KEY (idDp)    REFERENCES PersDates(idDp)
)ENGINE=InnoDB;

CREATE TABLE Proveedor(
    idProveedor int auto_increment,
    rs          varchar(60),
    email       varchar(64),
    web         varchar(100),
    tel         varchar(10),
    direccion   int,
    PRIMARY KEY (idProveedor),
    FOREIGN KEY (direccion) REFERENCES Direccion(idDirec)
)ENGINE=InnoDB;

CREATE TABLE Departamento(
    idDepart int auto_increment,
    nombre   varchar(20),
    PRIMARY KEY(idDepart)
)ENGINE=InnoDB;

CREATE TABLE Categoria(
    idCategoria   int auto_increment,
    nombre        varchar(20),
    PRIMARY KEY(idCategoria)
)ENGINE=InnoDB;

CREATE TABLE SCategoria(
    idSCategoria   int auto_increment,
    nombre         varchar(20),
    PRIMARY KEY(idSCategoria)
)ENGINE=InnoDB;

CREATE TABLE UnionDC(
    depart    int,
    categoria int,
    FOREIGN KEY (depart)    REFERENCES Departamento(idDepart),
    FOREIGN KEY (categoria) REFERENCES Categoria(idCategoria)
)ENGINE=InnoDB;

CREATE TABLE UnionCSC(
    categoria  int,
    scategoria int,
    FOREIGN KEY (categoria)  REFERENCES Categoria(idCategoria),
    FOREIGN KEY (scategoria) REFERENCES SCategoria(idSCategoria)
)ENGINE=InnoDB;

CREATE TABLE Producto(
    idProducto   int auto_increment,
    nombre       varchar(30),
    cb           varchar(30),
    marca        varchar(30),
    unidades     numeric(10,2),
    descripcion  varchar(200),
    precio       numeric(10,2),
    costo        numeric(10,2),
    departamento int,
    PRIMARY KEY (idProducto),
    FOREIGN KEY(departamento) REFERENCES Departamento(idDepart)
) ENGINE=InnoDB;

CREATE TABLE Imagen(
    idIm     int auto_increment,
    ruta     varchar(200),
    producto int,
    PRIMARY KEY (idIm),
    FOREIGN KEY (producto) REFERENCES Producto(idProducto)
)ENGINE=InnoDB;

CREATE TABLE FormaPago(
    idFpago       int auto_increment,
    nombre        varchar(100),
    numCuenta     varchar(16),
    cvv           int,
    PRIMARY KEY (idFpago)
)ENGINE=InnoDB;

CREATE TABLE Venta(
    idVenta     int auto_increment,
    idEmpleado  int,
    idCliente   int,
    idFpago     int,
    fechaVenta  date,
    subtotal    numeric(10,2),
    total       numeric(10,2),
    PRIMARY KEY (idVenta),
    FOREIGN KEY (idEmpleado) REFERENCES Venta(idVenta),
    FOREIGN KEY (idCliente)  REFERENCES Cliente(idCliente),
    FOREIGN KEY (idFpago)    REFERENCES FormaPago(idFpago)
) ENGINE=InnoDB;

CREATE TABLE Compra(
    idCompra     int auto_increment,
    idProveedor  int,
    idEmpleado   int,
    idFpago      int,
    subtotal     numeric(10,2),
    total        numeric(10,2),
    PRIMARY KEY (idCompra),
    FOREIGN KEY (idProveedor) REFERENCES Proveedor(idProveedor),
    FOREIGN KEY (idEmpleado)  REFERENCES Empleado(idEmpleado),
    FOREIGN KEY(idFpago)      REFERENCES FormaPago(idFpago)
) ENGINE=InnoDB;

CREATE TABLE Dventa(
    idDventa     int auto_increment,
    idCompra     int,
    idProducto   int,
    cantidad     int,
    PRIMARY KEY (idDventa),
    FOREIGN KEY (idCompra)   REFERENCES Compra(idCompra),
    FOREIGN KEY (idProducto) REFERENCES Producto(idProducto)
)ENGINE=InnoDB;

CREATE TABLE Dcompra(
    idDcompra    int auto_increment,
    idCompra     int,
    idProducto   int,
    cantidad     int,
    PRIMARY KEY  (idDcompra),
    FOREIGN KEY  (idCompra)   REFERENCES Compra(idCompra),
    FOREIGN KEY  (idProducto) REFERENCES Producto(idProducto)
)ENGINE=InnoDB;
