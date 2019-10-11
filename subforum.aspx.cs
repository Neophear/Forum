using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Stiig;

public partial class subforum : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataAccessLayer dal = new DataAccessLayer();

        dal.AddParameter("@ID", Request.QueryString["id"], DbType.Int32);
        int authenticatecount = (int)dal.ExecuteScalar("SELECT COUNT(*) FROM Forums WHERE ID = @ID AND Visible = 0");
        dal.ClearParameters();

        if (authenticatecount != 0)
        {
            Response.Redirect("error.aspx?error=401", true);
        }

        if (!User.Identity.IsAuthenticated)
        {
            dal.AddParameter("@ID", Request.QueryString["id"], DbType.Int32);
            authenticatecount = (int)dal.ExecuteScalar("SELECT COUNT(*) FROM Forums WHERE ID = @ID AND VisibleWhenAnonymous = 0");
            dal.ClearParameters();

            if (authenticatecount != 0)
            {
                Response.Redirect("error.aspx?error=401", true);
            }
        }

        hplCreateThread1.Enabled = User.Identity.IsAuthenticated;
        hplCreateThread2.Enabled = User.Identity.IsAuthenticated;
        hplCreateThread1.NavigateUrl = "createthread.aspx?forumid=" + Request.QueryString["id"];
        hplCreateThread2.NavigateUrl = "createthread.aspx?forumid=" + Request.QueryString["id"];

        dal.AddParameter("@ID", Request.QueryString["id"], DbType.Int32);
        HyperLink2.Text = dal.ExecuteScalar("SELECT Name FROM Forums WHERE ID = @ID").ToString();
        dal.ClearParameters();
        HyperLink2.NavigateUrl = "subforum.aspx?id=" + Request.QueryString["id"];

        dal.AddParameter("@ID", Request.QueryString["id"], DbType.Int32);
        string count = dal.ExecuteScalar("SELECT COUNT(*) FROM Threads WHERE ForumRefID = @ID AND Visible = 1").ToString();
        dal.ClearParameters();

        if (count != "0")
        {
            dal.AddParameter("@ID", Request.QueryString["id"], DbType.Int32);
            Repeater1.DataSource = dal.ExecuteDataTable("SELECT Threads.ID, Threads.Title, Threads.Author, Threads.Views, (SELECT COUNT(*) FROM Posts WHERE Posts.ThreadRefID = Threads.ID AND Posts.Visible = 1) AS PostCount, Threads.Created, Threads.TypeRefID, (SELECT TOP 1 Posts.Author FROM Posts WHERE Posts.ThreadRefID = Threads.ID AND Posts.Visible = 1 ORDER BY Posts.Created DESC) AS LastAuthor, (SELECT TOP 1 Posts.Created FROM Posts WHERE Posts.ThreadRefID = Threads.ID AND Posts.Visible = 1 ORDER BY Posts.Created DESC) AS LastCreated, (SELECT TOP 1 Posts.ID FROM Posts WHERE Posts.ThreadRefID = Threads.ID AND Posts.Visible = 1 ORDER BY Posts.Created DESC) AS LastID FROM Threads WHERE Threads.ForumRefID = @ID AND Threads.Visible = 1 ORDER BY Threads.Created DESC");
            Repeater1.DataBind();
            dal.ClearParameters();
            Repeater1.Visible = true;
        }
        else
        {
            Label1.Visible = true;
        }

        HyperLink1.NavigateUrl = HyperLink2.NavigateUrl;
        dal.AddParameter("@ID", Request.QueryString["id"], DbType.Int32);
        HyperLink1.Text = HyperLink2.Text;
        dal.ClearParameters();
    }
    protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            int PostsPerPage = 20;

            if (User.Identity.IsAuthenticated)
	        {
        		 PostsPerPage = Profile.Options.PostsPerPage;
	        }
            
            HyperLink hplLastPost = (HyperLink)e.Item.FindControl("hplLastPost");
            Panel pnlLastPost = (Panel)e.Item.FindControl("pnlLastPost");
            Panel pnlNoLastPost = (Panel)e.Item.FindControl("pnlNoLastPost");
            Label lblLastCreated = (Label)e.Item.FindControl("lblLastCreated");

            if (DataBinder.Eval(e.Item.DataItem, "PostCount").ToString() == "0")
            {
                pnlLastPost.Visible = false;
                pnlNoLastPost.Visible = true;
            }
            else
            {
                lblLastCreated.Text = Utilities.GetDate(Convert.ToDateTime(DataBinder.Eval(e.Item.DataItem, "LastCreated")), true, true);
                hplLastPost.NavigateUrl = "thread.aspx?id=" + DataBinder.Eval(e.Item.DataItem, "ID").ToString() + "&page=" + Utilities.GetPageOfPost((int)DataBinder.Eval(e.Item.DataItem, "ID"), (int)DataBinder.Eval(e.Item.DataItem, "LastID"), PostsPerPage).ToString() + "#" + DataBinder.Eval(e.Item.DataItem, "LastID").ToString();
            }
        }
    }
}