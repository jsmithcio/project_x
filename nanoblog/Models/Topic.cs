using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace nanoblog.Models
{
	public class Topic
	{
		public int TopicId { get; set; }
		public int CategoryId { get; set; }
		public string TopicName { get; set; }
		public DateTime DateCreated { get; set; }
		public DateTime DateDeleted { get; set; }
	}
}