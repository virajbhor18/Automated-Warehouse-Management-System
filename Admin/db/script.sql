USE [master]
GO
/****** Object:  Database [student_performance_analysis_DB]    Script Date: 15-10-2018 15:58:57 ******/
CREATE DATABASE [student_performance_analysis_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'student_performance_analysis_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\student_performance_analysis_DB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'student_performance_analysis_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\student_performance_analysis_DB_log.ldf' , SIZE = 3136KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [student_performance_analysis_DB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [student_performance_analysis_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [student_performance_analysis_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [student_performance_analysis_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [student_performance_analysis_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [student_performance_analysis_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [student_performance_analysis_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [student_performance_analysis_DB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [student_performance_analysis_DB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [student_performance_analysis_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [student_performance_analysis_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [student_performance_analysis_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [student_performance_analysis_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [student_performance_analysis_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [student_performance_analysis_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [student_performance_analysis_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [student_performance_analysis_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [student_performance_analysis_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [student_performance_analysis_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [student_performance_analysis_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [student_performance_analysis_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [student_performance_analysis_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [student_performance_analysis_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [student_performance_analysis_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [student_performance_analysis_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [student_performance_analysis_DB] SET RECOVERY FULL 
GO
ALTER DATABASE [student_performance_analysis_DB] SET  MULTI_USER 
GO
ALTER DATABASE [student_performance_analysis_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [student_performance_analysis_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [student_performance_analysis_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [student_performance_analysis_DB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [student_performance_analysis_DB]
GO
/****** Object:  Table [dbo].[admin_master]    Script Date: 15-10-2018 15:58:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[admin_master](
	[aid] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](max) NULL,
	[password] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[attendance_master]    Script Date: 15-10-2018 15:58:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[attendance_master](
	[attendance_id] [int] IDENTITY(1,1) NOT NULL,
	[stud_id] [int] NULL,
	[stud_name] [varchar](50) NULL,
	[email_id] [varchar](50) NULL,
	[bigdata] [int] NULL,
	[snmr] [int] NULL,
	[stqa] [int] NULL,
	[csm] [int] NULL,
	[bigdata_session] [int] NULL,
	[snmr_session] [int] NULL,
	[stqa_session] [int] NULL,
	[csm_session] [int] NULL,
 CONSTRAINT [PK_attendance_master] PRIMARY KEY CLUSTERED 
(
	[attendance_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[attendance_master1]    Script Date: 15-10-2018 15:58:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[attendance_master1](
	[attendanceid] [int] IDENTITY(1,1) NOT NULL,
	[sid] [int] NULL,
	[subjectid] [int] NULL,
	[totalatt] [numeric](18, 0) NULL,
	[totalec] [numeric](18, 0) NULL,
	[sem] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[branch_master]    Script Date: 15-10-2018 15:58:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[branch_master](
	[branchid] [int] IDENTITY(1,1) NOT NULL,
	[branchname] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[marks_master]    Script Date: 15-10-2018 15:58:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[marks_master](
	[marksid] [int] IDENTITY(1,1) NOT NULL,
	[sid] [int] NULL,
	[subjectid] [int] NULL,
	[marks] [numeric](18, 2) NULL,
	[totalMarks] [numeric](18, 0) NULL,
	[sem] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[notes_master]    Script Date: 15-10-2018 15:58:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[notes_master](
	[exam_id] [int] IDENTITY(1,1) NOT NULL,
	[image] [varchar](max) NOT NULL,
	[name] [varchar](max) NOT NULL,
	[descr] [varchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[perf_transaction]    Script Date: 15-10-2018 15:58:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[perf_transaction](
	[id_] [int] IDENTITY(1,1) NOT NULL,
	[sid] [int] NULL,
	[avg_marks] [float] NULL,
	[avg_test] [float] NULL,
	[avg_att] [float] NULL,
	[subid] [int] NULL,
 CONSTRAINT [PK_perf_transaction] PRIMARY KEY CLUSTERED 
(
	[id_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[question_master]    Script Date: 15-10-2018 15:58:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[question_master](
	[question_id] [int] IDENTITY(1,1) NOT NULL,
	[question_name] [varchar](max) NOT NULL,
	[option_1] [varchar](50) NULL,
	[option_2] [varchar](50) NULL,
	[option_3] [varchar](50) NULL,
	[option_4] [varchar](50) NULL,
	[correct_answer] [varchar](50) NULL,
	[sem] [int] NULL,
	[subject_] [int] NULL,
 CONSTRAINT [PK_question_master] PRIMARY KEY CLUSTERED 
(
	[question_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[result_master]    Script Date: 15-10-2018 15:58:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[result_master](
	[rid] [int] IDENTITY(1,1) NOT NULL,
	[total] [int] NULL,
	[attempt] [int] NULL,
	[correct_ans] [int] NULL,
	[percentage] [float] NULL,
	[sid] [int] NULL,
	[subid] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sem_master]    Script Date: 15-10-2018 15:58:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sem_master](
	[semid] [int] IDENTITY(1,1) NOT NULL,
	[sem] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[session_transaction]    Script Date: 15-10-2018 15:58:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[session_transaction](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[subject_name] [varchar](50) NULL,
	[session_s] [int] NULL,
 CONSTRAINT [PK_session_transaction] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[student_master]    Script Date: 15-10-2018 15:58:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[student_master](
	[sid] [int] IDENTITY(1,1) NOT NULL,
	[sname] [varchar](max) NULL,
	[sno] [varchar](50) NULL,
	[email] [varchar](max) NULL,
	[parentEmail] [varchar](max) NULL,
	[password] [varchar](max) NULL,
	[address] [varchar](max) NULL,
	[branchid] [int] NULL,
	[semid] [int] NULL,
	[status_] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[student_prediction_master]    Script Date: 15-10-2018 15:58:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[student_prediction_master](
	[id] [int] NOT NULL,
	[name_] [varchar](max) NULL,
	[status_] [varchar](max) NULL,
	[subject_] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[student_test]    Script Date: 15-10-2018 15:58:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[student_test](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[question_id] [int] NULL,
	[answer] [varchar](50) NULL,
	[student_id] [varchar](50) NULL,
 CONSTRAINT [PK_student_test] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[subject_master]    Script Date: 15-10-2018 15:58:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[subject_master](
	[subjectid] [int] IDENTITY(1,1) NOT NULL,
	[subjectname] [varchar](max) NULL,
	[semid] [int] NULL,
	[totalLec] [numeric](18, 0) NULL,
	[totalMarks] [numeric](18, 0) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tmp_data]    Script Date: 15-10-2018 15:58:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tmp_data](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name_] [varchar](50) NULL,
	[status_] [varchar](50) NULL,
 CONSTRAINT [PK_tmp_data] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ut_marks_master]    Script Date: 15-10-2018 15:58:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ut_marks_master](
	[marks_id] [int] IDENTITY(1,1) NOT NULL,
	[stud_id] [int] NULL,
	[stud_name] [varchar](50) NULL,
	[email_id] [varchar](50) NULL,
	[bigdata] [int] NULL,
	[snmr] [int] NULL,
	[stqa] [int] NULL,
	[csm] [int] NULL,
 CONSTRAINT [PK_marks_master] PRIMARY KEY CLUSTERED 
(
	[marks_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[admin_master] ON 

INSERT [dbo].[admin_master] ([aid], [username], [password]) VALUES (1, N'admin', N'admin')
SET IDENTITY_INSERT [dbo].[admin_master] OFF
SET IDENTITY_INSERT [dbo].[attendance_master] ON 

INSERT [dbo].[attendance_master] ([attendance_id], [stud_id], [stud_name], [email_id], [bigdata], [snmr], [stqa], [csm], [bigdata_session], [snmr_session], [stqa_session], [csm_session]) VALUES (1, 1, N'yuvraj', N'yuvi@gmail.com', 21, 23, 23, 23, 40, 40, 40, 40)
INSERT [dbo].[attendance_master] ([attendance_id], [stud_id], [stud_name], [email_id], [bigdata], [snmr], [stqa], [csm], [bigdata_session], [snmr_session], [stqa_session], [csm_session]) VALUES (2, 2, N'nivrutti', N'kore@gmail.com', 23, 23, 32, 23, 40, 40, 40, 40)
INSERT [dbo].[attendance_master] ([attendance_id], [stud_id], [stud_name], [email_id], [bigdata], [snmr], [stqa], [csm], [bigdata_session], [snmr_session], [stqa_session], [csm_session]) VALUES (3, 3, N'prashant', N'pras@gmail.com', 23, 23, 21, 23, 40, 40, 40, 40)
INSERT [dbo].[attendance_master] ([attendance_id], [stud_id], [stud_name], [email_id], [bigdata], [snmr], [stqa], [csm], [bigdata_session], [snmr_session], [stqa_session], [csm_session]) VALUES (4, 4, N'bbb', N'bbb@gmail.com', 34, 23, 16, 11, 40, 40, 40, 40)
INSERT [dbo].[attendance_master] ([attendance_id], [stud_id], [stud_name], [email_id], [bigdata], [snmr], [stqa], [csm], [bigdata_session], [snmr_session], [stqa_session], [csm_session]) VALUES (5, 6, N'abc', N'abc@gmail.com', 35, 32, 23, 13, 40, 40, 40, 40)
SET IDENTITY_INSERT [dbo].[attendance_master] OFF
SET IDENTITY_INSERT [dbo].[attendance_master1] ON 

INSERT [dbo].[attendance_master1] ([attendanceid], [sid], [subjectid], [totalatt], [totalec], [sem]) VALUES (1, 1, 1, CAST(34 AS Numeric(18, 0)), CAST(40 AS Numeric(18, 0)), 8)
INSERT [dbo].[attendance_master1] ([attendanceid], [sid], [subjectid], [totalatt], [totalec], [sem]) VALUES (2, 2, 1, CAST(24 AS Numeric(18, 0)), CAST(40 AS Numeric(18, 0)), 8)
INSERT [dbo].[attendance_master1] ([attendanceid], [sid], [subjectid], [totalatt], [totalec], [sem]) VALUES (3, 1, 2, CAST(23 AS Numeric(18, 0)), CAST(40 AS Numeric(18, 0)), 8)
INSERT [dbo].[attendance_master1] ([attendanceid], [sid], [subjectid], [totalatt], [totalec], [sem]) VALUES (4, 2, 2, CAST(17 AS Numeric(18, 0)), CAST(40 AS Numeric(18, 0)), 8)
INSERT [dbo].[attendance_master1] ([attendanceid], [sid], [subjectid], [totalatt], [totalec], [sem]) VALUES (5, 1, 3, CAST(29 AS Numeric(18, 0)), CAST(40 AS Numeric(18, 0)), 8)
INSERT [dbo].[attendance_master1] ([attendanceid], [sid], [subjectid], [totalatt], [totalec], [sem]) VALUES (6, 2, 3, CAST(20 AS Numeric(18, 0)), CAST(40 AS Numeric(18, 0)), 8)
INSERT [dbo].[attendance_master1] ([attendanceid], [sid], [subjectid], [totalatt], [totalec], [sem]) VALUES (7, 1, 4, CAST(35 AS Numeric(18, 0)), CAST(40 AS Numeric(18, 0)), 8)
INSERT [dbo].[attendance_master1] ([attendanceid], [sid], [subjectid], [totalatt], [totalec], [sem]) VALUES (8, 2, 4, CAST(23 AS Numeric(18, 0)), CAST(40 AS Numeric(18, 0)), 8)
SET IDENTITY_INSERT [dbo].[attendance_master1] OFF
SET IDENTITY_INSERT [dbo].[branch_master] ON 

INSERT [dbo].[branch_master] ([branchid], [branchname]) VALUES (1, N'comps')
INSERT [dbo].[branch_master] ([branchid], [branchname]) VALUES (2, N'it')
INSERT [dbo].[branch_master] ([branchid], [branchname]) VALUES (3, N'extc')
SET IDENTITY_INSERT [dbo].[branch_master] OFF
SET IDENTITY_INSERT [dbo].[marks_master] ON 

INSERT [dbo].[marks_master] ([marksid], [sid], [subjectid], [marks], [totalMarks], [sem]) VALUES (1, 1, 1, CAST(15.00 AS Numeric(18, 2)), CAST(20 AS Numeric(18, 0)), 8)
INSERT [dbo].[marks_master] ([marksid], [sid], [subjectid], [marks], [totalMarks], [sem]) VALUES (2, 2, 1, CAST(18.00 AS Numeric(18, 2)), CAST(20 AS Numeric(18, 0)), 8)
INSERT [dbo].[marks_master] ([marksid], [sid], [subjectid], [marks], [totalMarks], [sem]) VALUES (3, 1, 2, CAST(14.00 AS Numeric(18, 2)), CAST(20 AS Numeric(18, 0)), 8)
INSERT [dbo].[marks_master] ([marksid], [sid], [subjectid], [marks], [totalMarks], [sem]) VALUES (4, 2, 2, CAST(15.00 AS Numeric(18, 2)), CAST(20 AS Numeric(18, 0)), 8)
INSERT [dbo].[marks_master] ([marksid], [sid], [subjectid], [marks], [totalMarks], [sem]) VALUES (5, 1, 3, CAST(19.00 AS Numeric(18, 2)), CAST(20 AS Numeric(18, 0)), 8)
INSERT [dbo].[marks_master] ([marksid], [sid], [subjectid], [marks], [totalMarks], [sem]) VALUES (6, 2, 3, CAST(16.00 AS Numeric(18, 2)), CAST(20 AS Numeric(18, 0)), 8)
INSERT [dbo].[marks_master] ([marksid], [sid], [subjectid], [marks], [totalMarks], [sem]) VALUES (7, 1, 4, CAST(20.00 AS Numeric(18, 2)), CAST(20 AS Numeric(18, 0)), 8)
INSERT [dbo].[marks_master] ([marksid], [sid], [subjectid], [marks], [totalMarks], [sem]) VALUES (8, 2, 4, CAST(17.00 AS Numeric(18, 2)), CAST(20 AS Numeric(18, 0)), 8)
SET IDENTITY_INSERT [dbo].[marks_master] OFF
SET IDENTITY_INSERT [dbo].[notes_master] ON 

INSERT [dbo].[notes_master] ([exam_id], [image], [name], [descr]) VALUES (1, N'exam/52175178.jpg', N'tejasd1', N'dgfrgdfgdsf')
SET IDENTITY_INSERT [dbo].[notes_master] OFF
SET IDENTITY_INSERT [dbo].[perf_transaction] ON 

INSERT [dbo].[perf_transaction] ([id_], [sid], [avg_marks], [avg_test], [avg_att], [subid]) VALUES (1, 1, 75, 20, 85, 1)
SET IDENTITY_INSERT [dbo].[perf_transaction] OFF
SET IDENTITY_INSERT [dbo].[question_master] ON 

INSERT [dbo].[question_master] ([question_id], [question_name], [option_1], [option_2], [option_3], [option_4], [correct_answer], [sem], [subject_]) VALUES (1, N'to redirect from 1 form to another what we use in c#?', N'divert', N'resp.red', N'convert', N'view', N'resp.red', 8, 1)
INSERT [dbo].[question_master] ([question_id], [question_name], [option_1], [option_2], [option_3], [option_4], [correct_answer], [sem], [subject_]) VALUES (2, N'what is C#', N'qwerty', N'assdfffg', N'zxxcvbbn', N'zxdssdfx', N'qwerty', 8, 2)
INSERT [dbo].[question_master] ([question_id], [question_name], [option_1], [option_2], [option_3], [option_4], [correct_answer], [sem], [subject_]) VALUES (3, N't', N'1234', N'1', N'2', N'3', N'3', 8, 3)
INSERT [dbo].[question_master] ([question_id], [question_name], [option_1], [option_2], [option_3], [option_4], [correct_answer], [sem], [subject_]) VALUES (4, N'cacs', N'1234', N'1', N'2', N'3', N'1', 8, 4)
INSERT [dbo].[question_master] ([question_id], [question_name], [option_1], [option_2], [option_3], [option_4], [correct_answer], [sem], [subject_]) VALUES (5, N'cacs', N'1234', N'1', N'2', N'3', N'1', 8, 3)
INSERT [dbo].[question_master] ([question_id], [question_name], [option_1], [option_2], [option_3], [option_4], [correct_answer], [sem], [subject_]) VALUES (6, N'hie', N'1', N'2', N'3', N'4', N'4', 8, 2)
INSERT [dbo].[question_master] ([question_id], [question_name], [option_1], [option_2], [option_3], [option_4], [correct_answer], [sem], [subject_]) VALUES (8, N'huip', N'2', N'3', N'4', N'5', N'2', 8, 1)
INSERT [dbo].[question_master] ([question_id], [question_name], [option_1], [option_2], [option_3], [option_4], [correct_answer], [sem], [subject_]) VALUES (12, N'ggrvf', N'1', N'2', N'3', N'4', N'3', 8, 2)
INSERT [dbo].[question_master] ([question_id], [question_name], [option_1], [option_2], [option_3], [option_4], [correct_answer], [sem], [subject_]) VALUES (14, N'href', N'2', N'34', N'53', N'222', N'53', 8, 3)
INSERT [dbo].[question_master] ([question_id], [question_name], [option_1], [option_2], [option_3], [option_4], [correct_answer], [sem], [subject_]) VALUES (15, N'nybtr', N'ab', N'bh', N'hf', N'dd', N'dd', 8, 2)
INSERT [dbo].[question_master] ([question_id], [question_name], [option_1], [option_2], [option_3], [option_4], [correct_answer], [sem], [subject_]) VALUES (16, N'ev', N'1234', N'3', N'53', N'hf', N'hf', 8, 1)
INSERT [dbo].[question_master] ([question_id], [question_name], [option_1], [option_2], [option_3], [option_4], [correct_answer], [sem], [subject_]) VALUES (17, N'vrv', N'htrf', N'grv', N'fewe', N'24', N'24', 8, 3)
INSERT [dbo].[question_master] ([question_id], [question_name], [option_1], [option_2], [option_3], [option_4], [correct_answer], [sem], [subject_]) VALUES (18, N'gvtrescd', N'12', N'34', N'gg', N'hf', N'gg', 8, 1)
INSERT [dbo].[question_master] ([question_id], [question_name], [option_1], [option_2], [option_3], [option_4], [correct_answer], [sem], [subject_]) VALUES (19, N'vbytrsf', N'89', N'27', N'43', N'66', N'66', 8, 3)
INSERT [dbo].[question_master] ([question_id], [question_name], [option_1], [option_2], [option_3], [option_4], [correct_answer], [sem], [subject_]) VALUES (20, N'faefvbtbr', N'gew', N'y5', N'323', N'66', N'66', 8, 3)
INSERT [dbo].[question_master] ([question_id], [question_name], [option_1], [option_2], [option_3], [option_4], [correct_answer], [sem], [subject_]) VALUES (21, N'ghnytredf', N'gfcv', N'fdxc', N'hgfd', N'kij', N'kij', 8, 2)
INSERT [dbo].[question_master] ([question_id], [question_name], [option_1], [option_2], [option_3], [option_4], [correct_answer], [sem], [subject_]) VALUES (22, N'hnuhhhh', N'fnkj98', N'gnj88', N'jjg88', N'9999', N'9999', 8, 1)
INSERT [dbo].[question_master] ([question_id], [question_name], [option_1], [option_2], [option_3], [option_4], [correct_answer], [sem], [subject_]) VALUES (23, N'j7nytghh', N'1', N'2', N'3', N'0', N'0', 8, 4)
INSERT [dbo].[question_master] ([question_id], [question_name], [option_1], [option_2], [option_3], [option_4], [correct_answer], [sem], [subject_]) VALUES (24, N'7+gfxc', N'br b', N'brbw', N'11edf', N'vtvrgv', N'11edf', 8, 2)
INSERT [dbo].[question_master] ([question_id], [question_name], [option_1], [option_2], [option_3], [option_4], [correct_answer], [sem], [subject_]) VALUES (25, N'f', N'1234', N'2', N'3', N'4', N'26', 8, 1)
INSERT [dbo].[question_master] ([question_id], [question_name], [option_1], [option_2], [option_3], [option_4], [correct_answer], [sem], [subject_]) VALUES (26, N'3rferf', N'1234', N'2', N'3', N'4', N'26', 8, 2)
INSERT [dbo].[question_master] ([question_id], [question_name], [option_1], [option_2], [option_3], [option_4], [correct_answer], [sem], [subject_]) VALUES (27, N'fghuygfd', N'1234', N'26', N'3', N'4', N'26', 8, 3)
INSERT [dbo].[question_master] ([question_id], [question_name], [option_1], [option_2], [option_3], [option_4], [correct_answer], [sem], [subject_]) VALUES (28, N'i76utht6', N'dw', N'vasva', N'vvsas', N'27', N'27', 8, 1)
INSERT [dbo].[question_master] ([question_id], [question_name], [option_1], [option_2], [option_3], [option_4], [correct_answer], [sem], [subject_]) VALUES (29, N'vuytr', N'w4ytr', N'vasvas', N'btbt', N'44', N'44', 8, 3)
INSERT [dbo].[question_master] ([question_id], [question_name], [option_1], [option_2], [option_3], [option_4], [correct_answer], [sem], [subject_]) VALUES (30, N'what is java', N'1234', N'5678', N'9012', N'3456', N'1234', 8, 3)
INSERT [dbo].[question_master] ([question_id], [question_name], [option_1], [option_2], [option_3], [option_4], [correct_answer], [sem], [subject_]) VALUES (31, N'dsfss', N'a', N'2', N'3', N'4', N'a', 8, 1)
SET IDENTITY_INSERT [dbo].[question_master] OFF
SET IDENTITY_INSERT [dbo].[result_master] ON 

INSERT [dbo].[result_master] ([rid], [total], [attempt], [correct_ans], [percentage], [sid], [subid]) VALUES (35, 5, 5, 1, 20, 1, 1)
INSERT [dbo].[result_master] ([rid], [total], [attempt], [correct_ans], [percentage], [sid], [subid]) VALUES (36, 5, 5, 1, 20, 1, 2)
INSERT [dbo].[result_master] ([rid], [total], [attempt], [correct_ans], [percentage], [sid], [subid]) VALUES (37, 5, 5, 1, 20, 1, 3)
INSERT [dbo].[result_master] ([rid], [total], [attempt], [correct_ans], [percentage], [sid], [subid]) VALUES (39, 5, 2, 1, 20, 1, 4)
INSERT [dbo].[result_master] ([rid], [total], [attempt], [correct_ans], [percentage], [sid], [subid]) VALUES (40, 5, 5, 1, 20, 2, 1)
SET IDENTITY_INSERT [dbo].[result_master] OFF
SET IDENTITY_INSERT [dbo].[sem_master] ON 

INSERT [dbo].[sem_master] ([semid], [sem]) VALUES (1, N'sem1')
INSERT [dbo].[sem_master] ([semid], [sem]) VALUES (2, N'sem2')
INSERT [dbo].[sem_master] ([semid], [sem]) VALUES (3, N'sem3')
INSERT [dbo].[sem_master] ([semid], [sem]) VALUES (4, N'sem4')
INSERT [dbo].[sem_master] ([semid], [sem]) VALUES (5, N'sem5')
INSERT [dbo].[sem_master] ([semid], [sem]) VALUES (6, N'sem6')
INSERT [dbo].[sem_master] ([semid], [sem]) VALUES (7, N'sem7')
INSERT [dbo].[sem_master] ([semid], [sem]) VALUES (8, N'sem8')
SET IDENTITY_INSERT [dbo].[sem_master] OFF
SET IDENTITY_INSERT [dbo].[session_transaction] ON 

INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (1, N'BIGDATA', 40)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (2, N'SNMR', 40)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (3, N'STQA', 40)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (4, N'CSM', 40)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (5, N'BIGDATA', 40)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (6, N'BIGDATA', 40)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (7, N'SNMR', 41)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (8, N'STQA', 41)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (9, N'CSM', 35)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (10, N'SNMR', 44)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (11, N'BIGDATA', 50)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (12, N'SNMR', 30)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (13, N'SNMR', 40)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (14, N'BIGDATA', 40)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (15, N'SNMR', 40)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (16, N'STQA', 40)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (17, N'CSM', 40)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (18, N'BIGDATA', 33)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (19, N'SNMR', 44)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (20, N'BIGDATA', 34)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (21, N'BIGDATA', 30)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (22, N'SNMR', 30)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (23, N'STQA', 30)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (24, N'CSM', 30)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (25, N'BIGDATA', 40)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (26, N'SNMR', 40)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (27, N'STQA', 40)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (28, N'CSM', 40)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (29, N'BIGDATA', 56)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (30, N'BIGDATA', 45)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (31, N'SNMR', 45)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (32, N'BIGDATA', 30)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (33, N'SNMR', 30)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (34, N'STQA', 30)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (35, N'CSM', 30)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (36, N'BIGDATA', 34)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (37, N'BIGDATA', 34)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (38, N'SNMR', 34)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (39, N'STQA', 34)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (40, N'CSM', 34)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (41, N'SNMR', 34)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (42, N'BIGDATA', 20)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (43, N'SNMR', 20)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (44, N'STQA', 20)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (45, N'CSM', 20)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (46, N'SNMR', 25)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (47, N'BIGDATA', 25)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (48, N'STQA', 25)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (49, N'CSM', 25)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (50, N'BIGDATA', 20)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (51, N'SNMR', 20)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (52, N'STQA', 20)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (53, N'CSM', 20)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (54, N'BIGDATA', 25)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (55, N'SNMR', 25)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (56, N'STQA', 25)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (57, N'CSM', 25)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (58, N'BIGDATA', 23)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (59, N'BIGDATA', 1)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (60, N'BIGDATA', 12)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (61, N'BIGDATA', 12)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (62, N'SNMR', 12)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (63, N'STQA', 12)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (64, N'CSM', 12)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (65, N'BIGDATA', 12)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (66, N'BIGDATA', 12)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (67, N'BIGDATA', 40)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (68, N'SNMR', 40)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (69, N'STQA', 40)
INSERT [dbo].[session_transaction] ([id], [subject_name], [session_s]) VALUES (70, N'CSM', 40)
SET IDENTITY_INSERT [dbo].[session_transaction] OFF
SET IDENTITY_INSERT [dbo].[student_master] ON 

INSERT [dbo].[student_master] ([sid], [sname], [sno], [email], [parentEmail], [password], [address], [branchid], [semid], [status_]) VALUES (1, N'Tejas', N'9819652176', N'test@mail.com', N'test@mail.com', N'12345', N'cdewcw', 1, 8, 0)
INSERT [dbo].[student_master] ([sid], [sname], [sno], [email], [parentEmail], [password], [address], [branchid], [semid], [status_]) VALUES (2, N'Yuvraj', N'1234567890', N'test1@mail.com', N'test1@mail.com', N'12345', N'dfe', 1, 8, 0)
SET IDENTITY_INSERT [dbo].[student_master] OFF
SET IDENTITY_INSERT [dbo].[student_test] ON 

INSERT [dbo].[student_test] ([id], [question_id], [answer], [student_id]) VALUES (60, 16, N'1234', N'1')
INSERT [dbo].[student_test] ([id], [question_id], [answer], [student_id]) VALUES (61, 28, N'vasva', N'1')
INSERT [dbo].[student_test] ([id], [question_id], [answer], [student_id]) VALUES (62, 18, N'gg', N'1')
INSERT [dbo].[student_test] ([id], [question_id], [answer], [student_id]) VALUES (63, 25, N'2', N'1')
INSERT [dbo].[student_test] ([id], [question_id], [answer], [student_id]) VALUES (64, 1, N'convert', N'1')
INSERT [dbo].[student_test] ([id], [question_id], [answer], [student_id]) VALUES (65, 26, N'3', N'1')
INSERT [dbo].[student_test] ([id], [question_id], [answer], [student_id]) VALUES (66, 24, N'brbw', N'1')
INSERT [dbo].[student_test] ([id], [question_id], [answer], [student_id]) VALUES (67, 15, N'bh', N'1')
INSERT [dbo].[student_test] ([id], [question_id], [answer], [student_id]) VALUES (68, 21, N'hgfd', N'1')
INSERT [dbo].[student_test] ([id], [question_id], [answer], [student_id]) VALUES (69, 2, N'qwerty', N'1')
INSERT [dbo].[student_test] ([id], [question_id], [answer], [student_id]) VALUES (70, 3, N'1', N'1')
INSERT [dbo].[student_test] ([id], [question_id], [answer], [student_id]) VALUES (71, 17, N'fewe', N'1')
INSERT [dbo].[student_test] ([id], [question_id], [answer], [student_id]) VALUES (72, 14, N'53', N'1')
INSERT [dbo].[student_test] ([id], [question_id], [answer], [student_id]) VALUES (73, 30, N'9012', N'1')
INSERT [dbo].[student_test] ([id], [question_id], [answer], [student_id]) VALUES (74, 5, N'1234', N'1')
INSERT [dbo].[student_test] ([id], [question_id], [answer], [student_id]) VALUES (75, 23, N'1', N'1')
INSERT [dbo].[student_test] ([id], [question_id], [answer], [student_id]) VALUES (76, 4, N'2', N'1')
INSERT [dbo].[student_test] ([id], [question_id], [answer], [student_id]) VALUES (77, 4, N'1', N'1')
INSERT [dbo].[student_test] ([id], [question_id], [answer], [student_id]) VALUES (78, 23, N'3', N'1')
INSERT [dbo].[student_test] ([id], [question_id], [answer], [student_id]) VALUES (79, 18, N'34', N'2')
INSERT [dbo].[student_test] ([id], [question_id], [answer], [student_id]) VALUES (80, 25, N'3', N'2')
INSERT [dbo].[student_test] ([id], [question_id], [answer], [student_id]) VALUES (81, 16, N'53', N'2')
INSERT [dbo].[student_test] ([id], [question_id], [answer], [student_id]) VALUES (82, 31, N'2', N'2')
INSERT [dbo].[student_test] ([id], [question_id], [answer], [student_id]) VALUES (83, 1, N'resp.red', N'2')
SET IDENTITY_INSERT [dbo].[student_test] OFF
SET IDENTITY_INSERT [dbo].[subject_master] ON 

INSERT [dbo].[subject_master] ([subjectid], [subjectname], [semid], [totalLec], [totalMarks]) VALUES (1, N'Data Warehouse and Mining', 8, CAST(40 AS Numeric(18, 0)), CAST(20 AS Numeric(18, 0)))
INSERT [dbo].[subject_master] ([subjectid], [subjectname], [semid], [totalLec], [totalMarks]) VALUES (2, N'Human Machine Interaction ', 8, CAST(40 AS Numeric(18, 0)), CAST(20 AS Numeric(18, 0)))
INSERT [dbo].[subject_master] ([subjectid], [subjectname], [semid], [totalLec], [totalMarks]) VALUES (3, N'Parallel and distributed Systems ', 8, CAST(40 AS Numeric(18, 0)), CAST(20 AS Numeric(18, 0)))
INSERT [dbo].[subject_master] ([subjectid], [subjectname], [semid], [totalLec], [totalMarks]) VALUES (4, N'Cloud Computing Laboratory ', 8, CAST(40 AS Numeric(18, 0)), CAST(20 AS Numeric(18, 0)))
SET IDENTITY_INSERT [dbo].[subject_master] OFF
SET IDENTITY_INSERT [dbo].[ut_marks_master] ON 

INSERT [dbo].[ut_marks_master] ([marks_id], [stud_id], [stud_name], [email_id], [bigdata], [snmr], [stqa], [csm]) VALUES (1, 1, N'yuvraj', N'yuvi@gmail.com', 12, 32, 23, 23)
INSERT [dbo].[ut_marks_master] ([marks_id], [stud_id], [stud_name], [email_id], [bigdata], [snmr], [stqa], [csm]) VALUES (2, 2, N'nivrutti', N'kore@gmail.com', 15, 32, 23, 33)
INSERT [dbo].[ut_marks_master] ([marks_id], [stud_id], [stud_name], [email_id], [bigdata], [snmr], [stqa], [csm]) VALUES (3, 3, N'prashant', N'pras@gmail.com', 15, 23, 23, 12)
INSERT [dbo].[ut_marks_master] ([marks_id], [stud_id], [stud_name], [email_id], [bigdata], [snmr], [stqa], [csm]) VALUES (4, 4, N'bbb', N'bbb@gmail.com', 16, 23, 11, 14)
INSERT [dbo].[ut_marks_master] ([marks_id], [stud_id], [stud_name], [email_id], [bigdata], [snmr], [stqa], [csm]) VALUES (5, 6, N'abc', N'abc@gmail.com', 11, 33, 19, 13)
SET IDENTITY_INSERT [dbo].[ut_marks_master] OFF
USE [master]
GO
ALTER DATABASE [student_performance_analysis_DB] SET  READ_WRITE 
GO
