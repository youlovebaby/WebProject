USE [master]
GO
/****** Object:  Database [RepositoryDB]    Script Date: 03/09/2014 13:30:11 ******/
CREATE DATABASE [RepositoryDB] ON  PRIMARY 
( NAME = N'RepositoryDB', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\RepositoryDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'RepositoryDB_log', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\RepositoryDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [RepositoryDB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RepositoryDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RepositoryDB] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [RepositoryDB] SET ANSI_NULLS OFF
GO
ALTER DATABASE [RepositoryDB] SET ANSI_PADDING OFF
GO
ALTER DATABASE [RepositoryDB] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [RepositoryDB] SET ARITHABORT OFF
GO
ALTER DATABASE [RepositoryDB] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [RepositoryDB] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [RepositoryDB] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [RepositoryDB] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [RepositoryDB] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [RepositoryDB] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [RepositoryDB] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [RepositoryDB] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [RepositoryDB] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [RepositoryDB] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [RepositoryDB] SET  DISABLE_BROKER
GO
ALTER DATABASE [RepositoryDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [RepositoryDB] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [RepositoryDB] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [RepositoryDB] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [RepositoryDB] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [RepositoryDB] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [RepositoryDB] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [RepositoryDB] SET  READ_WRITE
GO
ALTER DATABASE [RepositoryDB] SET RECOVERY FULL
GO
ALTER DATABASE [RepositoryDB] SET  MULTI_USER
GO
ALTER DATABASE [RepositoryDB] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [RepositoryDB] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'RepositoryDB', N'ON'
GO
USE [RepositoryDB]
GO
/****** Object:  Table [dbo].[user]    Script Date: 03/09/2014 13:30:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[user](
	[user_id] [char](12) NOT NULL,
	[role_code] [int] NOT NULL,
	[password] [varchar](20) NOT NULL,
	[is_teachingAdministrator] [bit] NOT NULL,
	[is_departmentHead] [bit] NOT NULL,
	[is_systemAdministrator] [bit] NOT NULL,
 CONSTRAINT [PK_USER] PRIMARY KEY NONCLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [Role_User_FK] ON [dbo].[user] 
(
	[role_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[testrecord]    Script Date: 03/09/2014 13:30:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[testrecord](
	[curriculum_code] [bigint] NOT NULL,
	[number] [bigint] NOT NULL,
	[user_id] [char](12) NOT NULL,
	[test_code] [int] NOT NULL,
	[test_date] [datetime] NULL,
	[start _ime] [datetime] NULL,
	[end_time] [datetime] NULL,
 CONSTRAINT [PK_TESTRECORD] PRIMARY KEY NONCLUSTERED 
(
	[curriculum_code] ASC,
	[number] ASC,
	[user_id] ASC,
	[test_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [TestCode_TestRecord_FK] ON [dbo].[testrecord] 
(
	[curriculum_code] ASC,
	[number] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [TestRecord -Student_FK] ON [dbo].[testrecord] 
(
	[user_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[testcustomize]    Script Date: 03/09/2014 13:30:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[testcustomize](
	[curriculum_code] [bigint] NOT NULL,
	[number] [bigint] NOT NULL,
	[qt_code] [int] NOT NULL,
	[qusetion_code] [int] NOT NULL,
	[question_score] [int] NOT NULL,
	[question_num] [int] NOT NULL,
	[question_allscore] [int] NOT NULL,
 CONSTRAINT [PK_TESTCUSTOMIZE] PRIMARY KEY CLUSTERED 
(
	[curriculum_code] ASC,
	[number] ASC,
	[qt_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [TestCode_Customize_FK] ON [dbo].[testcustomize] 
(
	[curriculum_code] ASC,
	[number] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [TestQuestion_TestCustomize_FK] ON [dbo].[testcustomize] 
(
	[qt_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[testcode]    Script Date: 03/09/2014 13:30:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[testcode](
	[curriculum_code] [bigint] NOT NULL,
	[number] [bigint] NOT NULL,
	[title] [varchar](40) NULL,
	[create_date] [datetime] NOT NULL,
	[modify_date] [datetime] NOT NULL,
	[start] [int] NULL,
	[end] [int] NULL,
 CONSTRAINT [PK_TESTCODE] PRIMARY KEY NONCLUSTERED 
(
	[curriculum_code] ASC,
	[number] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [Curriculum_TestCode_FK] ON [dbo].[testcode] 
(
	[curriculum_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tesquestion]    Script Date: 03/09/2014 13:30:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tesquestion](
	[qt_code] [int] NOT NULL,
	[curriculum_code] [bigint] NOT NULL,
	[tq_id] [bigint] NOT NULL,
	[introduction] [text] NULL,
	[chapter] [int] NOT NULL,
	[objective_answer] [varchar](2) NULL,
	[answer] [text] NULL,
 CONSTRAINT [PK_TESQUESTION] PRIMARY KEY NONCLUSTERED 
(
	[qt_code] ASC,
	[curriculum_code] ASC,
	[tq_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [Curriculum_TestQuestion_FK] ON [dbo].[tesquestion] 
(
	[curriculum_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [QuestionTypes_TestQuestion_FK] ON [dbo].[tesquestion] 
(
	[qt_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[technicalpost]    Script Date: 03/09/2014 13:30:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[technicalpost](
	[technical_code] [int] NOT NULL,
	[technical_name] [varchar](20) NOT NULL,
 CONSTRAINT [PK_TECHNICALPOST] PRIMARY KEY NONCLUSTERED 
(
	[technical_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[teachingvideotape]    Script Date: 03/09/2014 13:30:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[teachingvideotape](
	[curriculum_code] [bigint] NOT NULL,
	[filename] [varchar](20) NULL,
	[location] [varchar](100) NULL,
 CONSTRAINT [PK_TEACHINGVIDEOTAPE] PRIMARY KEY CLUSTERED 
(
	[curriculum_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[teachingdata]    Script Date: 03/09/2014 13:30:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[teachingdata](
	[curriculum_code] [bigint] NOT NULL,
	[filename] [varchar](20) NULL,
	[location] [varchar](100) NULL,
 CONSTRAINT [PK_TEACHINGDATA] PRIMARY KEY CLUSTERED 
(
	[curriculum_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[teaching]    Script Date: 03/09/2014 13:30:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[teaching](
	[user_id] [char](12) NOT NULL,
	[curriculum_code] [bigint] NOT NULL,
 CONSTRAINT [PK_TEACHING] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC,
	[curriculum_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [Teaching_FK] ON [dbo].[teaching] 
(
	[user_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Teaching2_FK] ON [dbo].[teaching] 
(
	[curriculum_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[teacherinfor]    Script Date: 03/09/2014 13:30:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[teacherinfor](
	[user_id] [char](12) NOT NULL,
	[technical_code] [int] NOT NULL,
	[tc_code] [int] NOT NULL,
	[role_code] [int] NULL,
	[password] [varchar](20) NOT NULL,
	[is_teachingAdministrator] [bit] NOT NULL,
	[is_departmentHead] [bit] NOT NULL,
	[is_systemAdministrator] [bit] NOT NULL,
	[teacher_name] [varchar](20) NOT NULL,
	[teacher_sex] [bit] NOT NULL,
	[teacher_date] [datetime] NULL,
 CONSTRAINT [PK_TEACHERINFOR] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [Teacher_Character_FK] ON [dbo].[teacherinfor] 
(
	[tc_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Teacher_Post_FK] ON [dbo].[teacherinfor] 
(
	[technical_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[teachercharacter]    Script Date: 03/09/2014 13:30:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[teachercharacter](
	[tc_code] [int] NOT NULL,
	[tc_name] [varchar](20) NOT NULL,
 CONSTRAINT [PK_TEACHERCHARACTER] PRIMARY KEY NONCLUSTERED 
(
	[tc_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[teacher]    Script Date: 03/09/2014 13:30:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[teacher](
	[user_id] [char](12) NOT NULL,
	[role_code] [int] NULL,
	[password] [varchar](20) NOT NULL,
	[is_teachingAdministrator] [bit] NOT NULL,
	[is_departmentHead] [bit] NOT NULL,
	[is_systemAdministrator] [bit] NOT NULL,
	[teacher_name] [varchar](20) NOT NULL,
 CONSTRAINT [PK_TEACHER] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[studymode]    Script Date: 03/09/2014 13:30:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[studymode](
	[studymode_id] [int] NOT NULL,
	[studymode_name] [varchar](20) NOT NULL,
 CONSTRAINT [PK_STUDYMODE] PRIMARY KEY NONCLUSTERED 
(
	[studymode_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[studentpracticalrecord]    Script Date: 03/09/2014 13:30:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[studentpracticalrecord](
	[ppcode] [int] NOT NULL,
	[ppnumber] [char](3) NOT NULL,
	[user_id] [char](12) NOT NULL,
	[tea_user_id] [char](12) NOT NULL,
	[download_date] [datetime] NOT NULL,
	[upload_date] [datetime] NULL,
	[self_score] [char](1) NULL,
	[teacher_score] [float] NULL,
	[comment] [text] NULL,
	[is_audit] [bit] NULL,
	[answer_name] [varchar](40) NULL,
	[link] [varchar](100) NULL,
 CONSTRAINT [PK_STUDENTPRACTICALRECORD] PRIMARY KEY CLUSTERED 
(
	[ppcode] ASC,
	[ppnumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [Student_tPracticalRecord_FK] ON [dbo].[studentpracticalrecord] 
(
	[user_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Teacher_PracticalRecord_FK] ON [dbo].[studentpracticalrecord] 
(
	[tea_user_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student]    Script Date: 03/09/2014 13:30:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[student](
	[user_id] [char](12) NOT NULL,
	[major_code] [int] NOT NULL,
	[role_code] [int] NULL,
	[password] [varchar](20) NOT NULL,
	[is_teachingAdministrator] [bit] NOT NULL,
	[is_departmentHead] [bit] NOT NULL,
	[is_systemAdministrator] [bit] NOT NULL,
	[student_name] [varchar](20) NOT NULL,
	[student_sex] [bit] NOT NULL,
	[grade] [int] NOT NULL,
	[gradute_date] [datetime] NOT NULL,
 CONSTRAINT [PK_STUDENT] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [Student_Major_FK] ON [dbo].[student] 
(
	[major_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[selftestscores]    Script Date: 03/09/2014 13:30:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[selftestscores](
	[tea_user_id] [char](12) NOT NULL,
	[curriculum_code] [bigint] NOT NULL,
	[number] [bigint] NOT NULL,
	[qt_code] [int] NOT NULL,
	[testpaper_code] [int] NOT NULL,
	[user_id] [char](12) NOT NULL,
	[stscore] [float] NULL,
	[teacher_score] [float] NULL,
 CONSTRAINT [PK_SELFTESTSCORES] PRIMARY KEY CLUSTERED 
(
	[tea_user_id] ASC,
	[curriculum_code] ASC,
	[number] ASC,
	[qt_code] ASC,
	[testpaper_code] ASC,
	[user_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [selftestscores_FK] ON [dbo].[selftestscores] 
(
	[curriculum_code] ASC,
	[number] ASC,
	[qt_code] ASC,
	[testpaper_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [selftestscores2_FK] ON [dbo].[selftestscores] 
(
	[user_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [selftestscores3_FK] ON [dbo].[selftestscores] 
(
	[tea_user_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[selftest]    Script Date: 03/09/2014 13:30:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[selftest](
	[curriculum_code] [bigint] NOT NULL,
	[number] [bigint] NOT NULL,
	[qt_code] [int] NOT NULL,
	[testpaper_code] [int] NOT NULL,
	[serial_number] [int] NOT NULL,
 CONSTRAINT [PK_SELFTEST] PRIMARY KEY NONCLUSTERED 
(
	[curriculum_code] ASC,
	[number] ASC,
	[qt_code] ASC,
	[testpaper_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [TestCustomize_SelfTest_FK] ON [dbo].[selftest] 
(
	[curriculum_code] ASC,
	[number] ASC,
	[qt_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[self_testanswer]    Script Date: 03/09/2014 13:30:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[self_testanswer](
	[curriculum_code] [bigint] NOT NULL,
	[number] [bigint] NOT NULL,
	[qt_code] [int] NOT NULL,
	[testpaper_code] [int] NOT NULL,
	[user_id] [char](12) NOT NULL,
	[answer_name] [varchar](40) NULL,
	[answer_link] [varchar](100) NULL,
	[is_upload] [bit] NULL,
	[is_self_assessment] [bit] NULL,
	[is_read] [bit] NULL,
 CONSTRAINT [PK_SELF_TESTANSWER] PRIMARY KEY CLUSTERED 
(
	[curriculum_code] ASC,
	[number] ASC,
	[qt_code] ASC,
	[testpaper_code] ASC,
	[user_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [SelfTest_questionsAnswer_FK] ON [dbo].[self_testanswer] 
(
	[curriculum_code] ASC,
	[number] ASC,
	[qt_code] ASC,
	[testpaper_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Student_questionsAnswer_FK] ON [dbo].[self_testanswer] 
(
	[user_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 03/09/2014 13:30:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[role](
	[role_code] [int] NOT NULL,
	[role_name] [varchar](16) NOT NULL,
	[remarks] [text] NULL,
 CONSTRAINT [PK_ROLE] PRIMARY KEY NONCLUSTERED 
(
	[role_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[questiontypes]    Script Date: 03/09/2014 13:30:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[questiontypes](
	[qt_code] [int] NOT NULL,
	[qt_name] [varchar](20) NOT NULL,
	[describe] [varchar](50) NOT NULL,
	[is_objective] [bit] NOT NULL,
 CONSTRAINT [PK_QUESTIONTYPES] PRIMARY KEY NONCLUSTERED 
(
	[qt_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[practicalprojectcode]    Script Date: 03/09/2014 13:30:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[practicalprojectcode](
	[ppcode] [int] NOT NULL,
	[pptype_name] [varchar](20) NOT NULL,
 CONSTRAINT [PK_PRACTICALPROJECTCODE] PRIMARY KEY NONCLUSTERED 
(
	[ppcode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[practicalprojecdocument]    Script Date: 03/09/2014 13:30:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[practicalprojecdocument](
	[ppcode] [int] NOT NULL,
	[ppnumber] [char](3) NOT NULL,
	[ppd_name] [varchar](30) NULL,
	[ppd_link] [varchar](100) NULL,
 CONSTRAINT [PK_PRACTICALPROJECDOCUMENT] PRIMARY KEY CLUSTERED 
(
	[ppcode] ASC,
	[ppnumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[practicalprojec]    Script Date: 03/09/2014 13:30:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[practicalprojec](
	[ppcode] [int] NOT NULL,
	[ppnumber] [char](3) NOT NULL,
	[semester_code] [int] NOT NULL,
	[user_id] [char](12) NOT NULL,
	[tea_user_id] [char](12) NOT NULL,
	[requirement] [text] NULL,
	[source] [bit] NULL,
	[pp_name] [varchar](20) NULL,
 CONSTRAINT [PK_PRACTICALPROJEC] PRIMARY KEY NONCLUSTERED 
(
	[ppcode] ASC,
	[ppnumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [Code_PracticalProjec_FK] ON [dbo].[practicalprojec] 
(
	[ppcode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ProjecProvider_FK] ON [dbo].[practicalprojec] 
(
	[user_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [TopicPeople_FK] ON [dbo].[practicalprojec] 
(
	[tea_user_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[menuleveltwo]    Script Date: 03/09/2014 13:30:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[menuleveltwo](
	[menu_level_two_id] [int] NOT NULL,
	[menu_level_one_id] [int] NULL,
	[menu_level_two_name] [varchar](20) NULL,
 CONSTRAINT [PK_MENULEVELTWO] PRIMARY KEY NONCLUSTERED 
(
	[menu_level_two_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [Re_MenuLevelOne_MenuLevelTwo_FK] ON [dbo].[menuleveltwo] 
(
	[menu_level_one_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[menulevelthree]    Script Date: 03/09/2014 13:30:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[menulevelthree](
	[menu_level_three_id] [int] NOT NULL,
	[menu_level_two_id] [int] NULL,
	[menu_level_three_name] [varchar](20) NULL,
	[mapping_page] [text] NULL,
 CONSTRAINT [PK_MENULEVELTHREE] PRIMARY KEY NONCLUSTERED 
(
	[menu_level_three_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [Re_MenuLevelTwo_MenuLevelThree_FK] ON [dbo].[menulevelthree] 
(
	[menu_level_two_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[menulevelone]    Script Date: 03/09/2014 13:30:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[menulevelone](
	[menu_level_one_id] [int] NOT NULL,
	[role_code] [int] NULL,
	[menu_level_one_name] [varchar](20) NULL,
	[mapping_page] [text] NULL,
 CONSTRAINT [PK_MENULEVELONE] PRIMARY KEY NONCLUSTERED 
(
	[menu_level_one_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [Relationship_32_FK] ON [dbo].[menulevelone] 
(
	[role_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[major]    Script Date: 03/09/2014 13:30:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[major](
	[major_code] [int] NOT NULL,
	[major_name] [varchar](20) NOT NULL,
	[core_curriculum] [text] NULL,
	[occupational_direction] [text] NULL,
	[goal] [text] NULL,
	[history] [text] NULL,
 CONSTRAINT [PK_MAJOR] PRIMARY KEY NONCLUSTERED 
(
	[major_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[curriculumcharacter]    Script Date: 03/09/2014 13:30:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[curriculumcharacter](
	[cc_code] [int] NOT NULL,
	[cc_name] [varchar](20) NOT NULL,
 CONSTRAINT [PK_CURRICULUMCHARACTER] PRIMARY KEY NONCLUSTERED 
(
	[cc_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[curriculum_outline]    Script Date: 03/09/2014 13:30:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[curriculum_outline](
	[curriculum_code] [bigint] NOT NULL,
	[co_name] [varchar](20) NOT NULL,
	[filename] [varchar](20) NOT NULL,
	[location] [varchar](100) NOT NULL,
 CONSTRAINT [PK_CURRICULUM_OUTLINE] PRIMARY KEY CLUSTERED 
(
	[curriculum_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[curriculum]    Script Date: 03/09/2014 13:30:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[curriculum](
	[curriculum_code] [bigint] NOT NULL,
	[cc_code] [int] NOT NULL,
	[studymode_id] [int] NOT NULL,
	[curriculum_name] [varchar](20) NOT NULL,
	[curriculum_englishname] [varchar](50) NULL,
	[credit] [float] NOT NULL,
	[all_time] [int] NOT NULL,
	[theory_time] [int] NOT NULL,
	[practice_time] [int] NOT NULL,
	[computer_time] [int] NOT NULL,
	[semester_code] [int] NOT NULL,
	[exam_way] [varchar](4) NOT NULL,
	[explain] [text] NULL,
 CONSTRAINT [PK_CURRICULUM] PRIMARY KEY NONCLUSTERED 
(
	[curriculum_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [CurriculumCharacter_Curriculum_FK] ON [dbo].[curriculum] 
(
	[cc_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [课程-修读方式_FK] ON [dbo].[curriculum] 
(
	[studymode_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[courseware]    Script Date: 03/09/2014 13:30:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[courseware](
	[curriculum_code] [bigint] NOT NULL,
	[filename] [varchar](20) NULL,
	[location] [varchar](100) NULL,
 CONSTRAINT [PK_COURSEWARE] PRIMARY KEY CLUSTERED 
(
	[curriculum_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[assignment]    Script Date: 03/09/2014 13:30:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[assignment](
	[curriculum_code] [bigint] NOT NULL,
	[filename] [varchar](20) NULL,
	[location] [varchar](100) NULL,
 CONSTRAINT [PK_ASSIGNMENT] PRIMARY KEY CLUSTERED 
(
	[curriculum_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[alternativepracticalproject]    Script Date: 03/09/2014 13:30:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[alternativepracticalproject](
	[pp_name] [varchar](20) NULL,
	[requirement] [text] NULL,
	[semester_code] [int] NULL,
	[ppd_name] [varchar](30) NULL,
	[ppd_link] [varchar](100) NULL,
	[equence_number] [int] NOT NULL,
	[user_id] [char](12) NOT NULL,
 CONSTRAINT [PK_ALTERNATIVEPRACTICALPROJECT] PRIMARY KEY NONCLUSTERED 
(
	[equence_number] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [Student_-AlternativePracticalProject_FK] ON [dbo].[alternativepracticalproject] 
(
	[user_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Default [DF__user__is_teachin__44FF419A]    Script Date: 03/09/2014 13:30:12 ******/
ALTER TABLE [dbo].[user] ADD  DEFAULT ((0)) FOR [is_teachingAdministrator]
GO
/****** Object:  Default [DF__user__is_departm__45F365D3]    Script Date: 03/09/2014 13:30:12 ******/
ALTER TABLE [dbo].[user] ADD  DEFAULT ((0)) FOR [is_departmentHead]
GO
/****** Object:  Default [DF__user__is_systemA__46E78A0C]    Script Date: 03/09/2014 13:30:12 ******/
ALTER TABLE [dbo].[user] ADD  DEFAULT ((0)) FOR [is_systemAdministrator]
GO
/****** Object:  Default [DF__teacherin__is_te__32E0915F]    Script Date: 03/09/2014 13:30:12 ******/
ALTER TABLE [dbo].[teacherinfor] ADD  DEFAULT ((0)) FOR [is_teachingAdministrator]
GO
/****** Object:  Default [DF__teacherin__is_de__33D4B598]    Script Date: 03/09/2014 13:30:12 ******/
ALTER TABLE [dbo].[teacherinfor] ADD  DEFAULT ((0)) FOR [is_departmentHead]
GO
/****** Object:  Default [DF__teacherin__is_sy__34C8D9D1]    Script Date: 03/09/2014 13:30:12 ******/
ALTER TABLE [dbo].[teacherinfor] ADD  DEFAULT ((0)) FOR [is_systemAdministrator]
GO
/****** Object:  Default [DF__teacher__is_teac__2C3393D0]    Script Date: 03/09/2014 13:30:12 ******/
ALTER TABLE [dbo].[teacher] ADD  DEFAULT ((0)) FOR [is_teachingAdministrator]
GO
/****** Object:  Default [DF__teacher__is_depa__2D27B809]    Script Date: 03/09/2014 13:30:12 ******/
ALTER TABLE [dbo].[teacher] ADD  DEFAULT ((0)) FOR [is_departmentHead]
GO
/****** Object:  Default [DF__teacher__is_syst__2E1BDC42]    Script Date: 03/09/2014 13:30:12 ******/
ALTER TABLE [dbo].[teacher] ADD  DEFAULT ((0)) FOR [is_systemAdministrator]
GO
/****** Object:  Default [DF__student__is_teac__239E4DCF]    Script Date: 03/09/2014 13:30:12 ******/
ALTER TABLE [dbo].[student] ADD  DEFAULT ((0)) FOR [is_teachingAdministrator]
GO
/****** Object:  Default [DF__student__is_depa__24927208]    Script Date: 03/09/2014 13:30:12 ******/
ALTER TABLE [dbo].[student] ADD  DEFAULT ((0)) FOR [is_departmentHead]
GO
/****** Object:  Default [DF__student__is_syst__25869641]    Script Date: 03/09/2014 13:30:12 ******/
ALTER TABLE [dbo].[student] ADD  DEFAULT ((0)) FOR [is_systemAdministrator]
GO
