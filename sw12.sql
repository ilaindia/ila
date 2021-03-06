USE [SMS]
GO
/****** Object:  ForeignKey [FK_Mark_Entry_Department_Entry]    Script Date: 05/31/2016 18:27:40 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Mark_Entry_Department_Entry]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mark_Entry]'))
ALTER TABLE [dbo].[Mark_Entry] DROP CONSTRAINT [FK_Mark_Entry_Department_Entry]
GO
/****** Object:  ForeignKey [FK_Mark_Entry_Exam_Entry]    Script Date: 05/31/2016 18:27:40 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Mark_Entry_Exam_Entry]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mark_Entry]'))
ALTER TABLE [dbo].[Mark_Entry] DROP CONSTRAINT [FK_Mark_Entry_Exam_Entry]
GO
/****** Object:  ForeignKey [Fk_studentid map from student reg]    Script Date: 05/31/2016 18:27:40 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Fk_studentid map from student reg]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mark_Entry_Details]'))
ALTER TABLE [dbo].[Mark_Entry_Details] DROP CONSTRAINT [Fk_studentid map from student reg]
GO
/****** Object:  ForeignKey [Fk_subject id map from subject]    Script Date: 05/31/2016 18:27:40 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Fk_subject id map from subject]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mark_Entry_Details]'))
ALTER TABLE [dbo].[Mark_Entry_Details] DROP CONSTRAINT [Fk_subject id map from subject]
GO
/****** Object:  ForeignKey [FK_sms_subject_Mapping_Sms_department_Entry]    Script Date: 05/31/2016 18:27:40 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sms_subject_Mapping_Sms_department_Entry]') AND parent_object_id = OBJECT_ID(N'[dbo].[subject_Mapping]'))
ALTER TABLE [dbo].[subject_Mapping] DROP CONSTRAINT [FK_sms_subject_Mapping_Sms_department_Entry]
GO
/****** Object:  ForeignKey [FK_sms_subject_Mapping_Sms_Subject_Entry2]    Script Date: 05/31/2016 18:27:40 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sms_subject_Mapping_Sms_Subject_Entry2]') AND parent_object_id = OBJECT_ID(N'[dbo].[subject_Mapping]'))
ALTER TABLE [dbo].[subject_Mapping] DROP CONSTRAINT [FK_sms_subject_Mapping_Sms_Subject_Entry2]
GO
/****** Object:  UserDefinedFunction [dbo].[Department_Efficiency]    Script Date: 05/31/2016 18:27:44 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Department_Efficiency]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[Department_Efficiency]
GO
/****** Object:  StoredProcedure [dbo].[subjectname]    Script Date: 05/31/2016 18:27:43 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[subjectname]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[subjectname]
GO
/****** Object:  StoredProcedure [dbo].[usp_Mark_Entry]    Script Date: 05/31/2016 18:27:43 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Mark_Entry]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Mark_Entry]
GO
/****** Object:  StoredProcedure [dbo].[usp_Mark_Entry_Report]    Script Date: 05/31/2016 18:27:43 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Mark_Entry_Report]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Mark_Entry_Report]
GO
/****** Object:  View [dbo].[Vu_Studt_Dep]    Script Date: 05/31/2016 18:27:41 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Vu_Studt_Dep]'))
DROP VIEW [dbo].[Vu_Studt_Dep]
GO
/****** Object:  UserDefinedFunction [dbo].[GET_Department_ID]    Script Date: 05/31/2016 18:27:44 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GET_Department_ID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[GET_Department_ID]
GO
/****** Object:  UserDefinedFunction [dbo].[GET_STUDENT_ID]    Script Date: 05/31/2016 18:27:44 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GET_STUDENT_ID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[GET_STUDENT_ID]
GO
/****** Object:  UserDefinedFunction [dbo].[GET_subject_ID]    Script Date: 05/31/2016 18:27:44 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GET_subject_ID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[GET_subject_ID]
GO
/****** Object:  StoredProcedure [dbo].[gridlistpage]    Script Date: 05/31/2016 18:27:43 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[gridlistpage]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[gridlistpage]
GO
/****** Object:  Table [dbo].[subject_Mapping]    Script Date: 05/31/2016 18:27:40 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sms_subject_Mapping_Sms_department_Entry]') AND parent_object_id = OBJECT_ID(N'[dbo].[subject_Mapping]'))
ALTER TABLE [dbo].[subject_Mapping] DROP CONSTRAINT [FK_sms_subject_Mapping_Sms_department_Entry]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sms_subject_Mapping_Sms_Subject_Entry2]') AND parent_object_id = OBJECT_ID(N'[dbo].[subject_Mapping]'))
ALTER TABLE [dbo].[subject_Mapping] DROP CONSTRAINT [FK_sms_subject_Mapping_Sms_Subject_Entry2]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[subject_Mapping]') AND type in (N'U'))
DROP TABLE [dbo].[subject_Mapping]
GO
/****** Object:  Table [dbo].[Mark_Entry]    Script Date: 05/31/2016 18:27:40 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Mark_Entry_Department_Entry]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mark_Entry]'))
ALTER TABLE [dbo].[Mark_Entry] DROP CONSTRAINT [FK_Mark_Entry_Department_Entry]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Mark_Entry_Exam_Entry]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mark_Entry]'))
ALTER TABLE [dbo].[Mark_Entry] DROP CONSTRAINT [FK_Mark_Entry_Exam_Entry]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mark_Entry]') AND type in (N'U'))
DROP TABLE [dbo].[Mark_Entry]
GO
/****** Object:  Table [dbo].[Mark_Entry_Details]    Script Date: 05/31/2016 18:27:40 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Fk_studentid map from student reg]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mark_Entry_Details]'))
ALTER TABLE [dbo].[Mark_Entry_Details] DROP CONSTRAINT [Fk_studentid map from student reg]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Fk_subject id map from subject]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mark_Entry_Details]'))
ALTER TABLE [dbo].[Mark_Entry_Details] DROP CONSTRAINT [Fk_subject id map from subject]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mark_Entry_Details]') AND type in (N'U'))
DROP TABLE [dbo].[Mark_Entry_Details]
GO
/****** Object:  Table [dbo].[Student_Registration]    Script Date: 05/31/2016 18:27:40 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Student_Registration]') AND type in (N'U'))
DROP TABLE [dbo].[Student_Registration]
GO
/****** Object:  Table [dbo].[Subject_Entry]    Script Date: 05/31/2016 18:27:40 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Subject_Entry]') AND type in (N'U'))
DROP TABLE [dbo].[Subject_Entry]
GO
/****** Object:  Table [dbo].[Login]    Script Date: 05/31/2016 18:27:40 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Login]') AND type in (N'U'))
DROP TABLE [dbo].[Login]
GO
/****** Object:  Table [dbo].[Department_Entry]    Script Date: 05/31/2016 18:27:40 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Department_Entry]') AND type in (N'U'))
DROP TABLE [dbo].[Department_Entry]
GO
/****** Object:  Table [dbo].[Exam_Entry]    Script Date: 05/31/2016 18:27:40 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Exam_Entry]') AND type in (N'U'))
DROP TABLE [dbo].[Exam_Entry]
GO
/****** Object:  Table [dbo].[Exam_Entry]    Script Date: 05/31/2016 18:27:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Exam_Entry]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Exam_Entry](
	[Slno] [int] IDENTITY(1,1) NOT NULL,
	[Exam_Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Exam_Entry] PRIMARY KEY CLUSTERED 
(
	[Slno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Exam_Entry] ON
INSERT [dbo].[Exam_Entry] ([Slno], [Exam_Name]) VALUES (1, N'Term I')
INSERT [dbo].[Exam_Entry] ([Slno], [Exam_Name]) VALUES (2, N'Term II')
INSERT [dbo].[Exam_Entry] ([Slno], [Exam_Name]) VALUES (3, N'Term III')
INSERT [dbo].[Exam_Entry] ([Slno], [Exam_Name]) VALUES (4, N'Term IV')
INSERT [dbo].[Exam_Entry] ([Slno], [Exam_Name]) VALUES (5, N'Term V')
SET IDENTITY_INSERT [dbo].[Exam_Entry] OFF
/****** Object:  Table [dbo].[Department_Entry]    Script Date: 05/31/2016 18:27:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Department_Entry]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Department_Entry](
	[Slno] [int] IDENTITY(1,1) NOT NULL,
	[Pk_DepartmentID] [varchar](50) NOT NULL,
	[Department_Name] [varchar](50) NOT NULL,
	[Age_Limit] [smallint] NOT NULL,
 CONSTRAINT [PK_Sms_departmentEntry] PRIMARY KEY CLUSTERED 
(
	[Pk_DepartmentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Department_Entry] ON
INSERT [dbo].[Department_Entry] ([Slno], [Pk_DepartmentID], [Department_Name], [Age_Limit]) VALUES (21, N'DEPT001', N'1st Std', 5)
INSERT [dbo].[Department_Entry] ([Slno], [Pk_DepartmentID], [Department_Name], [Age_Limit]) VALUES (23, N'DEPT022', N'2nd Std', 6)
INSERT [dbo].[Department_Entry] ([Slno], [Pk_DepartmentID], [Department_Name], [Age_Limit]) VALUES (25, N'DEPT024', N'3rd Std', 7)
INSERT [dbo].[Department_Entry] ([Slno], [Pk_DepartmentID], [Department_Name], [Age_Limit]) VALUES (34, N'DEPT027', N'4th Std', 8)
INSERT [dbo].[Department_Entry] ([Slno], [Pk_DepartmentID], [Department_Name], [Age_Limit]) VALUES (83, N'DEPT035', N'5th Std', 9)
INSERT [dbo].[Department_Entry] ([Slno], [Pk_DepartmentID], [Department_Name], [Age_Limit]) VALUES (86, N'DEPT084', N'6th Std', 10)
INSERT [dbo].[Department_Entry] ([Slno], [Pk_DepartmentID], [Department_Name], [Age_Limit]) VALUES (94, N'DEPT087', N'7th std', 11)
INSERT [dbo].[Department_Entry] ([Slno], [Pk_DepartmentID], [Department_Name], [Age_Limit]) VALUES (95, N'DEPT095', N'8th std', 12)
INSERT [dbo].[Department_Entry] ([Slno], [Pk_DepartmentID], [Department_Name], [Age_Limit]) VALUES (96, N'DEPT096', N'9th std', 13)
INSERT [dbo].[Department_Entry] ([Slno], [Pk_DepartmentID], [Department_Name], [Age_Limit]) VALUES (97, N'DEPT097', N'10th std', 14)
INSERT [dbo].[Department_Entry] ([Slno], [Pk_DepartmentID], [Department_Name], [Age_Limit]) VALUES (98, N'DEPT098', N'11th std', 15)
INSERT [dbo].[Department_Entry] ([Slno], [Pk_DepartmentID], [Department_Name], [Age_Limit]) VALUES (100, N'DEPT099', N'12th std', 12)
SET IDENTITY_INSERT [dbo].[Department_Entry] OFF
/****** Object:  Table [dbo].[Login]    Script Date: 05/31/2016 18:27:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Login]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Login](
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[FullName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_login] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Login] ([UserName], [Password], [FullName]) VALUES (N'cool', N'cool123', N'Ilavarasan')
INSERT [dbo].[Login] ([UserName], [Password], [FullName]) VALUES (N'ilavarasan', N'cool', N'ilavarasanG')
INSERT [dbo].[Login] ([UserName], [Password], [FullName]) VALUES (N'Test', N'Test', N'Elakiya')
/****** Object:  Table [dbo].[Subject_Entry]    Script Date: 05/31/2016 18:27:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Subject_Entry]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Subject_Entry](
	[Slno] [int] IDENTITY(1,1) NOT NULL,
	[PK_SubjectID] [varchar](50) NOT NULL,
	[Subject_Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Sms_SubjectEntry] PRIMARY KEY CLUSTERED 
(
	[PK_SubjectID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Subject_Entry] ON
INSERT [dbo].[Subject_Entry] ([Slno], [PK_SubjectID], [Subject_Name]) VALUES (21, N'SUB001', N'Tamil')
INSERT [dbo].[Subject_Entry] ([Slno], [PK_SubjectID], [Subject_Name]) VALUES (22, N'SUB022', N'English')
INSERT [dbo].[Subject_Entry] ([Slno], [PK_SubjectID], [Subject_Name]) VALUES (23, N'SUB023', N'Maths')
INSERT [dbo].[Subject_Entry] ([Slno], [PK_SubjectID], [Subject_Name]) VALUES (24, N'SUB024', N'Science')
INSERT [dbo].[Subject_Entry] ([Slno], [PK_SubjectID], [Subject_Name]) VALUES (26, N'SUB025', N'Social Science')
INSERT [dbo].[Subject_Entry] ([Slno], [PK_SubjectID], [Subject_Name]) VALUES (27, N'SUB027', N'Biology')
INSERT [dbo].[Subject_Entry] ([Slno], [PK_SubjectID], [Subject_Name]) VALUES (28, N'SUB028', N'Chemistry')
INSERT [dbo].[Subject_Entry] ([Slno], [PK_SubjectID], [Subject_Name]) VALUES (29, N'SUB029', N'Zoology')
INSERT [dbo].[Subject_Entry] ([Slno], [PK_SubjectID], [Subject_Name]) VALUES (32, N'SUB030', N'Economics')
INSERT [dbo].[Subject_Entry] ([Slno], [PK_SubjectID], [Subject_Name]) VALUES (37, N'SUB033', N'Computer Science')
INSERT [dbo].[Subject_Entry] ([Slno], [PK_SubjectID], [Subject_Name]) VALUES (39, N'SUB039', N'Physics')
SET IDENTITY_INSERT [dbo].[Subject_Entry] OFF
/****** Object:  Table [dbo].[Student_Registration]    Script Date: 05/31/2016 18:27:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Student_Registration]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Student_Registration](
	[Slno] [int] IDENTITY(1,1) NOT NULL,
	[PK_StudentID] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[DOB] [date] NOT NULL,
	[Gender] [char](1) NOT NULL,
	[Caste] [varchar](50) NOT NULL,
	[FK_DepartmentID] [varchar](10) NOT NULL,
	[PhoneNo] [varchar](15) NOT NULL,
	[DOJ] [date] NOT NULL,
	[BloodGroup] [varchar](10) NOT NULL,
	[Address] [varchar](max) NOT NULL,
	[FatherName] [varchar](50) NOT NULL,
	[MotherName] [varchar](50) NOT NULL,
	[Boarding] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Sms_Student Registration] PRIMARY KEY CLUSTERED 
(
	[PK_StudentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Student_Registration] ON
INSERT [dbo].[Student_Registration] ([Slno], [PK_StudentID], [Name], [DOB], [Gender], [Caste], [FK_DepartmentID], [PhoneNo], [DOJ], [BloodGroup], [Address], [FatherName], [MotherName], [Boarding]) VALUES (10, N'SMS010', N'Nivetha', CAST(0x1B330B00 AS Date), N'F', N'BC', N'DEPT001', N'8547572477', CAST(0xBE3A0B00 AS Date), N'O-', N'200,Mark Street ,london', N'mrg', N'malar', N'Regular')
INSERT [dbo].[Student_Registration] ([Slno], [PK_StudentID], [Name], [DOB], [Gender], [Caste], [FK_DepartmentID], [PhoneNo], [DOJ], [BloodGroup], [Address], [FatherName], [MotherName], [Boarding]) VALUES (13, N'SMS013', N'Pream', CAST(0x01220B00 AS Date), N'M', N'MBC', N'DEPT001', N'9867532412', CAST(0x401D0B00 AS Date), N'O+', N'salem', N'raju', N'malar', N'Hostel')
INSERT [dbo].[Student_Registration] ([Slno], [PK_StudentID], [Name], [DOB], [Gender], [Caste], [FK_DepartmentID], [PhoneNo], [DOJ], [BloodGroup], [Address], [FatherName], [MotherName], [Boarding]) VALUES (28, N'SMS028', N'Elakiya', CAST(0xA8190B00 AS Date), N'M', N'MBC', N'DEPT001', N'9940923740', CAST(0x2D190B00 AS Date), N'O+', N'salem', N'guna', N'parimala', N'Regular')
INSERT [dbo].[Student_Registration] ([Slno], [PK_StudentID], [Name], [DOB], [Gender], [Caste], [FK_DepartmentID], [PhoneNo], [DOJ], [BloodGroup], [Address], [FatherName], [MotherName], [Boarding]) VALUES (38, N'SMS038', N'Ilavarasan', CAST(0x1C1D0B00 AS Date), N'F', N'SC', N'DEPT022', N'9636594651', CAST(0x612B0B00 AS Date), N'O-', N'hj', N'asrfas', N'xvdf', N'Regular')
INSERT [dbo].[Student_Registration] ([Slno], [PK_StudentID], [Name], [DOB], [Gender], [Caste], [FK_DepartmentID], [PhoneNo], [DOJ], [BloodGroup], [Address], [FatherName], [MotherName], [Boarding]) VALUES (40, N'SMS039', N'Keerthika', CAST(0xB4340B00 AS Date), N'F', N'BC', N'DEPT084', N'9876573134', CAST(0x6C3B0B00 AS Date), N'O-', N'namakkal', N'Kumaran', N'Santhi', N'Regular')
INSERT [dbo].[Student_Registration] ([Slno], [PK_StudentID], [Name], [DOB], [Gender], [Caste], [FK_DepartmentID], [PhoneNo], [DOJ], [BloodGroup], [Address], [FatherName], [MotherName], [Boarding]) VALUES (41, N'SMS041', N'Rathiga', CAST(0x7C1D0B00 AS Date), N'F', N'MBC', N'DEPT097', N'9345613457', CAST(0x613B0B00 AS Date), N'B+', N'raasipuram', N'jagir', N'kulobi', N'Regular')
INSERT [dbo].[Student_Registration] ([Slno], [PK_StudentID], [Name], [DOB], [Gender], [Caste], [FK_DepartmentID], [PhoneNo], [DOJ], [BloodGroup], [Address], [FatherName], [MotherName], [Boarding]) VALUES (42, N'SMS042', N'Manigandan', CAST(0x1C1D0B00 AS Date), N'F', N'MBC', N'DEPT022', N'9546579846', CAST(0x612B0B00 AS Date), N'A+', N'dhdh', N'asrfas', N'kulobi', N'Hostel')
INSERT [dbo].[Student_Registration] ([Slno], [PK_StudentID], [Name], [DOB], [Gender], [Caste], [FK_DepartmentID], [PhoneNo], [DOJ], [BloodGroup], [Address], [FatherName], [MotherName], [Boarding]) VALUES (43, N'SMS043', N'Dhanarasan', CAST(0x1C1D0B00 AS Date), N'F', N'ST', N'DEPT024', N'9465432132', CAST(0x612B0B00 AS Date), N'A+', N'hfghdhdf', N'honey', N'kulobi', N'Hostel')
INSERT [dbo].[Student_Registration] ([Slno], [PK_StudentID], [Name], [DOB], [Gender], [Caste], [FK_DepartmentID], [PhoneNo], [DOJ], [BloodGroup], [Address], [FatherName], [MotherName], [Boarding]) VALUES (44, N'SMS044', N'Vijay', CAST(0x1C1D0B00 AS Date), N'F', N'BC', N'DEPT001', N'9124564626', CAST(0x612B0B00 AS Date), N'O+', N'hjktg', N'honey', N'cust', N'Regular')
INSERT [dbo].[Student_Registration] ([Slno], [PK_StudentID], [Name], [DOB], [Gender], [Caste], [FK_DepartmentID], [PhoneNo], [DOJ], [BloodGroup], [Address], [FatherName], [MotherName], [Boarding]) VALUES (45, N'SMS045', N'Sathish', CAST(0x3E240B00 AS Date), N'F', N'MBC', N'DEPT001', N'9321446511', CAST(0x612B0B00 AS Date), N'A-', N'gfj', N'honey', N'cust', N'Regular')
INSERT [dbo].[Student_Registration] ([Slno], [PK_StudentID], [Name], [DOB], [Gender], [Caste], [FK_DepartmentID], [PhoneNo], [DOJ], [BloodGroup], [Address], [FatherName], [MotherName], [Boarding]) VALUES (46, N'SMS046', N'Arumugam', CAST(0x3E240B00 AS Date), N'F', N'BC', N'DEPT001', N'9213453743', CAST(0x612B0B00 AS Date), N'O+', N'r5utfu', N'honey', N'cust', N'Hostel')
INSERT [dbo].[Student_Registration] ([Slno], [PK_StudentID], [Name], [DOB], [Gender], [Caste], [FK_DepartmentID], [PhoneNo], [DOJ], [BloodGroup], [Address], [FatherName], [MotherName], [Boarding]) VALUES (47, N'SMS047', N'Uma', CAST(0x1C1D0B00 AS Date), N'F', N'BC', N'DEPT001', N'9265465798', CAST(0x612B0B00 AS Date), N'O+', N'dfghd', N'honey', N'cust', N'Hostel')
INSERT [dbo].[Student_Registration] ([Slno], [PK_StudentID], [Name], [DOB], [Gender], [Caste], [FK_DepartmentID], [PhoneNo], [DOJ], [BloodGroup], [Address], [FatherName], [MotherName], [Boarding]) VALUES (48, N'SMS048', N'Vinoth', CAST(0x1C1D0B00 AS Date), N'F', N'BC', N'DEPT001', N'9632658745', CAST(0x612B0B00 AS Date), N'B-', N'hkjhl', N'honey', N'cust', N'Hostel')
INSERT [dbo].[Student_Registration] ([Slno], [PK_StudentID], [Name], [DOB], [Gender], [Caste], [FK_DepartmentID], [PhoneNo], [DOJ], [BloodGroup], [Address], [FatherName], [MotherName], [Boarding]) VALUES (54, N'SMS054', N'Balaji', CAST(0x553B0B00 AS Date), N'F', N'MBC', N'DEPT001', N'9867532432', CAST(0x613B0B00 AS Date), N'O+', N'sa', N'sd', N'as', N'Regular')
INSERT [dbo].[Student_Registration] ([Slno], [PK_StudentID], [Name], [DOB], [Gender], [Caste], [FK_DepartmentID], [PhoneNo], [DOJ], [BloodGroup], [Address], [FatherName], [MotherName], [Boarding]) VALUES (55, N'SMS055', N'Vignesh', CAST(0x16310B00 AS Date), N'F', N'MBC', N'DEPT001', N'9454587451', CAST(0x613B0B00 AS Date), N'O+', N'gykhkuy', N'fgjh', N'ghfjgh', N'Hostel')
INSERT [dbo].[Student_Registration] ([Slno], [PK_StudentID], [Name], [DOB], [Gender], [Caste], [FK_DepartmentID], [PhoneNo], [DOJ], [BloodGroup], [Address], [FatherName], [MotherName], [Boarding]) VALUES (56, N'SMS056', N'Prasad', CAST(0x9F320B00 AS Date), N'F', N'MBC', N'DEPT022', N'9642676246', CAST(0xA5390B00 AS Date), N'O-', N'salem', N'dfghdfhf', N'xgvxdgcfhdf', N'Regular')
INSERT [dbo].[Student_Registration] ([Slno], [PK_StudentID], [Name], [DOB], [Gender], [Caste], [FK_DepartmentID], [PhoneNo], [DOJ], [BloodGroup], [Address], [FatherName], [MotherName], [Boarding]) VALUES (57, N'SMS057', N'ela', CAST(0x3E240B00 AS Date), N'F', N'BC', N'DEPT099', N'9354575321', CAST(0x643B0B00 AS Date), N'AB+', N'jhgjh', N'get', N'jgjk', N'Regular')
INSERT [dbo].[Student_Registration] ([Slno], [PK_StudentID], [Name], [DOB], [Gender], [Caste], [FK_DepartmentID], [PhoneNo], [DOJ], [BloodGroup], [Address], [FatherName], [MotherName], [Boarding]) VALUES (58, N'SMS058', N'aravinth', CAST(0x3E240B00 AS Date), N'M', N'MBC', N'DEPT098', N'9246464637', CAST(0x643B0B00 AS Date), N'B-', N'salem', N'karthik', N'malar', N'Regular')
INSERT [dbo].[Student_Registration] ([Slno], [PK_StudentID], [Name], [DOB], [Gender], [Caste], [FK_DepartmentID], [PhoneNo], [DOJ], [BloodGroup], [Address], [FatherName], [MotherName], [Boarding]) VALUES (59, N'SMS059', N'sudHA', CAST(0xA9330B00 AS Date), N'F', N'MBC', N'DEPT001', N'9940923741', CAST(0x6C3B0B00 AS Date), N'O+', N'COIMBATORE', N'LOGANATHAN', N'MALIGA', N'Regular')
INSERT [dbo].[Student_Registration] ([Slno], [PK_StudentID], [Name], [DOB], [Gender], [Caste], [FK_DepartmentID], [PhoneNo], [DOJ], [BloodGroup], [Address], [FatherName], [MotherName], [Boarding]) VALUES (60, N'SMS060', N'Fareen', CAST(0xE0310B00 AS Date), N'F', N'BC', N'DEPT024', N'9424767211', CAST(0x6C3B0B00 AS Date), N'A-', N'Erode', N'Mustaf', N'Monisha', N'Hostel')
INSERT [dbo].[Student_Registration] ([Slno], [PK_StudentID], [Name], [DOB], [Gender], [Caste], [FK_DepartmentID], [PhoneNo], [DOJ], [BloodGroup], [Address], [FatherName], [MotherName], [Boarding]) VALUES (61, N'SMS061', N'Rekha', CAST(0xFF2F0B00 AS Date), N'F', N'OC', N'DEPT027', N'9940923401', CAST(0x683B0B00 AS Date), N'O+', N'salem', N'Kumaran', N'Santhi', N'Regular')
INSERT [dbo].[Student_Registration] ([Slno], [PK_StudentID], [Name], [DOB], [Gender], [Caste], [FK_DepartmentID], [PhoneNo], [DOJ], [BloodGroup], [Address], [FatherName], [MotherName], [Boarding]) VALUES (62, N'SMS062', N'Venkatesh', CAST(0x7E300B00 AS Date), N'M', N'BC', N'DEPT024', N'9456132137', CAST(0x683B0B00 AS Date), N'O-', N'Salem', N'Selva', N'Selvi', N'Regular')
INSERT [dbo].[Student_Registration] ([Slno], [PK_StudentID], [Name], [DOB], [Gender], [Caste], [FK_DepartmentID], [PhoneNo], [DOJ], [BloodGroup], [Address], [FatherName], [MotherName], [Boarding]) VALUES (63, N'SMS063', N'Hari', CAST(0x09260B00 AS Date), N'M', N'MBC', N'DEPT098', N'9865432314', CAST(0x6B3B0B00 AS Date), N'O+', N'vaembadithalam,
dubai', N'dev', N'Devi', N'Regular')
SET IDENTITY_INSERT [dbo].[Student_Registration] OFF
/****** Object:  Table [dbo].[Mark_Entry_Details]    Script Date: 05/31/2016 18:27:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mark_Entry_Details]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Mark_Entry_Details](
	[Slno] [int] IDENTITY(1,1) NOT NULL,
	[FK_StudentID] [varchar](50) NOT NULL,
	[Fk_SubjectID] [varchar](50) NOT NULL,
	[Mark] [decimal](5, 2) NOT NULL,
	[FK_Mark_Entry_Slno] [int] NULL,
 CONSTRAINT [PK_sms_MarkEntryDetails] PRIMARY KEY CLUSTERED 
(
	[Slno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Mark_Entry_Details] ON
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (1, N'SMS043', N'SUB022', CAST(25.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (2, N'SMS043', N'SUB001', CAST(26.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (3, N'SMS060', N'SUB022', CAST(24.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (4, N'SMS060', N'SUB001', CAST(23.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (5, N'SMS062', N'SUB022', CAST(22.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (6, N'SMS062', N'SUB001', CAST(21.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (7, N'SMS046', N'SUB022', CAST(25.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (8, N'SMS046', N'SUB023', CAST(26.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (9, N'SMS046', N'SUB024', CAST(27.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (10, N'SMS046', N'SUB025', CAST(25.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (11, N'SMS046', N'SUB001', CAST(24.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (12, N'SMS054', N'SUB022', CAST(2.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (13, N'SMS054', N'SUB023', CAST(2.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (14, N'SMS054', N'SUB024', CAST(2.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (15, N'SMS054', N'SUB025', CAST(2.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (16, N'SMS054', N'SUB001', CAST(1.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (17, N'SMS028', N'SUB022', CAST(4.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (18, N'SMS028', N'SUB023', CAST(4.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (19, N'SMS028', N'SUB024', CAST(4.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (20, N'SMS028', N'SUB025', CAST(4.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (21, N'SMS028', N'SUB001', CAST(4.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (22, N'SMS010', N'SUB022', CAST(0.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (23, N'SMS010', N'SUB023', CAST(0.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (24, N'SMS010', N'SUB024', CAST(0.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (25, N'SMS010', N'SUB025', CAST(0.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (26, N'SMS010', N'SUB001', CAST(0.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (27, N'SMS013', N'SUB022', CAST(0.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (28, N'SMS013', N'SUB023', CAST(0.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (29, N'SMS013', N'SUB024', CAST(0.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (30, N'SMS013', N'SUB025', CAST(0.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (31, N'SMS013', N'SUB001', CAST(0.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (32, N'SMS045', N'SUB022', CAST(0.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (33, N'SMS045', N'SUB023', CAST(0.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (34, N'SMS045', N'SUB024', CAST(0.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (35, N'SMS045', N'SUB025', CAST(0.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (36, N'SMS045', N'SUB001', CAST(0.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (37, N'SMS059', N'SUB022', CAST(0.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (38, N'SMS059', N'SUB023', CAST(0.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (39, N'SMS059', N'SUB024', CAST(0.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (40, N'SMS059', N'SUB025', CAST(0.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (41, N'SMS059', N'SUB001', CAST(0.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (42, N'SMS047', N'SUB022', CAST(0.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (43, N'SMS047', N'SUB023', CAST(0.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (44, N'SMS047', N'SUB024', CAST(0.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (45, N'SMS047', N'SUB025', CAST(0.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (46, N'SMS047', N'SUB001', CAST(0.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (47, N'SMS055', N'SUB022', CAST(0.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (48, N'SMS055', N'SUB023', CAST(0.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (49, N'SMS055', N'SUB024', CAST(0.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (50, N'SMS055', N'SUB025', CAST(0.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (51, N'SMS055', N'SUB001', CAST(0.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (52, N'SMS044', N'SUB022', CAST(0.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (53, N'SMS044', N'SUB023', CAST(0.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (54, N'SMS044', N'SUB024', CAST(0.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (55, N'SMS044', N'SUB025', CAST(0.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (56, N'SMS044', N'SUB001', CAST(0.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (57, N'SMS048', N'SUB022', CAST(0.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (58, N'SMS048', N'SUB023', CAST(0.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (59, N'SMS048', N'SUB024', CAST(0.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (60, N'SMS048', N'SUB025', CAST(0.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (61, N'SMS048', N'SUB001', CAST(0.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (62, N'SMS046', N'SUB022', CAST(56.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (63, N'SMS046', N'SUB023', CAST(46.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (64, N'SMS046', N'SUB024', CAST(36.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (65, N'SMS046', N'SUB025', CAST(86.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (66, N'SMS046', N'SUB001', CAST(76.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (67, N'SMS054', N'SUB022', CAST(8.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (68, N'SMS054', N'SUB023', CAST(9.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (69, N'SMS054', N'SUB024', CAST(6.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (70, N'SMS054', N'SUB025', CAST(5.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (71, N'SMS054', N'SUB001', CAST(4.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (72, N'SMS028', N'SUB022', CAST(1.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (73, N'SMS028', N'SUB023', CAST(2.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (74, N'SMS028', N'SUB024', CAST(3.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (75, N'SMS028', N'SUB025', CAST(7.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (76, N'SMS028', N'SUB001', CAST(8.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (77, N'SMS010', N'SUB022', CAST(9.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (78, N'SMS010', N'SUB023', CAST(4.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (79, N'SMS010', N'SUB024', CAST(5.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (80, N'SMS010', N'SUB025', CAST(6.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (81, N'SMS010', N'SUB001', CAST(1.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (82, N'SMS013', N'SUB022', CAST(2.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (83, N'SMS013', N'SUB023', CAST(3.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (84, N'SMS013', N'SUB024', CAST(7.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (85, N'SMS013', N'SUB025', CAST(8.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (86, N'SMS013', N'SUB001', CAST(9.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (87, N'SMS045', N'SUB022', CAST(4.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (88, N'SMS045', N'SUB023', CAST(5.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (89, N'SMS045', N'SUB024', CAST(6.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (90, N'SMS045', N'SUB025', CAST(1.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (91, N'SMS045', N'SUB001', CAST(0.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (92, N'SMS059', N'SUB022', CAST(0.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (93, N'SMS059', N'SUB023', CAST(0.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (94, N'SMS059', N'SUB024', CAST(0.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (95, N'SMS059', N'SUB025', CAST(2.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (96, N'SMS059', N'SUB001', CAST(3.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (97, N'SMS047', N'SUB022', CAST(0.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (98, N'SMS047', N'SUB023', CAST(0.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (99, N'SMS047', N'SUB024', CAST(0.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (100, N'SMS047', N'SUB025', CAST(0.00 AS Decimal(5, 2)), 3)
GO
print 'Processed 100 total records'
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (101, N'SMS047', N'SUB001', CAST(0.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (102, N'SMS055', N'SUB022', CAST(0.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (103, N'SMS055', N'SUB023', CAST(0.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (104, N'SMS055', N'SUB024', CAST(0.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (105, N'SMS055', N'SUB025', CAST(0.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (106, N'SMS055', N'SUB001', CAST(0.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (107, N'SMS044', N'SUB022', CAST(0.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (108, N'SMS044', N'SUB023', CAST(0.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (109, N'SMS044', N'SUB024', CAST(0.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (110, N'SMS044', N'SUB025', CAST(0.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (111, N'SMS044', N'SUB001', CAST(0.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (112, N'SMS048', N'SUB022', CAST(0.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (113, N'SMS048', N'SUB023', CAST(0.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (114, N'SMS048', N'SUB024', CAST(0.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (115, N'SMS048', N'SUB025', CAST(0.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (116, N'SMS048', N'SUB001', CAST(0.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (117, N'SMS046', N'SUB022', CAST(0.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (118, N'SMS046', N'SUB023', CAST(0.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (119, N'SMS046', N'SUB024', CAST(0.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (120, N'SMS046', N'SUB025', CAST(0.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (121, N'SMS046', N'SUB001', CAST(0.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (122, N'SMS054', N'SUB022', CAST(0.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (123, N'SMS054', N'SUB023', CAST(0.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (124, N'SMS054', N'SUB024', CAST(0.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (125, N'SMS054', N'SUB025', CAST(0.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (126, N'SMS054', N'SUB001', CAST(0.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (127, N'SMS028', N'SUB022', CAST(0.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (128, N'SMS028', N'SUB023', CAST(0.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (129, N'SMS028', N'SUB024', CAST(0.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (130, N'SMS028', N'SUB025', CAST(0.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (131, N'SMS028', N'SUB001', CAST(0.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (132, N'SMS010', N'SUB022', CAST(0.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (133, N'SMS010', N'SUB023', CAST(0.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (134, N'SMS010', N'SUB024', CAST(0.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (135, N'SMS010', N'SUB025', CAST(0.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (136, N'SMS010', N'SUB001', CAST(0.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (137, N'SMS013', N'SUB022', CAST(0.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (138, N'SMS013', N'SUB023', CAST(0.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (139, N'SMS013', N'SUB024', CAST(0.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (140, N'SMS013', N'SUB025', CAST(0.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (141, N'SMS013', N'SUB001', CAST(0.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (142, N'SMS045', N'SUB022', CAST(77.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (143, N'SMS045', N'SUB023', CAST(77.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (144, N'SMS045', N'SUB024', CAST(0.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (145, N'SMS045', N'SUB025', CAST(77.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (146, N'SMS045', N'SUB001', CAST(58.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (147, N'SMS059', N'SUB022', CAST(88.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (148, N'SMS059', N'SUB023', CAST(22.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (149, N'SMS059', N'SUB024', CAST(0.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (150, N'SMS059', N'SUB025', CAST(77.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (151, N'SMS059', N'SUB001', CAST(77.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (152, N'SMS047', N'SUB022', CAST(0.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (153, N'SMS047', N'SUB023', CAST(71.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (154, N'SMS047', N'SUB024', CAST(96.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (155, N'SMS047', N'SUB025', CAST(0.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (156, N'SMS047', N'SUB001', CAST(0.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (157, N'SMS055', N'SUB022', CAST(0.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (158, N'SMS055', N'SUB023', CAST(0.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (159, N'SMS055', N'SUB024', CAST(0.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (160, N'SMS055', N'SUB025', CAST(0.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (161, N'SMS055', N'SUB001', CAST(0.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (162, N'SMS044', N'SUB022', CAST(0.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (163, N'SMS044', N'SUB023', CAST(0.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (164, N'SMS044', N'SUB024', CAST(0.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (165, N'SMS044', N'SUB025', CAST(0.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (166, N'SMS044', N'SUB001', CAST(0.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (167, N'SMS048', N'SUB022', CAST(0.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (168, N'SMS048', N'SUB023', CAST(0.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (169, N'SMS048', N'SUB024', CAST(0.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (170, N'SMS048', N'SUB025', CAST(0.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (171, N'SMS048', N'SUB001', CAST(0.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (172, N'SMS057', N'SUB027', CAST(100.00 AS Decimal(5, 2)), 5)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (173, N'SMS057', N'SUB028', CAST(110.00 AS Decimal(5, 2)), 5)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (174, N'SMS057', N'SUB022', CAST(111.00 AS Decimal(5, 2)), 5)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (175, N'SMS057', N'SUB023', CAST(111.00 AS Decimal(5, 2)), 5)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (176, N'SMS057', N'SUB039', CAST(111.00 AS Decimal(5, 2)), 5)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (177, N'SMS057', N'SUB024', CAST(111.00 AS Decimal(5, 2)), 5)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (178, N'SMS057', N'SUB025', CAST(111.00 AS Decimal(5, 2)), 5)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (179, N'SMS057', N'SUB001', CAST(111.00 AS Decimal(5, 2)), 5)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (180, N'SMS038', N'SUB022', CAST(25.00 AS Decimal(5, 2)), 6)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (181, N'SMS038', N'SUB023', CAST(25.00 AS Decimal(5, 2)), 6)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (182, N'SMS038', N'SUB001', CAST(2.00 AS Decimal(5, 2)), 6)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (183, N'SMS042', N'SUB022', CAST(55.00 AS Decimal(5, 2)), 6)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (184, N'SMS042', N'SUB023', CAST(25.00 AS Decimal(5, 2)), 6)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (185, N'SMS042', N'SUB001', CAST(2.00 AS Decimal(5, 2)), 6)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (186, N'SMS056', N'SUB022', CAST(52.00 AS Decimal(5, 2)), 6)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (187, N'SMS056', N'SUB023', CAST(21.00 AS Decimal(5, 2)), 6)
INSERT [dbo].[Mark_Entry_Details] ([Slno], [FK_StudentID], [Fk_SubjectID], [Mark], [FK_Mark_Entry_Slno]) VALUES (188, N'SMS056', N'SUB001', CAST(4.00 AS Decimal(5, 2)), 6)
SET IDENTITY_INSERT [dbo].[Mark_Entry_Details] OFF
/****** Object:  Table [dbo].[Mark_Entry]    Script Date: 05/31/2016 18:27:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mark_Entry]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Mark_Entry](
	[Slno] [int] IDENTITY(1,1) NOT NULL,
	[Fk_DepatmentID] [varchar](50) NOT NULL,
	[Fk_Exam_Slno] [int] NOT NULL,
	[Exm_Year] [int] NOT NULL,
 CONSTRAINT [PK_Mark_Entry] PRIMARY KEY CLUSTERED 
(
	[Slno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Mark_Entry] ON
INSERT [dbo].[Mark_Entry] ([Slno], [Fk_DepatmentID], [Fk_Exam_Slno], [Exm_Year]) VALUES (1, N'DEPT024', 1, 2016)
INSERT [dbo].[Mark_Entry] ([Slno], [Fk_DepatmentID], [Fk_Exam_Slno], [Exm_Year]) VALUES (2, N'DEPT001', 1, 2016)
INSERT [dbo].[Mark_Entry] ([Slno], [Fk_DepatmentID], [Fk_Exam_Slno], [Exm_Year]) VALUES (3, N'DEPT001', 1, 2017)
INSERT [dbo].[Mark_Entry] ([Slno], [Fk_DepatmentID], [Fk_Exam_Slno], [Exm_Year]) VALUES (4, N'DEPT001', 2, 2016)
INSERT [dbo].[Mark_Entry] ([Slno], [Fk_DepatmentID], [Fk_Exam_Slno], [Exm_Year]) VALUES (5, N'DEPT099', 4, 2016)
INSERT [dbo].[Mark_Entry] ([Slno], [Fk_DepatmentID], [Fk_Exam_Slno], [Exm_Year]) VALUES (6, N'DEPT022', 4, 2016)
SET IDENTITY_INSERT [dbo].[Mark_Entry] OFF
/****** Object:  Table [dbo].[subject_Mapping]    Script Date: 05/31/2016 18:27:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[subject_Mapping]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[subject_Mapping](
	[Pk_subjectmappingID] [int] IDENTITY(1,1) NOT NULL,
	[Fk_DepartmentID] [varchar](50) NOT NULL,
	[FK_SubjectID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_sms_subjectmapping] PRIMARY KEY CLUSTERED 
(
	[Pk_subjectmappingID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[subject_Mapping] ON
INSERT [dbo].[subject_Mapping] ([Pk_subjectmappingID], [Fk_DepartmentID], [FK_SubjectID]) VALUES (1, N'DEPT001', N'SUB001')
INSERT [dbo].[subject_Mapping] ([Pk_subjectmappingID], [Fk_DepartmentID], [FK_SubjectID]) VALUES (7, N'DEPT022', N'SUB001')
INSERT [dbo].[subject_Mapping] ([Pk_subjectmappingID], [Fk_DepartmentID], [FK_SubjectID]) VALUES (8, N'DEPT022', N'SUB022')
INSERT [dbo].[subject_Mapping] ([Pk_subjectmappingID], [Fk_DepartmentID], [FK_SubjectID]) VALUES (9, N'DEPT022', N'SUB023')
INSERT [dbo].[subject_Mapping] ([Pk_subjectmappingID], [Fk_DepartmentID], [FK_SubjectID]) VALUES (10, N'DEPT024', N'SUB001')
INSERT [dbo].[subject_Mapping] ([Pk_subjectmappingID], [Fk_DepartmentID], [FK_SubjectID]) VALUES (11, N'DEPT024', N'SUB022')
INSERT [dbo].[subject_Mapping] ([Pk_subjectmappingID], [Fk_DepartmentID], [FK_SubjectID]) VALUES (15, N'DEPT001', N'SUB022')
INSERT [dbo].[subject_Mapping] ([Pk_subjectmappingID], [Fk_DepartmentID], [FK_SubjectID]) VALUES (16, N'DEPT001', N'SUB023')
INSERT [dbo].[subject_Mapping] ([Pk_subjectmappingID], [Fk_DepartmentID], [FK_SubjectID]) VALUES (17, N'DEPT001', N'SUB024')
INSERT [dbo].[subject_Mapping] ([Pk_subjectmappingID], [Fk_DepartmentID], [FK_SubjectID]) VALUES (18, N'DEPT001', N'SUB025')
INSERT [dbo].[subject_Mapping] ([Pk_subjectmappingID], [Fk_DepartmentID], [FK_SubjectID]) VALUES (19, N'DEPT099', N'SUB001')
INSERT [dbo].[subject_Mapping] ([Pk_subjectmappingID], [Fk_DepartmentID], [FK_SubjectID]) VALUES (20, N'DEPT099', N'SUB022')
INSERT [dbo].[subject_Mapping] ([Pk_subjectmappingID], [Fk_DepartmentID], [FK_SubjectID]) VALUES (21, N'DEPT099', N'SUB023')
INSERT [dbo].[subject_Mapping] ([Pk_subjectmappingID], [Fk_DepartmentID], [FK_SubjectID]) VALUES (22, N'DEPT099', N'SUB024')
INSERT [dbo].[subject_Mapping] ([Pk_subjectmappingID], [Fk_DepartmentID], [FK_SubjectID]) VALUES (23, N'DEPT099', N'SUB025')
INSERT [dbo].[subject_Mapping] ([Pk_subjectmappingID], [Fk_DepartmentID], [FK_SubjectID]) VALUES (24, N'DEPT099', N'SUB027')
INSERT [dbo].[subject_Mapping] ([Pk_subjectmappingID], [Fk_DepartmentID], [FK_SubjectID]) VALUES (25, N'DEPT099', N'SUB028')
INSERT [dbo].[subject_Mapping] ([Pk_subjectmappingID], [Fk_DepartmentID], [FK_SubjectID]) VALUES (26, N'DEPT099', N'SUB039')
SET IDENTITY_INSERT [dbo].[subject_Mapping] OFF
/****** Object:  StoredProcedure [dbo].[gridlistpage]    Script Date: 05/31/2016 18:27:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[gridlistpage]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<ilavarasan>
-- Create date: <31/5/16>
-- Description:	<Sample pagnation for project >
-- =============================================
CREATE PROCEDURE [dbo].[gridlistpage] 
	
	@PageSize INT,
        @Page INT
AS
BEGIN


	SET NOCOUNT ON;
	SELECT COUNT(*)			
	FROM   dbo.Student_Registration 
	
  ; WITH PageNumbers AS (
		SELECT ROW_NUMBER() OVER(ORDER BY a.slno) AS NUMBER,
		a.Slno,a.Name,a.Gender,a.Boarding  FROM dbo.Student_Registration as a
 ) 	
	SELECT  *
	FROM    PageNumbers
	WHERE NUMBER  BETWEEN ((@Page - 1) * @PageSize + 1)
			AND (@Page * @PageSize)
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[GET_subject_ID]    Script Date: 05/31/2016 18:27:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GET_subject_ID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'create FUNCTION [dbo].[GET_subject_ID]
(
	
)
RETURNS VARCHAR(10)
AS
BEGIN
	DECLARE @ID AS VARCHAR(50) 
	
	DECLARE @REC_COUNT AS INT
	DECLARE @PREFIX AS VARCHAR(50)
	SET @PREFIX = ''SUB''	
	SELECT @REC_COUNT = ISNULL(MAX(Slno),0) + 1 FROM dbo.Subject_Entry
		
	SELECT
		@ID = @PREFIX  + 
		(CASE 
			WHEN LEN(@REC_COUNT) = 1 THEN ''00''
		ELSE
			CASE 
				WHEN LEN(@REC_COUNT) = 2 THEN ''0''
			ELSE
				''''
			END
		END) + CAST(@REC_COUNT as VARCHAR(20))
	RETURN @ID
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[GET_STUDENT_ID]    Script Date: 05/31/2016 18:27:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GET_STUDENT_ID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Prabakaran
-- Create date: 04-05-2016
-- Description:	Genrate Next Department ID
-- =============================================
CREATE FUNCTION [dbo].[GET_STUDENT_ID]
(
	
)
RETURNS VARCHAR(10)
AS
BEGIN
	DECLARE @ID AS VARCHAR(50) 
	
	DECLARE @REC_COUNT AS INT
	DECLARE @PREFIX AS VARCHAR(50)
	SET @PREFIX = ''SMS''	
	SELECT @REC_COUNT = ISNULL(MAX(Slno),0) + 1 FROM Student_Registration
		
	SELECT
		@ID = @PREFIX  + 
		(CASE 
			WHEN LEN(@REC_COUNT) = 1 THEN ''00''
		ELSE
			CASE 
				WHEN LEN(@REC_COUNT) = 2 THEN ''0''
			ELSE
				''''
			END
		END) + CAST(@REC_COUNT as VARCHAR(20))
	RETURN @ID
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[GET_Department_ID]    Script Date: 05/31/2016 18:27:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GET_Department_ID]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[GET_Department_ID]
(
	
)
RETURNS VARCHAR(10)
AS
BEGIN
	DECLARE @ID AS VARCHAR(50) 
	
	DECLARE @REC_COUNT AS INT
	DECLARE @PREFIX AS VARCHAR(50)
	SET @PREFIX = ''DEPT''	
	SELECT @REC_COUNT = ISNULL(MAX(Slno),0) + 1 FROM Department_Entry
		
	SELECT
		@ID = @PREFIX  + 
		(CASE 
			WHEN LEN(@REC_COUNT) = 1 THEN ''00''
		ELSE
			CASE 
				WHEN LEN(@REC_COUNT) = 2 THEN ''0''
			ELSE
				''''
			END
		END) + CAST(@REC_COUNT as VARCHAR(20))
	RETURN @ID
END
' 
END
GO
/****** Object:  View [dbo].[Vu_Studt_Dep]    Script Date: 05/31/2016 18:27:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Vu_Studt_Dep]'))
EXEC dbo.sp_executesql @statement = N'create View [dbo].[Vu_Studt_Dep] as
select Stu.PK_StudentID,Stu.Name, Dep.Pk_DepartmentID,Dep.Department_Name from Student_Registration
as Stu join Department_Entry as Dep on Stu.FK_DepartmentID=Dep.Pk_DepartmentID'
GO
/****** Object:  StoredProcedure [dbo].[usp_Mark_Entry_Report]    Script Date: 05/31/2016 18:27:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Mark_Entry_Report]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================  
-- Author:  <Author,,Name>  
-- Create date: <Create Date,,>  
-- Description: <Description,,>  
-- =============================================  
-- EXEC usp_Mark_Entry ''DEPT001'', 1, 2016  
CREATE PROCEDURE [dbo].[usp_Mark_Entry_Report]   
 @Dept_ID AS VARCHAR(10), @Exam_Slno AS INT, @Exm_Year AS INT  
AS  
BEGIN  
 SET NOCOUNT ON;  
SELECT   STU.Name Student_Name,STU.PK_StudentID Student_ID,REPLACE(Sub.Subject_Name, '' '' , ''-'') Subject_Name,   
SUB.PK_SubjectID Subject_ID,ISNULL(CAST(MED.Slno AS VARCHAR(5)), '''') Mark_Detail_Slno,ISNULL(MED.Mark, 0.00) Mark  
From Student_RegistratiON AS STU  
JOIN Department_Entry AS DEP ON   DEP.Pk_DepartmentID = STU.Fk_departmentId  
JOIN subject_Mapping AS MAP ON   DEP.Pk_DepartmentID = MAP.Fk_DepartmentID   
JOIN Subject_Entry AS SUB ON   SUB.PK_SubjectID = MAP.FK_SubjectID   
Inner JOIN dbo.Mark_Entry ME ON   ME.Fk_DepatmentID = MAP.Fk_DepartmentID AND  ME.Fk_Exam_Slno = @Exam_Slno And ME.Exm_Year = @Exm_Year 
Inner JOIN dbo.Mark_Entry_Details MED ON  MED.FK_Mark_Entry_Slno = ME.Slno AND  MED.Fk_SubjectID = SUB.PK_SubjectID AND  MED.FK_StudentID = STU.PK_StudentID  
WHERE DEP.Pk_DepartmentID = @Dept_ID  
ORDER BY Student_Name, PK_StudentID, Subject_Name  
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Mark_Entry]    Script Date: 05/31/2016 18:27:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Mark_Entry]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================  
-- Author:  <Author,,Name>  
-- Create date: <Create Date,,>  
-- Description: <Description,,>  
-- =============================================  
-- EXEC usp_Mark_Entry ''DEPT001'', 1, 2016  
CREATE PROCEDURE [dbo].[usp_Mark_Entry]   
 @Dept_ID AS VARCHAR(10), @Exam_Slno AS INT, @Exm_Year AS INT  
AS  
BEGIN  
 SET NOCOUNT ON;  
	SELECT   
		STU.Name Student_Name,
		REPLACE(Sub.Subject_Name, '' '' , ''-'') Subject_Name,   
		ISNULL(MED.Mark, 0.00) Mark,
		STU.PK_StudentID Student_ID,
		SUB.PK_SubjectID Subject_ID,
		ISNULL(CAST(MED.Slno AS VARCHAR(5)), '''') Mark_Detail_Slno
	From Student_RegistratiON AS STU  
	JOIN Department_Entry AS DEP ON   DEP.Pk_DepartmentID = STU.Fk_departmentId  
	JOIN subject_Mapping AS MAP ON   DEP.Pk_DepartmentID = MAP.Fk_DepartmentID   
	JOIN Subject_Entry AS SUB ON   SUB.PK_SubjectID = MAP.FK_SubjectID   
	LEFT JOIN dbo.Mark_Entry ME ON   ME.Fk_DepatmentID = MAP.Fk_DepartmentID AND  ME.Fk_Exam_Slno = @Exam_Slno And ME.Exm_Year = @Exm_Year 
	LEFT JOIN dbo.Mark_Entry_Details MED ON  MED.FK_Mark_Entry_Slno = ME.Slno AND  MED.Fk_SubjectID = SUB.PK_SubjectID AND  MED.FK_StudentID = STU.PK_StudentID  
	WHERE DEP.Pk_DepartmentID = @Dept_ID  
	ORDER BY Student_Name, PK_StudentID, Subject_Name  
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[subjectname]    Script Date: 05/31/2016 18:27:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[subjectname]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
-- exec dbo.subjectname ''DEPT001'', ''1''
CREATE PROCEDURE [dbo].[subjectname]
	-- Add the parameters for the stored procedure here
	@Dep_ID as NVARCHAR(10), @Exm_Slno as NVARCHAR(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @cols AS NVARCHAR(MAX),  @query  AS NVARCHAR(MAX)
	
	Set @cols	 = STUFF(
							(
								SELECT '','' + QUOTENAME(REPLACE(Sub.Subject_Name, '' '' , ''_'') + ''-'' + Sub.PK_SubjectID) 
										from subject_Mapping as Map
										join Subject_Entry as Sub on Sub.PK_SubjectID = Map.FK_SubjectID 
										Where Map.Fk_DepartmentID = @Dep_ID
										GROUP BY Sub.Subject_Name, Sub.PK_SubjectID
								FOR XML PATH(''''), TYPE
							).value(''.'', ''NVARCHAR(MAX)'') 
					,1,1, '''')
	print @cols
	
	set @query= N''
	Select * From 
	(
		select 
			'''''''' Me_Slno, stu.Name, stu.PK_StudentID, REPLACE(Sub.Subject_Name, '''' '''' , ''''_'''') + ''''-'''' + Sub.PK_SubjectID Subject_Name + ''''-'''' + convert(varchar(10), isnull(med.Slno,0)), isnull(Med.Mark, 0.00) Mark
		from Student_Registration as stu 
		join Department_Entry as dep on dep.Pk_DepartmentID = stu.Fk_departmentId
		join subject_Mapping as Map on dep.Pk_DepartmentID = Map.Fk_DepartmentID 
		join Subject_Entry as Sub on Sub.PK_SubjectID = Map.FK_SubjectID 
		Left Join dbo.Mark_Entry Me on Me.Fk_DepatmentID = Map.Fk_DepartmentID
			And me.Fk_Exam_Slno = ''+@Exm_Slno+''
		Left Join dbo.Mark_Entry_Details Med on Med.FK_Mark_Entry_Slno = Me.Slno
			And Med.Fk_SubjectID = Sub.PK_SubjectID And Med.FK_StudentID = stu.PK_StudentID
		where dep.Pk_DepartmentID = ''''''+@Dep_ID+''''''
	)x
	PIVOT
	(
		Sum(Mark)
		FOR Subject_Name IN (''+@cols+'')
	) AS PVTTable''
	print @query
	exec sp_executesql @query;
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[Department_Efficiency]    Script Date: 05/31/2016 18:27:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Department_Efficiency]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<ilavarasan>
-- Create date: <18/05/16>
-- Description:	<Department Efficieny percentage calculation,>
-- =============================================

CREATE FUNCTION [dbo].[Department_Efficiency]
(	
	
	
	@Examname as varchar(30),@Exmyear as int
)
RETURNS TABLE 
AS
RETURN 
(
	select de.Department_Name,cast(round((SUM(med.mark)/COUNT(se.name)),2)as decimal(18,2))as percentage 
	from Mark_Entry_Details as med 
	join Mark_Entry as me on med.FK_Mark_Entry_Slno=me.Slno
	join Exam_Entry as ee on ee.Slno= me.Fk_Exam_Slno 
	join Student_Registration as se on se.PK_StudentID =med.FK_StudentID 
	join Department_Entry as de on de.Pk_DepartmentID=se.FK_DepartmentID
	 and  ee.Exam_Name=@Examname and me.Exm_Year=@Exmyear 
group by  de.Department_Name
)
' 
END
GO
/****** Object:  ForeignKey [FK_Mark_Entry_Department_Entry]    Script Date: 05/31/2016 18:27:40 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Mark_Entry_Department_Entry]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mark_Entry]'))
ALTER TABLE [dbo].[Mark_Entry]  WITH CHECK ADD  CONSTRAINT [FK_Mark_Entry_Department_Entry] FOREIGN KEY([Fk_DepatmentID])
REFERENCES [dbo].[Department_Entry] ([Pk_DepartmentID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Mark_Entry_Department_Entry]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mark_Entry]'))
ALTER TABLE [dbo].[Mark_Entry] CHECK CONSTRAINT [FK_Mark_Entry_Department_Entry]
GO
/****** Object:  ForeignKey [FK_Mark_Entry_Exam_Entry]    Script Date: 05/31/2016 18:27:40 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Mark_Entry_Exam_Entry]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mark_Entry]'))
ALTER TABLE [dbo].[Mark_Entry]  WITH CHECK ADD  CONSTRAINT [FK_Mark_Entry_Exam_Entry] FOREIGN KEY([Fk_Exam_Slno])
REFERENCES [dbo].[Exam_Entry] ([Slno])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Mark_Entry_Exam_Entry]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mark_Entry]'))
ALTER TABLE [dbo].[Mark_Entry] CHECK CONSTRAINT [FK_Mark_Entry_Exam_Entry]
GO
/****** Object:  ForeignKey [Fk_studentid map from student reg]    Script Date: 05/31/2016 18:27:40 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Fk_studentid map from student reg]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mark_Entry_Details]'))
ALTER TABLE [dbo].[Mark_Entry_Details]  WITH CHECK ADD  CONSTRAINT [Fk_studentid map from student reg] FOREIGN KEY([FK_StudentID])
REFERENCES [dbo].[Student_Registration] ([PK_StudentID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Fk_studentid map from student reg]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mark_Entry_Details]'))
ALTER TABLE [dbo].[Mark_Entry_Details] CHECK CONSTRAINT [Fk_studentid map from student reg]
GO
/****** Object:  ForeignKey [Fk_subject id map from subject]    Script Date: 05/31/2016 18:27:40 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Fk_subject id map from subject]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mark_Entry_Details]'))
ALTER TABLE [dbo].[Mark_Entry_Details]  WITH CHECK ADD  CONSTRAINT [Fk_subject id map from subject] FOREIGN KEY([Fk_SubjectID])
REFERENCES [dbo].[Subject_Entry] ([PK_SubjectID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Fk_subject id map from subject]') AND parent_object_id = OBJECT_ID(N'[dbo].[Mark_Entry_Details]'))
ALTER TABLE [dbo].[Mark_Entry_Details] CHECK CONSTRAINT [Fk_subject id map from subject]
GO
/****** Object:  ForeignKey [FK_sms_subject_Mapping_Sms_department_Entry]    Script Date: 05/31/2016 18:27:40 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sms_subject_Mapping_Sms_department_Entry]') AND parent_object_id = OBJECT_ID(N'[dbo].[subject_Mapping]'))
ALTER TABLE [dbo].[subject_Mapping]  WITH CHECK ADD  CONSTRAINT [FK_sms_subject_Mapping_Sms_department_Entry] FOREIGN KEY([Fk_DepartmentID])
REFERENCES [dbo].[Department_Entry] ([Pk_DepartmentID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sms_subject_Mapping_Sms_department_Entry]') AND parent_object_id = OBJECT_ID(N'[dbo].[subject_Mapping]'))
ALTER TABLE [dbo].[subject_Mapping] CHECK CONSTRAINT [FK_sms_subject_Mapping_Sms_department_Entry]
GO
/****** Object:  ForeignKey [FK_sms_subject_Mapping_Sms_Subject_Entry2]    Script Date: 05/31/2016 18:27:40 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sms_subject_Mapping_Sms_Subject_Entry2]') AND parent_object_id = OBJECT_ID(N'[dbo].[subject_Mapping]'))
ALTER TABLE [dbo].[subject_Mapping]  WITH CHECK ADD  CONSTRAINT [FK_sms_subject_Mapping_Sms_Subject_Entry2] FOREIGN KEY([FK_SubjectID])
REFERENCES [dbo].[Subject_Entry] ([PK_SubjectID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sms_subject_Mapping_Sms_Subject_Entry2]') AND parent_object_id = OBJECT_ID(N'[dbo].[subject_Mapping]'))
ALTER TABLE [dbo].[subject_Mapping] CHECK CONSTRAINT [FK_sms_subject_Mapping_Sms_Subject_Entry2]
GO
