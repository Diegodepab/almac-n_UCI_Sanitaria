USE [prueba]
GO
/****** Object:  StoredProcedure [dbo].[BorrarAlmacenUCI]    Script Date: 04/12/2024 0:14:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[BorrarAlmacenUCI]
AS
BEGIN
    -- Deshabilitar las restricciones de claves foráneas
    EXEC sp_MSforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT ALL"
    
    -- Eliminar los registros de las tablas
    DELETE FROM UCI_Alergia;
    DELETE FROM UCI_Diagnosis;
    DELETE FROM UCI_Medicacion;
    DELETE FROM Gender;
    DELETE FROM Ethnicity;
    DELETE FROM Region;
    DELETE FROM IngresoUCI;
    DELETE FROM Hospital;
    DELETE FROM RouteAdmin;
    DELETE FROM Medication;
    DELETE FROM Priority;
    DELETE FROM Diagnosis;
    DELETE FROM Tipo;
    DELETE FROM Tiempo;
    DELETE FROM AdmissionDx;
    DELETE FROM Allergy;
    DELETE FROM ApacheApsVar;
    DELETE FROM Paciente;
    DELETE FROM RespiratoryCare;

    -- Habilitar nuevamente las restricciones de claves foráneas
    EXEC sp_MSforeachtable "ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL"
END
