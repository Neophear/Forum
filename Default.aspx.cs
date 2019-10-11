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

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataAccessLayer dal = new DataAccessLayer();

        if (User.Identity.IsAuthenticated)
        {
            Repeater1.DataSource = dal.ExecuteDataTable("SELECT * FROM Topics T WHERE (SELECT COUNT(*) FROM Forums F WHERE F.TopicRefID = T.ID AND F.Visible = 1) > 0");
            Repeater1.DataBind();
        }
        else
        {
            Repeater1.DataSource = dal.ExecuteDataTable("SELECT * FROM Topics T WHERE (SELECT COUNT(*) FROM Forums F WHERE F.TopicRefID = T.ID AND F.Visible = 1 AND F.VisibleWhenAnonymous = 1) > 0");
            Repeater1.DataBind();
        }

        lblUsersOnline.Text = Membership.GetNumberOfUsersOnline().ToString();
        
        if (Membership.GetNumberOfUsersOnline() != 0)
        {
            string usersOnline = "";
            
            foreach (MembershipUser userOnline in Utilities.GetOnlineUsers())
            {
                if (Roles.IsUserInRole(userOnline.UserName, "Admin"))
                {
                    usersOnline += "<a href=\"user.aspx?user=" + userOnline.UserName + "\" style=\"color:#0098ca\">" + userOnline.UserName + "</a>, ";
                }
                else if (Roles.IsUserInRole(userOnline.UserName, "Moderator"))
                {
                    usersOnline += "<a href=\"user.aspx?user=" + userOnline.UserName + "\" style=\"color:#b3c9d7\">" + userOnline.UserName + "</a>, ";
                }
                else
                {
                    usersOnline += "<a href=\"user.aspx?user=" + userOnline.UserName + "\">" + userOnline.UserName + "</a>, ";
                }
            }

            lblWhoIsOnline.Text = Utilities.RemoveEndString(usersOnline, ", ");
        }

        hplNewestMember.Text = dal.ExecuteScalar("SELECT UserName FROM aspnet_Users WHERE UserId = (SELECT TOP 1 UserId FROM aspnet_Membership WHERE IsApproved = 1 AND IsLockedOut = 0 ORDER BY CreateDate DESC)").ToString();
        hplNewestMember.NavigateUrl = "user.aspx?user=" + hplNewestMember.Text;
        lblUserCount.Text = Membership.GetAllUsers().Count.ToString();
        lblCurrentTime.Text = DateTime.Now.ToLongDateString() + " " + DateTime.Now.ToLongTimeString();
        lblTotalPosts.Text = dal.ExecuteScalar("SELECT COUNT(*) FROM Posts WHERE Visible = 1").ToString();
        lblTotalThreads.Text = dal.ExecuteScalar("SELECT COUNT(*) FROM Threads WHERE Visible = 1").ToString();
    }
    protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            DataAccessLayer dal = new DataAccessLayer();

            Repeater Repeater2 = (Repeater)e.Item.FindControl("Repeater2");

            dal.AddParameter("@ID", DataBinder.Eval(e.Item.DataItem, "ID"), DbType.Int32);
            Repeater2.DataSource = dal.ExecuteDataTable("SELECT Forums.ID, Forums.Name, Forums.Description, (SELECT COUNT(*) FROM Threads WHERE Threads.ForumRefID = Forums.ID AND Threads.Visible = 1) AS ThreadCount, (SELECT COUNT(*) FROM Posts WHERE Posts.ForumRefID = Forums.ID AND Posts.Visible = 1) AS PostCount, (SELECT TOP 1 Posts.Created FROM Posts WHERE Posts.ForumRefID = Forums.ID AND Posts.Visible = 1 ORDER BY Posts.Created DESC) AS LastCreated, (SELECT TOP 1 Posts.Author FROM Posts WHERE Posts.ForumRefID = Forums.ID AND Posts.Visible = 1 ORDER BY Posts.Created DESC) AS LastAuthor, (SELECT TOP 1 Posts.ThreadRefID FROM Posts WHERE Posts.ForumRefID = Forums.ID AND Posts.Visible = 1 ORDER BY Posts.Created DESC) AS LastThreadID, (SELECT TOP 1 Posts.ID FROM Posts WHERE Posts.ForumRefID = Forums.ID AND Posts.Visible = 1 ORDER BY Posts.Created DESC) AS LastPostID FROM Forums WHERE Forums.TopicRefID = @ID AND Forums.Visible = 1");
            dal.ClearParameters();
            Repeater2.DataBind();
        }
    }
    protected void Repeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            DataAccessLayer dal = new DataAccessLayer();

            Panel Panel1 = (Panel)e.Item.FindControl("Panel1");
            Label lblNoLastPost = (Label)e.Item.FindControl("Label1");
            Label lblLastCreated = (Label)e.Item.FindControl("lblLastCreated");
            HyperLink hplLastPost = (HyperLink)e.Item.FindControl("hplLastPost");
            int PostsPerPage = 20;

            if (User.Identity.IsAuthenticated)
            {
                PostsPerPage = Profile.Options.PostsPerPage;
            }

            if (DataBinder.Eval(e.Item.DataItem, "PostCount").ToString() != "0")
            {
                Panel1.Visible = true;
                lblNoLastPost.Visible = false;

                lblLastCreated.Text = Utilities.GetDate(Convert.ToDateTime(DataBinder.Eval(e.Item.DataItem, "LastCreated")), false, true);
                hplLastPost.NavigateUrl = "thread.aspx?id=" + DataBinder.Eval(e.Item.DataItem, "LastThreadID").ToString() + "&page=" + Utilities.GetPageOfPost(Convert.ToInt32(DataBinder.Eval(e.Item.DataItem, "LastThreadID")), Convert.ToInt32(DataBinder.Eval(e.Item.DataItem, "LastPostID")), PostsPerPage) + "#" + DataBinder.Eval(e.Item.DataItem, "LastPostID").ToString();
            }
            else
            {
                Panel1.Visible = false;
                lblNoLastPost.Visible = true;
            }
        }
    }
}