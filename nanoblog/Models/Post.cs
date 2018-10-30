using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace nanoblog.Models
{
	public class Post
	{
		public int PostId { get; set; }
		public int BlogId { get; set; }
		public string AuthorId { get; set; }
		public string Body { get; set; }
		public DateTime DateCreated { get; set; }
		public DateTime DateDeleted { get; set; }
	}
}