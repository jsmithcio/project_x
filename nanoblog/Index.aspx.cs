using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using nanoblog.Models;
using nanoblog.Data_Access;
using Serilog;
using System.Configuration;

namespace nanoblog
{
	public partial class Index : PageBase
	{
		private Blog blog;
		private BlogDAL blogDal;
		static bool enable = true;			

		public static string DefaultQueryStringKey { get; } = "blg";

		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				DisplayReadMore(phReadMore);
			}
			else if (enable)
			{
				DisplayReadMore(phReadMore);
			}

			contentModalPanel.Visible = false;
			pnlBlogPost.Visible = false;

			MissionControl();
		}

		

		protected void MissionControl()
		{
			
			InitBlog();
			//InitModal();
			phPageHeading.Controls.Add(new LiteralControl(blog.PrimaryHeader));
			phSecondaryHeading.Controls.Add(new LiteralControl(blog.SecondaryHeader));
			phBlogTitle.Controls.Add(new LiteralControl(blog.BlogName));
			DisplayBlogImage(phBlogImage);
			phBlogSummary.Controls.Add(new LiteralControl(blog.BlogSummary));
			phBlogDate.Controls.Add(new LiteralControl(blog.DateCreated.ToLongDateString()));
			phBlogAuthor.Controls.Add(new LiteralControl(blog.Author));
			pnlBlogPost.Visible = true;

						
		}

		

		protected void InitBlog()
		{
			//cs = new ClientScriptManager();
			GetBlogObjects(GetValueFromQueryString(DefaultQueryStringKey));
		}

		protected void GetBlogObjects(string strBlogId)
		{
			blogDal = new BlogDAL();	
			blog = blogDal.LoadBlogData(strBlogId);
		}		

		protected void lnkButton_Click(object sender, EventArgs e)
		{
			Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "script", "<script>alert('Read More Button Clicked')</script>");
		}

		protected void InitModal()
		{
			Modal modal = new Modal
			{
				ModalId = "modalDialog",
				ModalTitle = "generic modal title",
				ModalContent = "your modal worked.",
				ButtonOneText = "Ok",
				ButtonTwoText = "Close"
			};

			LoadMph(modal, contentModalPanel, contentModalPH);
		}		

		protected void DisplayBlogImage(PlaceHolder ph)
		{
			//Keeping the images in the images folder for simplicity
			//but storing the image info & path in the db
			Image image = new Image();
			image.AlternateText = blog.BlogImageAlt;
			image.ImageUrl = "/Images/" + blog.BlogImagePath;
			image.CssClass = "card-img-top";
			ph.Controls.Add(image);
		}

		protected void DisplayReadMore(PlaceHolder ph)
		{
			//todo - add link to linkbutton
			LinkButton lnkButton = new LinkButton();
			lnkButton.ID = "lnkReadMore";
			lnkButton.Text = "Read More";
			lnkButton.CssClass = "btn btn-primary btn-sm";
			lnkButton.Click += new System.EventHandler(lnkButton_Click);
			ph.Controls.Add(lnkButton);
			lnkButton.Visible = enable;
		}

		//protected void DisplayBlogHeadingOne(PlaceHolder ph) => ph.Controls.Add(new LiteralControl(blog.PrimaryHeader));
		//protected void DisplayBlogHeadingTwo(PlaceHolder ph) => ph.Controls.Add(new LiteralControl(blog.SecondaryHeader));
		//protected void DisplayBlogTitle(PlaceHolder ph) => ph.Controls.Add(new LiteralControl(blog.BlogName));
		//protected void DisplayBlogSummary(PlaceHolder ph) => ph.Controls.Add(new LiteralControl(blog.BlogSummary));
		//protected void DisplayBlogDate(PlaceHolder ph) => ph.Controls.Add(new LiteralControl(blog.DateCreated.ToLongDateString()));
		//protected void DisplayBlogAuthor(PlaceHolder ph) => ph.Controls.Add(new LiteralControl(blog.Author));

		protected void LoadBlogHeader(PlaceHolder ph)
		{
			//deprecated
			////string imgPath = "http://placehold.it/750x300";
			//string imgAlt = string.Empty;
			//string postTitle = string.Empty;

			StringBuilder bp = new StringBuilder();
			bp.Append(@"<div class=""card mb-4"">");
			bp.Append(@"<img class=""card-img-top"" src=""");
			bp.Append(blog.BlogImagePath);
			bp.Append(@""" alt=""");
			bp.Append(blog.BlogImageAlt);
			bp.Append(@""">");
			//bp.Append(@"<img class=""card-img-top"" src=""http://placehold.it/750x300"" alt=""Card image cap"">");
			bp.Append(@"<div class=""card-body"">");
			bp.Append(@"<h2 class=""card-title"">");
			bp.Append(blog.BlogName);
			bp.Append(@"</h2>");
			bp.Append(@"<p class=""card-text"">");
			bp.Append(blog.BlogSummary);
			bp.Append(@"</p>");
			bp.Append(@"<a href=""#"" class=""btn btn-primary"">Read More &rarr;</a>");
			bp.Append(@"</div>");
			bp.Append(@"<div class=""card-footer text-muted"">");
			bp.Append(@"Posted on January 1, 2017 by");
			bp.Append(@"<a href=""#"">Start Bootstrap</a>");
			bp.Append(@"</div>");
			bp.Append(@"</div>");
		}
	}
}