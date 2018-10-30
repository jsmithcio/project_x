using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using nanoblog.Models;

namespace nanoblog.Data_Access
{
	public class BlogDAL
	{
		private string connstr = ConfigurationManager.ConnectionStrings["nanoblog"].ConnectionString;

		public Blog LoadBlogData(string Id)
		{
			Blog blog = new Blog();
			string sproc = "sel_GetBlogById";			

			Int32.TryParse(Id, out Int32 @BlogId);
			if(@BlogId <= 0)
			{
				blog.BlogId = 0;
				return blog;
			}

			using (var conn = new SqlConnection(connstr))
			{
				using (var cmd = new SqlCommand(sproc, conn))
				{
					cmd.CommandType = CommandType.StoredProcedure;
					cmd.Parameters.Add("@BlogId", SqlDbType.Int).Value = @BlogId;
					conn.Open();

					using (var rdr = cmd.ExecuteReader())
					{
						if (rdr.HasRows)
						{
							while (rdr.Read())
							{
								blog.BlogId = (int)rdr["BlogId"];
								blog.BlogName = (string)rdr["BlogName"];
								blog.AuthorId = (int)rdr["AuthorId"];
								blog.Author = (string)rdr["UserName"];
								blog.CategoryId = (int)rdr["CategoryId"];
								blog.Category = (string)rdr["Category"];
								blog.TopicId = (int)rdr["TopicId"];
								blog.Topic = (string)rdr["Topic"];
								blog.PrimaryHeader = (string)rdr["PrimaryHeader"];
								blog.SecondaryHeader = (string)rdr["SecondaryHeader"];
								blog.BlogImagePath = (string)rdr["BlogImagePath"];
								blog.BlogImageAlt = (string)rdr["BlogImageAlt"];
								blog.BlogSummary = (string)rdr["BlogSummary"];
								blog.BlogBody = (string)rdr["BlogBody"];
								blog.DateCreated = (DateTime)rdr["DateCreated"];
							}							
						}
					}
				}
			}
			return blog;
		}

		public void AddBlog(Blog blog)
		{
			string sproc = "ins_AddBlog";

			using (var conn = new SqlConnection(connstr))
			{
				using (var cmd = new SqlCommand(sproc, conn))
				{
					cmd.CommandType = CommandType.StoredProcedure;
					cmd.Parameters.Add("@BlogName", SqlDbType.NVarChar).Value = blog.BlogName;
					cmd.Parameters.Add("@AuthorId", SqlDbType.Int).Value = blog.AuthorId;
					cmd.Parameters.Add("@CategoryId", SqlDbType.Int).Value = blog.CategoryId;
					cmd.Parameters.Add("@TopicId", SqlDbType.Int).Value = blog.TopicId;
					cmd.Parameters.Add("@PrimaryHeader", SqlDbType.NVarChar).Value = blog.PrimaryHeader;
					cmd.Parameters.Add("@SecondaryHeader", SqlDbType.NVarChar).Value = blog.SecondaryHeader;
					cmd.Parameters.Add("@BlogImagePath", SqlDbType.NVarChar).Value = blog.BlogImagePath;
					cmd.Parameters.Add("@BlogImageAlt", SqlDbType.NVarChar).Value = blog.BlogImageAlt;
					cmd.Parameters.Add("@BlogSummary", SqlDbType.NVarChar).Value = blog.BlogSummary;
					cmd.Parameters.Add("@BlogBody", SqlDbType.NVarChar).Value = blog.BlogBody;

					conn.Open();
					cmd.ExecuteNonQuery();
					conn.Close();
				}
			}
		}

		public bool UpdateBlog(Blog blog)
		{
			bool success = false;
			string sproc = "upd_UpdateBlog";

			Int32 @BlogId = Convert.ToInt32(blog.BlogId);
			if (@BlogId <= 0)
			{				
				return success;
			}		

			using (var conn = new SqlConnection(connstr))
			{
				using (var cmd = new SqlCommand(sproc, conn))
				{
					cmd.CommandType = CommandType.StoredProcedure;
					cmd.Parameters.Add("@BlogId", SqlDbType.Int).Value = @BlogId;
					cmd.Parameters.Add("@BlogName", SqlDbType.NVarChar).Value = blog.BlogName;
					cmd.Parameters.Add("@AuthorId", SqlDbType.Int).Value = blog.AuthorId;
					cmd.Parameters.Add("@CategoryId", SqlDbType.Int).Value = blog.CategoryId;
					cmd.Parameters.Add("@TopicId", SqlDbType.Int).Value = blog.TopicId;
					cmd.Parameters.Add("@PrimaryHeader", SqlDbType.NVarChar).Value = blog.PrimaryHeader;
					cmd.Parameters.Add("@SecondaryHeader", SqlDbType.NVarChar).Value = blog.SecondaryHeader;
					cmd.Parameters.Add("@BlogImagePath", SqlDbType.NVarChar).Value = blog.BlogImagePath;
					cmd.Parameters.Add("@BlogImageAlt", SqlDbType.NVarChar).Value = blog.BlogImageAlt;
					cmd.Parameters.Add("@BlogSummary", SqlDbType.NVarChar).Value = blog.BlogSummary;
					cmd.Parameters.Add("@BlogBody", SqlDbType.NVarChar).Value = blog.BlogBody;

					conn.Open();
					cmd.ExecuteNonQuery();
					conn.Close();

					success = true;
				}
			}
			return success;
		}

		public bool DeleteBlog(int id)
		{
			bool success = false;
			string sproc = "upd_DeleteBlog";

			Int32 @BlogId = Convert.ToInt32(id);
			if (@BlogId <= 0)
			{
				return success;
			}

			using (var conn = new SqlConnection(connstr))
			{
				using (var cmd = new SqlCommand(sproc, conn))
				{
					cmd.CommandType = CommandType.StoredProcedure;
					cmd.Parameters.Add("@BlogId", SqlDbType.Int).Value = @BlogId;

					conn.Open();
					cmd.ExecuteNonQuery();
					conn.Close();

					success = true;
				}
			}
			return success;
		}
	}
}