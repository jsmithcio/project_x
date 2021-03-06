USE [nanoblog]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 10/29/2018 7:04:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[AuthorId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](200) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NULL,
	[DateDeleted] [datetime] NULL,
 CONSTRAINT [PK_Authors] PRIMARY KEY CLUSTERED 
(
	[AuthorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blogs]    Script Date: 10/29/2018 7:04:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blogs](
	[BlogId] [int] IDENTITY(1,1) NOT NULL,
	[BlogName] [nvarchar](200) NOT NULL,
	[AuthorId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[TopicId] [int] NOT NULL,
	[PrimaryHeader] [nvarchar](50) NULL,
	[SecondaryHeader] [nvarchar](50) NULL,
	[BlogImagePath] [nvarchar](200) NULL,
	[BlogImageAlt] [nvarchar](200) NULL,
	[BlogSummary] [nvarchar](500) NULL,
	[BlogBody] [nvarchar](4000) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NULL,
	[DateDeleted] [datetime] NULL,
 CONSTRAINT [PK_Blogs] PRIMARY KEY CLUSTERED 
(
	[BlogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 10/29/2018 7:04:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Category] [nvarchar](50) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NULL,
	[DateDeleted] [datetime] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 10/29/2018 7:04:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[PostId] [int] IDENTITY(1,1) NOT NULL,
	[BlogId] [int] NOT NULL,
	[AuthorId] [int] NOT NULL,
	[Body] [nvarchar](4000) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NULL,
	[DateDeleted] [datetime] NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topics]    Script Date: 10/29/2018 7:04:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topics](
	[TopicId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Topic] [nvarchar](200) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NULL,
	[DateDeleted] [datetime] NULL,
 CONSTRAINT [PK_Topics] PRIMARY KEY CLUSTERED 
(
	[TopicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Widgets]    Script Date: 10/29/2018 7:04:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Widgets](
	[WidgetId] [int] IDENTITY(1,1) NOT NULL,
	[WidgetDisplayName] [nvarchar](15) NULL,
	[WidgetContent] [nvarchar](500) NULL,
	[DateDisplayFrom] [datetime] NULL,
	[DateDisplayUntil] [datetime] NULL,
	[DateCreated] [datetime] NULL,
	[DateModified] [datetime] NULL,
	[DateDeleted] [datetime] NULL,
 CONSTRAINT [PK_Widgets] PRIMARY KEY CLUSTERED 
(
	[WidgetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[del_DeleteAuthor]    Script Date: 10/29/2018 7:04:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[del_DeleteAuthor] @AuthorId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    update Authors
		set DateDeleted = CURRENT_TIMESTAMP
	where AuthorId = @AuthorId

END
GO
/****** Object:  StoredProcedure [dbo].[del_DeleteBlog]    Script Date: 10/29/2018 7:04:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[del_DeleteBlog] @BlogId int	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    update Posts
		set DateDeleted = CURRENT_TIMESTAMP
	where BlogId = @BlogId

	update Blogs
		set DateDeleted = CURRENT_TIMESTAMP
	where BlogId = @BlogId

END
GO
/****** Object:  StoredProcedure [dbo].[del_DeleteCategory]    Script Date: 10/29/2018 7:04:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[del_DeleteCategory] @CategoryId int	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    update Categories
		set DateDeleted = CURRENT_TIMESTAMP
	where CategoryId = @CategoryId

END
GO
/****** Object:  StoredProcedure [dbo].[del_DeletePost]    Script Date: 10/29/2018 7:04:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[del_DeletePost] @PostId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    update Posts
		set DateDeleted =  CURRENT_TIMESTAMP
	where PostId = @PostId

END
GO
/****** Object:  StoredProcedure [dbo].[del_DeleteTopic]    Script Date: 10/29/2018 7:04:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[del_DeleteTopic] @TopicId int	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    update topics 
		set DateDeleted = CURRENT_TIMESTAMP
	where TopicId = @TopicId

END
GO
/****** Object:  StoredProcedure [dbo].[ins_AddAuthor]    Script Date: 10/29/2018 7:04:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- ==============================================
--[dbo].[AddAuthor] 'j', 'm0n3y', 'sysadmin@nanoblog.com', 'sysadmin'
create PROCEDURE [dbo].[ins_AddAuthor] @FirstName nvarchar(50), @LastName nvarchar(50), @Email nvarchar(200), @UserName nvarchar(50)	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO [dbo].[Authors]
           ([FirstName]
           ,[LastName]
           ,[Email]
           ,[UserName]
           ,[DateCreated])
     VALUES
           (@FirstName
           ,@LastName
           ,@Email
           ,@UserName
           ,CURRENT_TIMESTAMP)	
END
GO
/****** Object:  StoredProcedure [dbo].[ins_AddBlog]    Script Date: 10/29/2018 7:04:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
--[dbo].[AddBlog] 'dat blog', 1, 4, 5, 'hello blog', 'this is just a test..', @BlogImagePath nvarchar(200), @BlogImageAlt nvarchar(200), @BlogSummary nvarchar(500), @BlogBody nvarchar(4000)	
CREATE PROCEDURE [dbo].[ins_AddBlog] @BlogName nvarchar(200), @AuthorId int, @CategoryId int, @TopicId int, @PrimaryHeader nvarchar(50), @SecondaryHeader nvarchar(50), @BlogImagePath nvarchar(200), @BlogImageAlt nvarchar(200), @BlogSummary nvarchar(500), @BlogBody nvarchar(4000)	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO [dbo].[Blogs]
           ([BlogName],[AuthorId],[CategoryId],[TopicId],[PrimaryHeader],[SecondaryHeader],[BlogImagePath],[BlogImageAlt],[BlogSummary],[BlogBody],[DateCreated])
    VALUES
           (@BlogName,@AuthorId,@CategoryId,@TopicId,@PrimaryHeader,@SecondaryHeader,@BlogImagePath,@BlogImageAlt,@BlogSummary,@BlogBody,CURRENT_TIMESTAMP)

END
GO
/****** Object:  StoredProcedure [dbo].[ins_AddCategory]    Script Date: 10/29/2018 7:04:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
--[dbo].[AddCategory] 'gists'
create PROCEDURE [dbo].[ins_AddCategory] @Category nvarchar(50)	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO [dbo].[Categories]
           ([Category],[DateCreated])
     VALUES
           (@Category,CURRENT_TIMESTAMP)

END
GO
/****** Object:  StoredProcedure [dbo].[ins_AddPost]    Script Date: 10/29/2018 7:04:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[ins_AddPost] @BlogId int, @AuthorId int, @Body nvarchar(4000)	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO [dbo].[Posts]
           ([BlogId],[AuthorId],[Body],[DateCreated])
     VALUES
           (@BlogId, @AuthorId, @Body, CURRENT_TIMESTAMP)

END
GO
/****** Object:  StoredProcedure [dbo].[ins_AddTopic]    Script Date: 10/29/2018 7:04:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
--[dbo].[AddTopic] 4, 'check this out'
create PROCEDURE [dbo].[ins_AddTopic] @CategoryId int, @Topic nvarchar(50)	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO [dbo].[Topics]
           ([CategoryId],[Topic],[DateCreated])
     VALUES
           (@CategoryId, @Topic, CURRENT_TIMESTAMP)

END
GO
/****** Object:  StoredProcedure [dbo].[sel_GetAuthorById]    Script Date: 10/29/2018 7:04:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[sel_GetAuthorById] @AuthorId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  SELECT * FROM [dbo].[Authors] where AuthorId = @AuthorId

END
GO
/****** Object:  StoredProcedure [dbo].[sel_GetBlogById]    Script Date: 10/29/2018 7:04:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
--[dbo].[GetBlogById] 1
create PROCEDURE [dbo].[sel_GetBlogById] @BlogId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  select b.*, c.category, t.topic, a.UserName 
  from Blogs b
  left join Authors a on a.AuthorId = b.AuthorId
  left join Categories c on c.CategoryId = b.CategoryId
  left join Topics t on t.TopicId = b.TopicId
  where b.BlogId = @BlogId

END
GO
/****** Object:  StoredProcedure [dbo].[sel_GetCategoryById]    Script Date: 10/29/2018 7:04:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[sel_GetCategoryById] @CategoryId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  SELECT * FROM [dbo].[Categories] where CategoryId = @CategoryId

END
GO
/****** Object:  StoredProcedure [dbo].[sel_GetPostById]    Script Date: 10/29/2018 7:04:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[sel_GetPostById] @PostId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  SELECT * FROM [dbo].[Posts] where PostId = @PostId

END
GO
/****** Object:  StoredProcedure [dbo].[sel_GetTopicById]    Script Date: 10/29/2018 7:04:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[sel_GetTopicById] @TopicId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  SELECT * FROM [dbo].[Topics] where TopicId = @TopicId

END
GO
/****** Object:  StoredProcedure [dbo].[upd_UpdateAuthor]    Script Date: 10/29/2018 7:04:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[upd_UpdateAuthor] @AuthorId int, @FirstName nvarchar(50), @LastName nvarchar(50), @Email nvarchar(200), @UserName nvarchar(50)	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

		update Authors 
			set FirstName = @FirstName,
				LastName = @LastName,
				Email = @Email,
				UserName = @UserName,
				datemodified = CURRENT_TIMESTAMP
		where AuthorId = @AuthorId

END
GO
/****** Object:  StoredProcedure [dbo].[upd_UpdateBlog]    Script Date: 10/29/2018 7:04:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[upd_UpdateBlog] @BlogId int, @BlogName nvarchar(200), @AuthorId int, @CategoryId int, @TopicId int, @PrimaryHeader nvarchar(50), @SecondaryHeader nvarchar(50), @BlogImagePath nvarchar(200), @BlogImageAlt nvarchar(200), @BlogSummary nvarchar(500), @BlogBody nvarchar(4000)	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	update Blogs 
		set BlogName = @BlogName,
				AuthorId = @AuthorId,
				CategoryId = @CategoryId,
				TopicId = @TopicId,
				PrimaryHeader = @PrimaryHeader,
				SecondaryHeader = @SecondaryHeader,
				BlogImagePath = @BlogImagePath,
				BlogImageAlt = @BlogImageAlt,
				BlogSummary = @BlogSummary,
				BlogBody = @BlogBody,
				DateModified = CURRENT_TIMESTAMP
		where BlogId = @BlogId

END
GO
/****** Object:  StoredProcedure [dbo].[upd_UpdateCategory]    Script Date: 10/29/2018 7:04:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[upd_UpdateCategory] @CategoryId int, @Category nvarchar(50)	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    update Categories
		set Category = @Category,
		datemodified = CURRENT_TIMESTAMP
	where CategoryId = @CategoryId

END
GO
/****** Object:  StoredProcedure [dbo].[upd_UpdatePost]    Script Date: 10/29/2018 7:04:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[upd_UpdatePost] @PostId int, @BlogId int, @AuthorId int, @Body nvarchar(4000)	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   update Posts           
		set BlogId = @BlogId,
		AuthorId = @AuthorId,
		Body = @Body,
		datemodified = CURRENT_TIMESTAMP
	where PostId = @PostId

END
GO
/****** Object:  StoredProcedure [dbo].[upd_UpdateTopic]    Script Date: 10/29/2018 7:04:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[upd_UpdateTopic] @TopicId int, @Topic nvarchar(50)	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

     update Topics           
		set Topic = @Topic,
		datemodified = CURRENT_TIMESTAMP
	where TopicId = @TopicId

END
GO
