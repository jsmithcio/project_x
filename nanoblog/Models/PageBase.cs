using System;
using System.Linq;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace nanoblog.Models
{
	public class PageBase : Page
	{

		public PageBase()
		{
			this.PreInit += new EventHandler(PageBase_PreInit);
			this.Init += new EventHandler(PageBase_Init);
		}

		void PageBase_PreInit(object sender, EventArgs e)
		{
			//MasterPageFile = "~/BlogHome.Master";
		}

		void PageBase_Init(object sender, EventArgs e)
		{
			
		}

		protected string GetValueFromQueryString(string key)
		{
			string retval = "1";

			if (Request.QueryString.Keys.Count > 0)
			{				
				if (!Request.QueryString.GetValues(null).Contains(key, StringComparer.OrdinalIgnoreCase))
				{					
					if (!string.IsNullOrEmpty(Request.QueryString[key]))
					{						
						// ** This is the only place the BlogId is set **
						retval = Request.QueryString[key];						
					}
				}
			}
			return retval;
		}		

		protected void LoadMph(Modal modal, Panel panel, PlaceHolder ph)
		{
			LoadModal(modal, ph);
			panel.Visible = true;
			ShowModal(modal.ModalId);
		}

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
			StringBuilder sb = new StringBuilder();
			sb.Append(@"<script type=""text/javascript"">");
			sb.Append(@"$(' #" + modalId + "').modal('show');");
			sb.Append(@"</script>");

			//ClientScriptManager cs = Page.ClientScript;//If not declared yet
			ClientScriptManager cs = Page.ClientScript;
			cs.RegisterStartupScript(this.GetType(), Guid.NewGuid().ToString(), sb.ToString(), false);
		}		
	}
}
