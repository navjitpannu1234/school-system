USE [master]
GO
/****** Object:  Database [School_System_Navjit]    Script Date: 05-07-2020 11:45:35 PM ******/
CREATE DATABASE [School_System_Navjit]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'School_System_Navjit', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\School_System_Navjit.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'School_System_Navjit_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\School_System_Navjit_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [School_System_Navjit] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [School_System_Navjit].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [School_System_Navjit] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [School_System_Navjit] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [School_System_Navjit] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [School_System_Navjit] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [School_System_Navjit] SET ARITHABORT OFF 
GO
ALTER DATABASE [School_System_Navjit] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [School_System_Navjit] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [School_System_Navjit] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [School_System_Navjit] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [School_System_Navjit] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [School_System_Navjit] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [School_System_Navjit] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [School_System_Navjit] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [School_System_Navjit] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [School_System_Navjit] SET  ENABLE_BROKER 
GO
ALTER DATABASE [School_System_Navjit] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [School_System_Navjit] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [School_System_Navjit] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [School_System_Navjit] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [School_System_Navjit] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [School_System_Navjit] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [School_System_Navjit] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [School_System_Navjit] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [School_System_Navjit] SET  MULTI_USER 
GO
ALTER DATABASE [School_System_Navjit] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [School_System_Navjit] SET DB_CHAINING OFF 
GO
ALTER DATABASE [School_System_Navjit] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [School_System_Navjit] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [School_System_Navjit] SET DELAYED_DURABILITY = DISABLED 
GO
USE [School_System_Navjit]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 05-07-2020 11:45:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Courses]    Script Date: 05-07-2020 11:45:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[DepartmentId] [int] NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Departments]    Script Date: 05-07-2020 11:45:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[HeadName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentEnrollments]    Script Date: 05-07-2020 11:45:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentEnrollments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NULL,
	[CourseId] [int] NULL,
	[EnrollmentDate] [datetime2](7) NULL,
	[EnrollmentId] [int] NULL,
 CONSTRAINT [PK_StudentEnrollments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Students]    Script Date: 05-07-2020 11:45:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[StudentCode] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[Country] [nvarchar](max) NULL,
	[Gender] [nvarchar](max) NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200705093336_Initial', N'3.1.5')
GO
SET IDENTITY_INSERT [dbo].[Courses] ON 

GO
INSERT [dbo].[Courses] ([Id], [Name], [DepartmentId]) VALUES (1, N'Btech', 1)
GO
SET IDENTITY_INSERT [dbo].[Courses] OFF
GO
SET IDENTITY_INSERT [dbo].[Departments] ON 

GO
INSERT [dbo].[Departments] ([Id], [Name], [HeadName]) VALUES (1, N'IT', N'Banglore')
GO
SET IDENTITY_INSERT [dbo].[Departments] OFF
GO
SET IDENTITY_INSERT [dbo].[StudentEnrollments] ON 

GO
INSERT [dbo].[StudentEnrollments] ([Id], [StudentId], [CourseId], [EnrollmentDate], [EnrollmentId]) VALUES (1, 1, 1, CAST(N'2020-07-04 23:41:00.0000000' AS DateTime2), 12)
GO
SET IDENTITY_INSERT [dbo].[StudentEnrollments] OFF
GO
SET IDENTITY_INSERT [dbo].[Students] ON 

GO
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [StudentCode], [Address], [City], [Country], [Gender]) VALUES (1, N'Nirmal', N'Singh', N'12', N'Sant Nagar', N'Gurdaspur', N'India', N'Male')
GO
SET IDENTITY_INSERT [dbo].[Students] OFF
GO
/****** Object:  Index [IX_Courses_DepartmentId]    Script Date: 05-07-2020 11:45:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_Courses_DepartmentId] ON [dbo].[Courses]
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_StudentEnrollments_CourseId]    Script Date: 05-07-2020 11:45:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_StudentEnrollments_CourseId] ON [dbo].[StudentEnrollments]
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_StudentEnrollments_StudentId]    Script Date: 05-07-2020 11:45:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_StudentEnrollments_StudentId] ON [dbo].[StudentEnrollments]
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Departments_DepartmentId] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Departments_DepartmentId]
GO
ALTER TABLE [dbo].[StudentEnrollments]  WITH CHECK ADD  CONSTRAINT [FK_StudentEnrollments_Courses_CourseId] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([Id])
GO
ALTER TABLE [dbo].[StudentEnrollments] CHECK CONSTRAINT [FK_StudentEnrollments_Courses_CourseId]
GO
ALTER TABLE [dbo].[StudentEnrollments]  WITH CHECK ADD  CONSTRAINT [FK_StudentEnrollments_Students_StudentId] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([Id])
GO
ALTER TABLE [dbo].[StudentEnrollments] CHECK CONSTRAINT [FK_StudentEnrollments_Students_StudentId]
GO
USE [master]
GO
ALTER DATABASE [School_System_Navjit] SET  READ_WRITE 
GO
