using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace nanoblog.Models
{
	public class Category
	{
		public int CategoryId { get; set; }
		public string CategoryName { get; set; }
		public DateTime DateCreated { get; set; }
		public DateTime DateDeleted { get; set; }
	}
}