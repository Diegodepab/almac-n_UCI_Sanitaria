  USE [prueba]
GO

-- Eliminar las restricciones de clave foránea
ALTER TABLE [dbo].[AdmissionDx] DROP CONSTRAINT [FK_AdmissionDx_IngresoUCI];
ALTER TABLE [dbo].[Allergy] DROP CONSTRAINT [FK_Allergy_Tipo];
ALTER TABLE [dbo].[ApacheApsVar] DROP CONSTRAINT [FK_ApacheApsVar_IngresoUCI];
ALTER TABLE [dbo].[Diagnosis] DROP CONSTRAINT [FK_Diagnosis_Priority];
ALTER TABLE [dbo].[Hospital] DROP CONSTRAINT [FK_Hospital_Region];
ALTER TABLE [dbo].[IngresoUCI] DROP CONSTRAINT [FK_IngresoUCI_Hospital];
ALTER TABLE [dbo].[IngresoUCI] DROP CONSTRAINT [FK_IngresoUCI_Paciente];
ALTER TABLE [dbo].[IngresoUCI] DROP CONSTRAINT [FK_IngresoUCI_Tiempo];
ALTER TABLE [dbo].[Medication] DROP CONSTRAINT [FK_Medication_RouteAdmin];
ALTER TABLE [dbo].[Paciente] DROP CONSTRAINT [FK_Paciente_Ethnicity];
ALTER TABLE [dbo].[Paciente] DROP CONSTRAINT [FK_Paciente_Gender];
ALTER TABLE [dbo].[RespiratoryCare] DROP CONSTRAINT [FK_RespiratoryCare_IngresoUCI];
ALTER TABLE [dbo].[UCI_Alergia] DROP CONSTRAINT [FK_UCI_Alergia_Allergy];
ALTER TABLE [dbo].[UCI_Alergia] DROP CONSTRAINT [FK_UCI_Alergia_IngresoUCI];
ALTER TABLE [dbo].[UCI_Diagnosis] DROP CONSTRAINT [FK_UCI_Diagnosis_Diagnosis];
ALTER TABLE [dbo].[UCI_Diagnosis] DROP CONSTRAINT [FK_UCI_Diagnosis_IngresoUCI];
ALTER TABLE [dbo].[UCI_Medicacion] DROP CONSTRAINT [FK_UCI_Medicacion_IngresoUCI];
ALTER TABLE [dbo].[UCI_Medicacion] DROP CONSTRAINT [FK_UCI_Medicacion_Medication];
GO

-- Eliminar las tablas
DROP TABLE [dbo].[UCI_Medicacion];
DROP TABLE [dbo].[UCI_Diagnosis];
DROP TABLE [dbo].[UCI_Alergia];
DROP TABLE [dbo].[RespiratoryCare];
DROP TABLE [dbo].[Paciente];
DROP TABLE [dbo].[Medication];
DROP TABLE [dbo].[IngresoUCI];
DROP TABLE [dbo].[Hospital];
DROP TABLE [dbo].[Gender];
DROP TABLE [dbo].[Ethnicity];
DROP TABLE [dbo].[Priority];
DROP TABLE [dbo].[RouteAdmin];
DROP TABLE [dbo].[Tipo];
DROP TABLE [dbo].[Tiempo];
DROP TABLE [dbo].[Region];
DROP TABLE [dbo].[AdmissionDx];
DROP TABLE [dbo].[Allergy];
DROP TABLE [dbo].[ApacheApsVar];
DROP TABLE [dbo].[Diagnosis];
GO


USE [prueba]
GO
/****** Object:  Table [dbo].[AdmissionDx]    Script Date: 04/12/2024 0:11:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdmissionDx](
	[PatientUnitStayID] [int] NOT NULL,
	[AdmitDxEnteredOffset] [int] NOT NULL,
	[AdmitDxName] [varchar](255) NULL,
	[AdmissionDxID] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AdmissionDxID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Allergy]    Script Date: 04/12/2024 0:11:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Allergy](
	[AllergyType] [int] NULL,
	[AllergyName] [varchar](255) NULL,
	[AllergyID] [int] IDENTITY(1,1) NOT NULL,
	[patientID_og] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AllergyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApacheApsVar]    Script Date: 04/12/2024 0:11:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApacheApsVar](
	[PatientUnitStayID] [int] NULL,
	[Intubated] [smallint] NULL,
	[Vent] [smallint] NULL,
	[RespiratoryRate] [float] NULL,
	[paO2] [float] NULL,
	[FiO2] [float] NULL,
	[ApacheApsVarID] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ApacheApsVarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Diagnosis]    Script Date: 04/12/2024 0:11:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Diagnosis](
	[DiagnosisString] [varchar](200) NOT NULL,
	[priorityID] [int] NOT NULL,
	[DiagnosisID] [int] IDENTITY(1,1) NOT NULL,
	[patientID_og] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DiagnosisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ethnicity]    Script Date: 04/12/2024 0:11:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ethnicity](
	[ethnicityString] [varchar](50) NULL,
	[ethnicityID] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ethnicityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [uq_ethnicityString] UNIQUE NONCLUSTERED 
(
	[ethnicityString] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 04/12/2024 0:11:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[genderString] [varchar](25) NULL,
	[genderID] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[genderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hospital]    Script Date: 04/12/2024 0:11:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hospital](
	[regionID] [int] NULL,
	[HospitalID] [int] IDENTITY(1,1) NOT NULL,
	[hospitalID_og] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[HospitalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IngresoUCI]    Script Date: 04/12/2024 0:11:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IngresoUCI](
	[PatientHealthSystemStayID] [int] NULL,
	[hospitalDischargeOffset] [int] NULL,
	[HospitalID] [int] NULL,
	[UniquePID] [int] NULL,
	[TiempoID] [int] NOT NULL,
	[PatientUnitStayID] [int] IDENTITY(1,1) NOT NULL,
	[patientUnitStayID_og] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PatientUnitStayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medication]    Script Date: 04/12/2024 0:11:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medication](
	[DrugName] [varchar](220) NULL,
	[Dosage] [varchar](60) NULL,
	[routeAdminID] [int] NOT NULL,
	[MedicationID] [int] IDENTITY(1,1) NOT NULL,
	[patientID_og] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MedicationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 04/12/2024 0:11:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paciente](
	[age] [varchar](10) NULL,
	[genderID] [int] NULL,
	[ethnicityID] [int] NULL,
	[uniquePID] [int] IDENTITY(1,1) NOT NULL,
	[uniquePID_og] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[uniquePID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Priority]    Script Date: 04/12/2024 0:11:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Priority](
	[priorityString] [varchar](10) NULL,
	[priorityID] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[priorityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Region]    Script Date: 04/12/2024 0:11:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region](
	[regionString] [varchar](64) NULL,
	[regionID] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[regionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RespiratoryCare]    Script Date: 04/12/2024 0:11:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RespiratoryCare](
	[PatientUnitStayID] [int] NULL,
	[VentStartOffset] [int] NULL,
	[VentEndOffset] [int] NULL,
	[LowExhMVLimit] [numeric](11, 4) NULL,
	[HiExhMVLimit] [numeric](11, 4) NULL,
	[RespCareID] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RespCareID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RouteAdmin]    Script Date: 04/12/2024 0:11:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RouteAdmin](
	[routeAdminString] [varchar](120) NULL,
	[routeAdminID] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[routeAdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tiempo]    Script Date: 04/12/2024 0:11:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tiempo](
	[HospitalDischargeTime24] [varchar](8) NULL,
	[HospitalDischargeYear] [smallint] NULL,
	[TiempoID] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TiempoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo]    Script Date: 04/12/2024 0:11:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo](
	[tipoString] [varchar](255) NULL,
	[TipoID] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TipoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UCI_Alergia]    Script Date: 04/12/2024 0:11:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UCI_Alergia](
	[PatientUnitStayID] [int] NOT NULL,
	[AllergyID] [int] NOT NULL,
 CONSTRAINT [PK_UCI_Alergia] PRIMARY KEY CLUSTERED 
(
	[PatientUnitStayID] ASC,
	[AllergyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UCI_Diagnosis]    Script Date: 04/12/2024 0:11:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UCI_Diagnosis](
	[PatientUnitStayID] [int] NOT NULL,
	[DiagnosisID] [int] NOT NULL,
 CONSTRAINT [PK_UCI_Diagnosis] PRIMARY KEY CLUSTERED 
(
	[PatientUnitStayID] ASC,
	[DiagnosisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UCI_Medicacion]    Script Date: 04/12/2024 0:11:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UCI_Medicacion](
	[MedicationID] [int] NOT NULL,
	[PatientUnitStayID] [int] NOT NULL,
 CONSTRAINT [PK_UCI_Medicacion] PRIMARY KEY CLUSTERED 
(
	[MedicationID] ASC,
	[PatientUnitStayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AdmissionDx]  WITH CHECK ADD  CONSTRAINT [FK_AdmissionDx_IngresoUCI] FOREIGN KEY([PatientUnitStayID])
REFERENCES [dbo].[IngresoUCI] ([PatientUnitStayID])
GO
ALTER TABLE [dbo].[AdmissionDx] CHECK CONSTRAINT [FK_AdmissionDx_IngresoUCI]
GO
ALTER TABLE [dbo].[Allergy]  WITH CHECK ADD  CONSTRAINT [FK_Allergy_Tipo] FOREIGN KEY([AllergyType])
REFERENCES [dbo].[Tipo] ([TipoID])
GO
ALTER TABLE [dbo].[Allergy] CHECK CONSTRAINT [FK_Allergy_Tipo]
GO
ALTER TABLE [dbo].[ApacheApsVar]  WITH CHECK ADD  CONSTRAINT [FK_ApacheApsVar_IngresoUCI] FOREIGN KEY([PatientUnitStayID])
REFERENCES [dbo].[IngresoUCI] ([PatientUnitStayID])
GO
ALTER TABLE [dbo].[ApacheApsVar] CHECK CONSTRAINT [FK_ApacheApsVar_IngresoUCI]
GO
ALTER TABLE [dbo].[Diagnosis]  WITH CHECK ADD  CONSTRAINT [FK_Diagnosis_Priority] FOREIGN KEY([priorityID])
REFERENCES [dbo].[Priority] ([priorityID])
GO
ALTER TABLE [dbo].[Diagnosis] CHECK CONSTRAINT [FK_Diagnosis_Priority]
GO
ALTER TABLE [dbo].[Hospital]  WITH CHECK ADD  CONSTRAINT [FK_Hospital_Region] FOREIGN KEY([regionID])
REFERENCES [dbo].[Region] ([regionID])
GO
ALTER TABLE [dbo].[Hospital] CHECK CONSTRAINT [FK_Hospital_Region]
GO
ALTER TABLE [dbo].[IngresoUCI]  WITH CHECK ADD  CONSTRAINT [FK_IngresoUCI_Hospital] FOREIGN KEY([HospitalID])
REFERENCES [dbo].[Hospital] ([HospitalID])
GO
ALTER TABLE [dbo].[IngresoUCI] CHECK CONSTRAINT [FK_IngresoUCI_Hospital]
GO
ALTER TABLE [dbo].[IngresoUCI]  WITH CHECK ADD  CONSTRAINT [FK_IngresoUCI_Paciente] FOREIGN KEY([UniquePID])
REFERENCES [dbo].[Paciente] ([uniquePID])
GO
ALTER TABLE [dbo].[IngresoUCI] CHECK CONSTRAINT [FK_IngresoUCI_Paciente]
GO
ALTER TABLE [dbo].[IngresoUCI]  WITH CHECK ADD  CONSTRAINT [FK_IngresoUCI_Tiempo] FOREIGN KEY([TiempoID])
REFERENCES [dbo].[Tiempo] ([TiempoID])
GO
ALTER TABLE [dbo].[IngresoUCI] CHECK CONSTRAINT [FK_IngresoUCI_Tiempo]
GO
ALTER TABLE [dbo].[Medication]  WITH CHECK ADD  CONSTRAINT [FK_Medication_RouteAdmin] FOREIGN KEY([routeAdminID])
REFERENCES [dbo].[RouteAdmin] ([routeAdminID])
GO
ALTER TABLE [dbo].[Medication] CHECK CONSTRAINT [FK_Medication_RouteAdmin]
GO
ALTER TABLE [dbo].[Paciente]  WITH CHECK ADD  CONSTRAINT [FK_Paciente_Ethnicity] FOREIGN KEY([ethnicityID])
REFERENCES [dbo].[Ethnicity] ([ethnicityID])
GO
ALTER TABLE [dbo].[Paciente] CHECK CONSTRAINT [FK_Paciente_Ethnicity]
GO
ALTER TABLE [dbo].[Paciente]  WITH CHECK ADD  CONSTRAINT [FK_Paciente_Gender] FOREIGN KEY([genderID])
REFERENCES [dbo].[Gender] ([genderID])
GO
ALTER TABLE [dbo].[Paciente] CHECK CONSTRAINT [FK_Paciente_Gender]
GO
ALTER TABLE [dbo].[RespiratoryCare]  WITH CHECK ADD  CONSTRAINT [FK_RespiratoryCare_IngresoUCI] FOREIGN KEY([PatientUnitStayID])
REFERENCES [dbo].[IngresoUCI] ([PatientUnitStayID])
GO
ALTER TABLE [dbo].[RespiratoryCare] CHECK CONSTRAINT [FK_RespiratoryCare_IngresoUCI]
GO
ALTER TABLE [dbo].[UCI_Alergia]  WITH CHECK ADD  CONSTRAINT [FK_UCI_Alergia_Allergy] FOREIGN KEY([AllergyID])
REFERENCES [dbo].[Allergy] ([AllergyID])
GO
ALTER TABLE [dbo].[UCI_Alergia] CHECK CONSTRAINT [FK_UCI_Alergia_Allergy]
GO
ALTER TABLE [dbo].[UCI_Alergia]  WITH CHECK ADD  CONSTRAINT [FK_UCI_Alergia_IngresoUCI] FOREIGN KEY([PatientUnitStayID])
REFERENCES [dbo].[IngresoUCI] ([PatientUnitStayID])
GO
ALTER TABLE [dbo].[UCI_Alergia] CHECK CONSTRAINT [FK_UCI_Alergia_IngresoUCI]
GO
ALTER TABLE [dbo].[UCI_Diagnosis]  WITH CHECK ADD  CONSTRAINT [FK_UCI_Diagnosis_Diagnosis] FOREIGN KEY([DiagnosisID])
REFERENCES [dbo].[Diagnosis] ([DiagnosisID])
GO
ALTER TABLE [dbo].[UCI_Diagnosis] CHECK CONSTRAINT [FK_UCI_Diagnosis_Diagnosis]
GO
ALTER TABLE [dbo].[UCI_Diagnosis]  WITH CHECK ADD  CONSTRAINT [FK_UCI_Diagnosis_IngresoUCI] FOREIGN KEY([PatientUnitStayID])
REFERENCES [dbo].[IngresoUCI] ([PatientUnitStayID])
GO
ALTER TABLE [dbo].[UCI_Diagnosis] CHECK CONSTRAINT [FK_UCI_Diagnosis_IngresoUCI]
GO
ALTER TABLE [dbo].[UCI_Medicacion]  WITH CHECK ADD  CONSTRAINT [FK_UCI_Medicacion_IngresoUCI] FOREIGN KEY([PatientUnitStayID])
REFERENCES [dbo].[IngresoUCI] ([PatientUnitStayID])
GO
ALTER TABLE [dbo].[UCI_Medicacion] CHECK CONSTRAINT [FK_UCI_Medicacion_IngresoUCI]
GO
ALTER TABLE [dbo].[UCI_Medicacion]  WITH CHECK ADD  CONSTRAINT [FK_UCI_Medicacion_Medication] FOREIGN KEY([MedicationID])
REFERENCES [dbo].[Medication] ([MedicationID])
GO
ALTER TABLE [dbo].[UCI_Medicacion] CHECK CONSTRAINT [FK_UCI_Medicacion_Medication]
GO
