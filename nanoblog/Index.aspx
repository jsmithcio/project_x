<%@ Page Title="" Language="C#" MasterPageFile="~/BlogHome.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="nanoblog.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
	<asp:Panel ID="contentModalPanel" runat="server">
		<asp:PlaceHolder runat="server" ID="contentModalPH"></asp:PlaceHolder>
	</asp:Panel>
<!-- Blog Heading -->
	<h1 class="my-4">
		<asp:PlaceHolder ID="phPageHeading" runat="server"></asp:PlaceHolder>
		<small><asp:PlaceHolder ID="phSecondaryHeading" runat="server"></asp:PlaceHolder></small>
	</h1>
	<!-- Blog Post (Summary) -->
	<div class="card mb-4">
		<asp:Panel id="pnlBlogPost" runat="server" ClientIDMode="Static">
            <asp:PlaceHolder ID="phBlogImage" runat="server"></asp:PlaceHolder>            
				<div class="card-body">			
				  <h2 class="card-title">
					  <asp:PlaceHolder ID="phBlogTitle" runat="server"></asp:PlaceHolder>
				  </h2>			  
				  <p class="card-text">
					  <asp:PlaceHolder ID="phBlogSummary" runat="server"></asp:PlaceHolder>
				  </p>
					  <asp:PlaceHolder ID="phReadMore" runat="server"></asp:PlaceHolder>
				</div>
				<div class="card-footer text-muted">
					<asp:PlaceHolder ID="phBlogDate" runat="server"></asp:PlaceHolder>&nbsp;by			  
					<asp:PlaceHolder ID="phBlogAuthor" runat="server"></asp:PlaceHolder> 
				</div>          
		</asp:Panel>
	</div>
</asp:Content>
