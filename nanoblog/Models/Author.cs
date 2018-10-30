using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace nanoblog.Models
{
	public class Author
	{
		public int AuthorId { get; set; }
		public string FirstName { get; set; }//50
		public string LastName { get; set; }//50
		public string Email { get; set; }//200
		public string UserName { get; set; }//50
		public DateTime DateCreated { get; set; }//datetime
		public DateTime DateDeleted { get; set; }
	}
}