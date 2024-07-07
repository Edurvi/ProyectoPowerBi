

CREATE TABLE Error_Logs(ID INT IDENTITY, MachineName varchar(200), PackageName varchar(200), TaskName varchar(200), ErrorCode int,
ErrorDescription varchar(max), Dated datetime) 
go

SELECT  E.IDEmpleado, CONCAT(E.Nombres, ' ', E.Apellidos) AS Nombre, C.Nombre 'Ciudad', P.Nombre 'País', E.Sexo, FLOOR(CAST(DATEDIFF(DAY, E.Fecha_de_nacimiento, GETDATE()) AS FLOAT) / 365.25) AS Edad,
    Ca.Nombre 'Cargo', E.Dirección 'Dirección' FROM EMPLEADO E, CARGO Ca, PAIS P, CIUDAD C 
WHERE P.IDPais = C.IDPais and E.IDCiudad = C.IDCiudad and E.IDCargo = Ca.IDCargo

select * from Empleado

select * from DIM_EMPLEADO

select * from Error_Logs

