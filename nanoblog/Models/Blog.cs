using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
//using System.Data;
//using System.Data.SqlClient;
//using System.Configuration;


namespace nanoblog.Models
{
	public class Blog
	{
		public int BlogId { get; set; }
		public string BlogName { get; set; }
		public int AuthorId { get; set; }
		public string Author { get; set; }
		public int CategoryId { get; set; }
		public string Category { get; set; }
		public int TopicId { get; set; }
		public string Topic { get; set; }
		public string PrimaryHeader { get; set; }
		public string SecondaryHeader { get; set; }
		public string BlogImagePath { get; set; }
		public string BlogImageAlt { get; set; }
		public string BlogSummary { get; set; }
		public string BlogBody { get; set; }
		public DateTime DateCreated { get; set; }
		public DateTime DateDeleted { get; set; }

		
		public Blog()
		{
			//connstr = ConfigurationManager.ConnectionStrings["nanoblog"].ConnectionString;			
		}
			
	}
}