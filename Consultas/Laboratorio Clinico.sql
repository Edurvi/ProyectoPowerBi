
CREATE DATABASE Laboratorio_Clinico


USE Laboratorio_Clinico
GO

CREATE TABLE PAIS (
    IDPais INT  IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL
)

CREATE TABLE CIUDAD (
    IDCiudad INT IDENTITY(1,1) PRIMARY KEY,
    IDPais INT,
    Nombre VARCHAR(255) NOT NULL,
    FOREIGN KEY (IDPais) REFERENCES PAIS(IDPais)
)

CREATE TABLE CARGO (
    IDCargo INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL
)

CREATE TABLE ESPECIALIDAD (
    IDEspecialidad INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL
)

CREATE TABLE TIPO_EXAMEN (
    IDTipo_Examen INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL
)

CREATE TABLE TIPO_SEGURO (
    IDTipo_Seguro INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL
)

CREATE TABLE SEGURO (
    IDSeguro INT IDENTITY(1,1) PRIMARY KEY,
    IDTipo_Seguro INT,
    Nombre VARCHAR(255) NOT NULL,
    Estado VARCHAR(255) NOT NULL,
    FOREIGN KEY (IDTipo_Seguro) REFERENCES TIPO_SEGURO(IDTipo_Seguro)
)

CREATE TABLE PACIENTE (
    IDPaciente INT IDENTITY(1,1) PRIMARY KEY,
    IDCiudad INT,
    IDSeguro INT,
    Nombres VARCHAR(255) NOT NULL,
    Apellidos VARCHAR(255) NOT NULL,
    Cedula VARCHAR(255) NOT NULL,
    Sexo CHAR(1) NOT NULL,
    Fecha_de_nacimiento DATE NOT NULL,
    Dirección VARCHAR(255),
    Teléfono VARCHAR(255),
    Correo VARCHAR(255),
    FOREIGN KEY (IDCiudad) REFERENCES CIUDAD(IDCiudad),
    FOREIGN KEY (IDSeguro) REFERENCES SEGURO(IDSeguro)
)

CREATE TABLE MEDICO (
    IDMedico INT IDENTITY(1,1) PRIMARY KEY,
    IDCiudad INT,
    IDEspecialidad INT,
    Nombres VARCHAR(255) NOT NULL,
    Apellidos VARCHAR(255) NOT NULL,
    Cedula VARCHAR(255) NOT NULL,
    Sexo CHAR(1) NOT NULL,
    Fecha_de_nacimiento DATE NOT NULL,
    Dirección VARCHAR(255),
    Teléfono VARCHAR(255),
    Correo VARCHAR(255),
    FOREIGN KEY (IDCiudad) REFERENCES CIUDAD(IDCiudad),
    FOREIGN KEY (IDEspecialidad) REFERENCES ESPECIALIDAD(IDEspecialidad)
)

CREATE TABLE EMPLEADO (
    IDEmpleado INT IDENTITY(1,1) PRIMARY KEY,
    IDCiudad INT,
    IDCargo INT,
    Nombres VARCHAR(255) NOT NULL,
    Apellidos VARCHAR(255) NOT NULL,
    Cedula VARCHAR(255) NOT NULL,
    Sexo CHAR(1) NOT NULL,
    Fecha_de_nacimiento DATE NOT NULL,
    Dirección VARCHAR(255),
    Teléfono VARCHAR(255),
    Correo VARCHAR(255),
    FOREIGN KEY (IDCiudad) REFERENCES CIUDAD(IDCiudad),
    FOREIGN KEY (IDCargo) REFERENCES CARGO(IDCargo)
)

CREATE TABLE EXAMEN (
    IDExamen INT IDENTITY(1,1) PRIMARY KEY,
    IDTipo_Examen INT,
    Nombre VARCHAR(255) NOT NULL,
    Unidades VARCHAR(255),
    Valores_Referencia VARCHAR(255),
    Costo DECIMAL(10, 2),
    FOREIGN KEY (IDTipo_Examen) REFERENCES TIPO_EXAMEN(IDTipo_Examen)
)

CREATE TABLE ORDEN (
    IDOrden INT IDENTITY(1,1) PRIMARY KEY,
    IDMedico INT,
    IDPaciente INT,
    Observacion TEXT,
    Fecha_Orden DATE NOT NULL,
    Total DECIMAL(10, 2),
    FOREIGN KEY (IDMedico) REFERENCES MEDICO(IDMedico),
    FOREIGN KEY (IDPaciente) REFERENCES PACIENTE(IDPaciente)
)

CREATE TABLE ORDEN_EXAMEN (
    IDOrden_Examen INT IDENTITY(1,1) PRIMARY KEY,
    IDExamen INT,
    IDOrden INT,
	Precio MONEY,
	Iva INT,
	Total MONEY,
    FOREIGN KEY (IDExamen) REFERENCES EXAMEN(IDExamen),
    FOREIGN KEY (IDOrden) REFERENCES ORDEN(IDOrden)
)

CREATE TABLE RESULTADO_ORDEN (
    IDRes_Orden INT IDENTITY(1,1) PRIMARY KEY,
    IDOrden_Examen INT,
    IDEmpleado INT,
    Resultado FLOAT NOT NULL,
    Fecha_Resultado DATE NOT NULL,
    FOREIGN KEY (IDOrden_Examen) REFERENCES ORDEN_EXAMEN(IDOrden_Examen),
    FOREIGN KEY (IDEmpleado) REFERENCES EMPLEADO(IDEmpleado)
)



-- Insertando datos en la tabla PAIS
INSERT INTO PAIS (Nombre) VALUES ('Ecuador');
INSERT INTO PAIS (Nombre) VALUES ('Colombia');
INSERT INTO PAIS (Nombre) VALUES ('Perú');

-- Insertando datos en la tabla CIUDAD
INSERT INTO CIUDAD (IDPais, Nombre) VALUES (1, 'Quito');
INSERT INTO CIUDAD (IDPais, Nombre) VALUES (1, 'Guayaquil');
INSERT INTO CIUDAD (IDPais, Nombre) VALUES (2, 'Bogotá');
INSERT INTO CIUDAD (IDPais, Nombre) VALUES (2, 'Medellín');
INSERT INTO CIUDAD (IDPais, Nombre) VALUES (3, 'Lima');
INSERT INTO CIUDAD (IDPais, Nombre) VALUES (3, 'Cusco');

-- Insertando datos en la tabla CARGO
INSERT INTO CARGO (Nombre) VALUES ('Recepcionista');
INSERT INTO CARGO (Nombre) VALUES ('Enfermero');
INSERT INTO CARGO (Nombre) VALUES ('Técnico de Laboratorio');

-- Insertando datos en la tabla ESPECIALIDAD
INSERT INTO ESPECIALIDAD (Nombre) VALUES ('Cardiología');
INSERT INTO ESPECIALIDAD (Nombre) VALUES ('Pediatría');
INSERT INTO ESPECIALIDAD (Nombre) VALUES ('Neurología');

-- Insertando datos en la tabla TIPO_EXAMEN
INSERT INTO TIPO_EXAMEN (Nombre) VALUES ('Sangre');
INSERT INTO TIPO_EXAMEN (Nombre) VALUES ('Orina');
INSERT INTO TIPO_EXAMEN (Nombre) VALUES ('Imagen');

-- Insertando datos en la tabla TIPO_SEGURO
INSERT INTO TIPO_SEGURO (Nombre) VALUES ('Privado');
INSERT INTO TIPO_SEGURO (Nombre) VALUES ('Público');

-- Insertando datos en la tabla SEGURO
INSERT INTO SEGURO (IDTipo_Seguro, Nombre, Estado) VALUES (1, 'Seguro VIP', 'Activo');
INSERT INTO SEGURO (IDTipo_Seguro, Nombre, Estado) VALUES (2, 'Seguro Público', 'Activo');

-- Insertando datos en la tabla PACIENTE
INSERT INTO PACIENTE (IDCiudad, IDSeguro, Nombres, Apellidos, Cedula, Sexo, Fecha_de_nacimiento, Dirección, Teléfono, Correo) 
VALUES (1, 1, 'Juan', 'Pérez', '1712345678', 'M', '1985-06-15', 'Av. Colón', '0987654321', 'juan.perez@example.com');
INSERT INTO PACIENTE (IDCiudad, IDSeguro, Nombres, Apellidos, Cedula, Sexo, Fecha_de_nacimiento, Dirección, Teléfono, Correo) 
VALUES (2, 2, 'María', 'López', '0923456789', 'F', '1990-11-23', 'Calle 9 de Octubre', '0987654322', 'maria.lopez@example.com');

-- Insertando datos en la tabla MEDICO
INSERT INTO MEDICO (IDCiudad, IDEspecialidad, Nombres, Apellidos, Cedula, Sexo, Fecha_de_nacimiento, Dirección, Teléfono, Correo) 
VALUES (1, 1, 'Carlos', 'Mendoza', '1712345679', 'M', '1975-01-10', 'Av. América', '0987654323', 'carlos.mendoza@example.com');
INSERT INTO MEDICO (IDCiudad, IDEspecialidad, Nombres, Apellidos, Cedula, Sexo, Fecha_de_nacimiento, Dirección, Teléfono, Correo) 
VALUES (2, 2, 'Ana', 'González', '0923456790', 'F', '1982-07-25', 'Calle Chile', '0987654324', 'ana.gonzalez@example.com');

-- Insertando datos en la tabla EMPLEADO
INSERT INTO EMPLEADO (IDCiudad, IDCargo, Nombres, Apellidos, Cedula, Sexo, Fecha_de_nacimiento, Dirección, Teléfono, Correo) 
VALUES (1, 1, 'Laura', 'Ramírez', '1712345680', 'F', '1995-08-14', 'Av. Amazonas', '0987654325', 'laura.ramirez@example.com');
INSERT INTO EMPLEADO (IDCiudad, IDCargo, Nombres, Apellidos, Cedula, Sexo, Fecha_de_nacimiento, Dirección, Teléfono, Correo) 
VALUES (2, 3, 'Pedro', 'Jiménez', '0923456791', 'M', '1988-12-30', 'Calle Esmeraldas', '0987654326', 'pedro.jimenez@example.com');

-- Insertando datos en la tabla EXAMEN
INSERT INTO EXAMEN (IDTipo_Examen, Nombre, Unidades, Valores_Referencia, Costo) 
VALUES (1, 'Hemograma', 'mg/dL', '4.5-11.0', 20.00);
INSERT INTO EXAMEN (IDTipo_Examen, Nombre, Unidades, Valores_Referencia, Costo) 
VALUES (2, 'Urocultivo', 'cfu/mL', '<1000', 15.00);

-- Insertando datos en la tabla ORDEN
INSERT INTO ORDEN (IDMedico, IDPaciente, Observacion, Fecha_Orden, Total) 
VALUES (1, 1, 'Paciente con síntomas de anemia', '2024-06-01', 20.00);
INSERT INTO ORDEN (IDMedico, IDPaciente, Observacion, Fecha_Orden, Total) 
VALUES (2, 2, 'Paciente con infección urinaria', '2024-06-02', 15.00);

-- Insertando datos en la tabla ORDEN_EXAMEN
INSERT INTO ORDEN_EXAMEN (IDExamen, IDOrden, Precio, Iva, Total) 
VALUES (1, 1, 20.00, 12, 22.40);
INSERT INTO ORDEN_EXAMEN (IDExamen, IDOrden, Precio, Iva, Total) 
VALUES (2, 2, 15.00, 12, 16.80);

-- Insertando datos en la tabla RESULTADO_ORDEN
INSERT INTO RESULTADO_ORDEN (IDOrden_Examen, IDEmpleado, Resultado, Fecha_Resultado) 
VALUES (1, 2, 7.5, '2024-06-03');
INSERT INTO RESULTADO_ORDEN (IDOrden_Examen, IDEmpleado, Resultado, Fecha_Resultado) 
VALUES (2, 1, 500, '2024-06-04');

-- Insertando más datos en la tabla PACIENTE
INSERT INTO PACIENTE (IDCiudad, IDSeguro, Nombres, Apellidos, Cedula, Sexo, Fecha_de_nacimiento, Dirección, Teléfono, Correo) 
VALUES (3, 2, 'Luis', 'Martínez', '5312345678', 'M', '1987-02-19', 'Cra 10', '0987654327', 'luis.martinez@example.com');
INSERT INTO PACIENTE (IDCiudad, IDSeguro, Nombres, Apellidos, Cedula, Sexo, Fecha_de_nacimiento, Dirección, Teléfono, Correo) 
VALUES (4, 1, 'Laura', 'Fernández', '5323456789', 'F', '1992-05-30', 'Calle 50', '0987654328', 'laura.fernandez@example.com');
INSERT INTO PACIENTE (IDCiudad, IDSeguro, Nombres, Apellidos, Cedula, Sexo, Fecha_de_nacimiento, Dirección, Teléfono, Correo) 
VALUES (5, 2, 'José', 'Salazar', '5412345678', 'M', '1975-12-15', 'Av. La Marina', '0987654329', 'jose.salazar@example.com');
INSERT INTO PACIENTE (IDCiudad, IDSeguro, Nombres, Apellidos, Cedula, Sexo, Fecha_de_nacimiento, Dirección, Teléfono, Correo) 
VALUES (6, 1, 'Ana', 'Cruz', '5423456789', 'F', '1983-08-22', 'Calle San Blas', '0987654330', 'ana.cruz@example.com');

-- Insertando más datos en la tabla MEDICO
INSERT INTO MEDICO (IDCiudad, IDEspecialidad, Nombres, Apellidos, Cedula, Sexo, Fecha_de_nacimiento, Dirección, Teléfono, Correo) 
VALUES (3, 1, 'Gabriel', 'García', '5312345679', 'M', '1970-11-10', 'Cra 15', '0987654331', 'gabriel.garcia@example.com');
INSERT INTO MEDICO (IDCiudad, IDEspecialidad, Nombres, Apellidos, Cedula, Sexo, Fecha_de_nacimiento, Dirección, Teléfono, Correo) 
VALUES (4, 3, 'Sofía', 'Morales', '5323456790', 'F', '1985-03-25', 'Calle 100', '0987654332', 'sofia.morales@example.com');
INSERT INTO MEDICO (IDCiudad, IDEspecialidad, Nombres, Apellidos, Cedula, Sexo, Fecha_de_nacimiento, Dirección, Teléfono, Correo) 
VALUES (5, 2, 'Fernando', 'Pérez', '5412345679', 'M', '1979-06-20', 'Av. Bolívar', '0987654333', 'fernando.perez@example.com');
INSERT INTO MEDICO (IDCiudad, IDEspecialidad, Nombres, Apellidos, Cedula, Sexo, Fecha_de_nacimiento, Dirección, Teléfono, Correo) 
VALUES (6, 3, 'Lucía', 'Ramírez', '5423456790', 'F', '1980-09-05', 'Calle Miraflores', '0987654334', 'lucia.ramirez@example.com');

-- Insertando más datos en la tabla EMPLEADO
INSERT INTO EMPLEADO (IDCiudad, IDCargo, Nombres, Apellidos, Cedula, Sexo, Fecha_de_nacimiento, Dirección, Teléfono, Correo) 
VALUES (3, 2, 'Carlos', 'Ortiz', '5312345680', 'M', '1990-12-11', 'Cra 20', '0987654335', 'carlos.ortiz@example.com');
INSERT INTO EMPLEADO (IDCiudad, IDCargo, Nombres, Apellidos, Cedula, Sexo, Fecha_de_nacimiento, Dirección, Teléfono, Correo) 
VALUES (4, 1, 'Marta', 'Reyes', '5323456791', 'F', '1992-04-14', 'Calle 70', '0987654336', 'marta.reyes@example.com');
INSERT INTO EMPLEADO (IDCiudad, IDCargo, Nombres, Apellidos, Cedula, Sexo, Fecha_de_nacimiento, Dirección, Teléfono, Correo) 
VALUES (5, 3, 'Juan', 'Hernández', '5412345680', 'M', '1988-07-07', 'Av. Grau', '0987654337', 'juan.hernandez@example.com');
INSERT INTO EMPLEADO (IDCiudad, IDCargo, Nombres, Apellidos, Cedula, Sexo, Fecha_de_nacimiento, Dirección, Teléfono, Correo) 
VALUES (6, 2, 'Isabel', 'Romero', '5423456791', 'F', '1986-09-25', 'Calle Tupac Amaru', '0987654338', 'isabel.romero@example.com');

-- Insertando más datos en la tabla EXAMEN
INSERT INTO EXAMEN (IDTipo_Examen, Nombre, Unidades, Valores_Referencia, Costo) 
VALUES (1, 'Perfil Lipídico', 'mg/dL', '200-239', 25.00);
INSERT INTO EXAMEN (IDTipo_Examen, Nombre, Unidades, Valores_Referencia, Costo) 
VALUES (2, 'Creatinina', 'mg/dL', '0.6-1.2', 18.00);
INSERT INTO EXAMEN (IDTipo_Examen, Nombre, Unidades, Valores_Referencia, Costo) 
VALUES (3, 'Rayos X', 'cm', 'N/A', 30.00);
INSERT INTO EXAMEN (IDTipo_Examen, Nombre, Unidades, Valores_Referencia, Costo) 
VALUES (3, 'Ecografía', 'cm', 'N/A', 40.00);

-- Insertando más datos en la tabla ORDEN
INSERT INTO ORDEN (IDMedico, IDPaciente, Observacion, Fecha_Orden, Total) 
VALUES (3, 3, 'Paciente con niveles altos de colesterol', '2024-06-03', 25.00);

INSERT INTO ORDEN (IDMedico, IDPaciente, Observacion, Fecha_Orden, Total) 
VALUES (4, 4, 'Paciente con función renal reducida', '2024-06-04', 18.00);

INSERT INTO ORDEN (IDMedico, IDPaciente, Observacion, Fecha_Orden, Total) 
VALUES (5, 5, 'Paciente con fractura de brazo', '2024-06-05', 30.00);

INSERT INTO ORDEN (IDMedico, IDPaciente, Observacion, Fecha_Orden, Total) 
VALUES (6, 6, 'Paciente embarazada, control rutinario', '2024-06-06', 40.00);

INSERT INTO ORDEN (IDMedico, IDPaciente, Observacion, Fecha_Orden, Total) 
VALUES (1, 1, 'Chequeo general, paciente con historial de colesterol alto', '2024-06-07', 63.00);

INSERT INTO ORDEN (IDMedico, IDPaciente, Observacion, Fecha_Orden, Total) 
VALUES (2, 2, 'Chequeo post tratamiento de infección urinaria', '2024-06-08', 70.00);

INSERT INTO ORDEN (IDMedico, IDPaciente, Observacion, Fecha_Orden, Total) 
VALUES (3, 3, 'Paciente con diabetes, chequeo trimestral', '2024-06-09', 43.00);

INSERT INTO ORDEN (IDMedico, IDPaciente, Observacion, Fecha_Orden, Total) 
VALUES (4, 4, 'Control prenatal, segundo trimestre', '2024-06-10', 85.00);



delete ORDEN
delete ORDEN_EXAMEN
delete RESULTADO_ORDEN

select * from CARGO
select * from CIUDAD
select * from EMPLEADO
select * from ESPECIALIDAD
select * from EXAMEN
select * from MEDICO
select * from ORDEN
select * from ORDEN_EXAMEN
select * from PACIENTE
select * from PAIS
select * from RESULTADO_ORDEN
select * from SEGURO
select * from TIPO_EXAMEN
select * from TIPO_SEGURO


select * from ORDEN
select * from ORDEN_EXAMEN
select * from RESULTADO_ORDEN

----cargar empleado----
SELECT E.IDEmpleado, CONCAT(E.Nombres, ' ', E.Apellidos) AS Nombre,
	C.Nombre 'Ciudad', P.Nombre 'País', E.Sexo, FLOOR(CAST(DATEDIFF(DAY, E.Fecha_de_nacimiento, GETDATE()) AS FLOAT) / 365.25) AS Edad,
	Ca.Nombre 'Cargo', E.Dirección 'Dirección' 
	FROM EMPLEADO E, CARGO Ca, PAIS P, CIUDAD C 
WHERE P.IDPais = C.IDPais and E.IDCiudad = C.IDCiudad and E.IDCargo = Ca.IDCargo

----cargar examen----
SELECT E.IDExamen, E.Nombre 'Nombre del Examen',T.Nombre 'Tipo de Examen',
	E.Unidades, E.Valores_Referencia 'Valores de Referencia',E.Costo 
FROM EXAMEN E, TIPO_EXAMEN T
WHERE E.IDTipo_Examen = T.IDTipo_Examen

----cargar medico----
SELECT M.IDMedico,CONCAT(M.Nombres, ' ', M.Apellidos) 'Nombre', 
    C.Nombre 'Ciudad', 
    P.Nombre 'País', 
    E.Nombre 'Especialidad', 
    M.Sexo 'Sexo', 
    FLOOR(CAST(DATEDIFF(DAY, M.Fecha_de_nacimiento, GETDATE()) AS FLOAT) / 365.25) 'Edad', 
    M.Dirección 'Dirección'
FROM MEDICO M, CIUDAD C, PAIS P, ESPECIALIDAD E
WHERE M.IDCiudad = C.IDCiudad AND C.IDPais = P.IDPais AND M.IDEspecialidad = E.IDEspecialidad;



----cargar paciente----
select PA.IDPaciente, PA.Nombres,PA.Sexo,FLOOR(CAST(DATEDIFF(DAY,PA.Fecha_de_nacimiento,GETDATE())AS FLOAT)/365.25)AS Edad,C.Nombre 'Ciudad',
	P.Nombre'Pais',S.Nombre 'Seguro',PA.Dirección
from PACIENTE PA, PAIS P,CIUDAD C,SEGURO S
where  PA.IDCiudad = C.IDCiudad AND C.IDPais = P.IDPais AND PA.IDSeguro = S.IDSeguro


----cargar tiempo----
SELECT ROW_NUMBER() OVER (ORDER BY Fecha_Orden) AS 'IDTiempo',
 YEAR(Fecha_Orden) AS ANIO,
 MONTH(Fecha_Orden) AS MES,
 DAY(Fecha_Orden) AS DIA
FROM ORDEN
GROUP BY Fecha_Orden

----cargar Hecho----
CREATE VIEW vista_ordenes_tiempo AS
SELECT
  ROW_NUMBER() OVER (ORDER BY Fecha_Orden) AS 'IDTiempo',
  YEAR(Fecha_Orden) AS ANIO,
  MONTH(Fecha_Orden) AS MES,
  DAY(Fecha_Orden) AS DIA,Fecha_Orden
FROM ORDEN
GROUP BY Fecha_Orden;



--
SELECT O.IDMedico,IDPaciente,IDExamen,IDEmpleado,IDTiempo, 
OE.Precio 'Costo_Examen', RO.Resultado, O.Total 
FROM RESULTADO_ORDEN RO, ORDEN_EXAMEN OE, ORDEN O, vista_ordenes_tiempo ti
WHERE O.IDOrden = OE.IDOrden and OE.IDOrden_Examen = RO.IDOrden_Examen and ti.Fecha_Orden = O.Fecha_Orden

