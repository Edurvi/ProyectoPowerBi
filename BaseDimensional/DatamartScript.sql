CREATE DATABASE DM_Laboratorio_Clinico
go
-- Crear tabla DIM_PACIENTE
CREATE TABLE DIM_PACIENTE (
    IDPaciente INT PRIMARY KEY,
    Nombre NVARCHAR(100),
    Sexo NVARCHAR(10),
    Edad INT,
    Ciudad NVARCHAR(100),
    Pais NVARCHAR(100),
    Seguro NVARCHAR(100),
    Direccion NVARCHAR(255)
);

-- Crear tabla DIM_MEDICO
CREATE TABLE DIM_MEDICO (
    IDMedico INT PRIMARY KEY,
    Nombre NVARCHAR(100),
    Ciudad NVARCHAR(100),
    Pais NVARCHAR(100),
    Especialidad NVARCHAR(100),
    Sexo NVARCHAR(10),
    Edad INT,
    Direccion NVARCHAR(255)
);

-- Crear tabla DIM_EXAMEN
CREATE TABLE DIM_EXAMEN (
    IDExamen INT PRIMARY KEY,
    Nombre NVARCHAR(100),
    Tipo NVARCHAR(100),
    Unidades NVARCHAR(50),
    Valor_Referencia NVARCHAR(50),
    Costo DECIMAL(18, 2)
);

-- Crear tabla DIM_EMPLEADO
CREATE TABLE DIM_EMPLEADO (
    IDEmpleado INT PRIMARY KEY,
    Nombre NVARCHAR(255),
    Ciudad NVARCHAR(255),
    Pais NVARCHAR(255),
    Sexo char(1),
    Edad INT,
    Cargo NVARCHAR(255),
    Direccion NVARCHAR(255)
);

-- Crear tabla DIM_TIEMPO
CREATE TABLE DIM_TIEMPO (
    IDTiempo INT PRIMARY KEY,
    Anio INT,
    Mes INT,
    Dia INT
);

-- Crear tabla HECHOS_ORDEN_EXAMEN
CREATE TABLE HECHOS_ORDEN_EXAMEN (
    IDMedico INT,
    IDPaciente INT,
    IDExamen INT,
    IDEmpleado INT,
    IDTiempo INT,
    Costo_Examen DECIMAL(18, 2),
    Resultado NVARCHAR(255),
    Total DECIMAL(18, 2),
    FOREIGN KEY (IDMedico) REFERENCES DIM_MEDICO(IDMedico),
    FOREIGN KEY (IDPaciente) REFERENCES DIM_PACIENTE(IDPaciente),
    FOREIGN KEY (IDExamen) REFERENCES DIM_EXAMEN(IDExamen),
    FOREIGN KEY (IDEmpleado) REFERENCES DIM_EMPLEADO(IDEmpleado),
    FOREIGN KEY (IDTiempo) REFERENCES DIM_TIEMPO(IDTiempo)
);

SELECT * FROM DIM_EMPLEADO
