create database escuelita;

go;

use escuelita

create TABLE Persona(
    CURP CHAR(18) NOT NULL PRIMARY KEY, 
    Nombre nvarchar(50)NOT NULL,
    Direccion nvarchar(100) NULL,
    Nacimiento DATE NOT NULL,
     
)

create TABLE Carrera (
    Clave CHAR(13) NOT NULL PRIMARY KEY,
    Nombre NVARCHAR(60) NOT NULL,
)

create TABLE Alumno (
    CURP CHAR(18) NOT NULL PRIMARY KEY FOREIGN KEY REFERENCES Persona(CURP) ,
    NumeroDeControl CHAR(8) NOT NULL UNIQUE,
    CarreraClave char(13) FOREIGN KEY REFERENCES Carrera (Clave)
)



create TABLE Docente (
CURP CHAR(18) NOT NULL PRIMARY KEY,
RFC CHAR(13) NOT NULL UNIQUE,
Profesion nvarchar(30) NULL,
FOREIGN KEY (CURP) REFERENCES Persona(CURP)
)


create TABLE Administrativo (
    CURP CHAR(18) NOT NULL PRIMARY KEY FOREIGN KEY REFERENCES Persona(CURP) 
)



INSERT INTO Carrera (Clave, Nombre)
     VALUES ( 'ITIC-2010-225', 'Ingenieria en Tecnologias de la Informacion y Comunicacion')


INSERT INTO Carrera (Clave, Nombre)
     VALUES ( 'ISIC-2010-224', 'Ingenieria en Sistemas Computacionales'),
            ( 'IMCT-2010-229', 'Ingenieria Mecatronica')

INSERT INTO Persona (CURP, Nombre, Direccion, Nacimiento)
     VALUES ('JS20FR', 'Johane Sacrebleu', 'Por alla', '2003-04-05')
    
INSERT into Alumno (CURP,NumeroDeControl, CarreraClave)
     VALUES ('JS20FR', '20170005', 'ITIC-2010-225')

select NumeroDeControl, Nombre, CarreraClave from Persona
    join Alumno on Persona.CURP = Alumno.CURP