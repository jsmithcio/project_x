using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;


namespace nanoblog.Models
{
	public abstract class MasterPageBase : System.Web.UI.MasterPage
	{
		protected ClientScriptManager cs;
		protected Modal modal;
		protected Blog blog;
		protected string FooterText { get; set; }


		protected void LoadModal(Modal modal, PlaceHolder ph)
		{
			StringBuilder sb = new StringBuilder();
			sb.Append(@"<div class=""modal fade"" id=""");
			sb.Append(modal.ModalId);
			sb.Append(@""" tabindex="" - 1"" role=""dialog"" aria-labelledby=""myModalLabel"" aria-hidden=""true"">");
			sb.Append(@"<div class=""modal-dialog modal-sm"" role=""document"">");
			sb.Append(@"<div class=""modal-content"">");
			sb.Append(@"<div class=""modal-header"">");
			sb.Append(@"<h4 class=""modal-title w-100"" id=""myModalLabel"">");
			sb.Append(modal.ModalTitle);
			sb.Append(@"</h4>");
			sb.Append(@"<button type=""button"" class=""close"" data-dismiss=""modal"" aria-label=""Close"">");
			sb.Append(@"<span aria-hidden=""true"">&times;</span>");
			sb.Append(@"</button></div><div class=""modal-body"">");
			sb.Append(modal.ModalContent);
			sb.Append(@"</div><div class=""modal-footer"">");
			sb.Append(@"<button type=""button"" class=""btn btn-secondary btn-sm"" data-dismiss=""modal"">");
			sb.Append(modal.ButtonOneText);
			sb.Append(@"</button>");
			sb.Append(@"<button type=""button"" class=""btn btn-primary btn-sm"" data-dismiss=""modal"">");
			sb.Append(modal.ButtonTwoText);
			sb.Append(@"</button>");
			sb.Append(@"</div></div></div></div>");
			ph.Controls.Add(new LiteralControl(sb.ToString()));
		}
		
		protected void ShowModal(string modalId)
		{
			//This works
			StringBuilder sb = new StringBuilder();
			sb.Append(@"<script type=""text/javascript"">");
			sb.Append(@"$(' #" + modalId + "').modal('show');");
			sb.Append(@"</script>");

			//ClientScriptManager cs = Page.ClientScript;//If not declared yet
			cs.RegisterStartupScript(this.GetType(), Guid.NewGuid().ToString(), sb.ToString(), false);
		}		

		protected void DisplayAlert(string msg)
		{			
			//if (!cs.IsStartupScriptRegistered(this.GetType(), Guid.NewGuid().ToString()))
			//{
			StringBuilder sb = new StringBuilder();
			sb.Append(@"<script type=""text/javascript"">alert('");
			sb.Append(msg + @"');");
			//sb.Append("');");
			sb.Append("</script>");
			cs.RegisterStartupScript(this.GetType(), Guid.NewGuid().ToString(), sb.ToString(), false);

			//or format the string first like so:
			//cs.RegisterStartupScript(this.GetType(), Guid.NewGuid().ToString(), string.Format("alert('{0}');", message.Replace("'", @"\'")), true);
			//}
		}

		protected string ParseRawURL(string rawurl)
		{
			//string rawurl = Request.RawUrl.ToString();
			string[] words = rawurl.Split('/');
			string retval = words[1];
			return retval;
		}
	}
}
