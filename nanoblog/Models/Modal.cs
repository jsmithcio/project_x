using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace nanoblog.Models
{
	public class Modal
	{
		public string ModalId { get; set; }
		public string ModalTitle { get; set; }
		public string ModalContent { get; set; }
		public string ButtonOneText { get; set; }
		public string ButtonTwoText { get; set; }

		private void reset()
		{
			ModalId = string.Empty;
			ModalTitle = string.Empty;
			ModalContent = string.Empty;
			ButtonOneText = string.Empty;
			ButtonTwoText = string.Empty;
		}
	}
}