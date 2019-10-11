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

public partial class thread : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataAccessLayer dal = new DataAccessLayer();

        Editor1.OnSubmit += new editor.ucEventdelegate(Editor1_OnSubmit);

        if (User.Identity.IsAuthenticated)
        {
            Editor1.Visible = true;
        }
        else
        {
            Editor1.Visible = false;
        }

        dal.AddParameter("@ID", Request.QueryString["id"], DbType.Int32);
        string isVisible = dal.ExecuteScalar("SELECT COUNT(*) FROM Threads WHERE ID = @ID AND Visible = 1").ToString();
        dal.ClearParameters();

        if (isVisible == "0")
        {
            Response.Redirect("error.aspx?error=1", true);
        }

        if (!IsPostBack)
        {
            dal.AddParameter("@ID", Request.QueryString["id"], DbType.Int32);
            dal.ExecuteNonQuery("UPDATE Threads SET Views = (Views + 1) WHERE ID = @ID");
            dal.ClearParameters();

            int CurrentPage = 1;

            if (Request.QueryString["page"] != null)
            {
                CurrentPage = Convert.ToInt32(Request.QueryString["page"]);
            }

            dal.AddParameter("@ID", Request.QueryString["id"], DbType.Int32);
            DataTable table = dal.ExecuteDataTable("SELECT * FROM Threads WHERE ID = @ID");
            dal.ClearParameters();

            dal.AddParameter("@ID", Request.QueryString["id"], DbType.Int32);
            int PostCount = Convert.ToInt32(dal.ExecuteScalar("SELECT COUNT(*) FROM Posts WHERE ThreadRefID = @ID AND Visible = 1"));
            dal.ClearParameters();

            int Pages;

            if (User.Identity.IsAuthenticated)
            {
                if ((PostCount % Profile.Options.PostsPerPage) == 0)
                {
                    Pages = PostCount / Profile.Options.PostsPerPage;
                }
                else
	            {
                    Pages = PostCount / Profile.Options.PostsPerPage + 1;
	            }
            }
            else
            {
                if ((PostCount % 20) == 0)
                {
                    Pages = PostCount / 20;
                }
                else
                {
                    Pages = PostCount / 20 + 1;
                }
            }

            if (Pages > 1)
            {
                lblPages1.Text = "Gå til side ";

                if (CurrentPage > 1)
                {
                    lblPages1.Text += "<a href=\"thread.aspx?id=" + Request.QueryString["id"] + "&page=" + Convert.ToString(CurrentPage - 1) + "\">Forrige</a> ";
                }

                for (int i = 1; i < Pages + 1; i++)
                {
                    if (i == CurrentPage)
                    {
                        lblPages1.Text += i.ToString() + ", ";
                    }
                    else
                    {
                        lblPages1.Text += "<a href=\"thread.aspx?id=" + Request.QueryString["id"] + "&page=" + i.ToString() + "\">" + i.ToString() + "</a>, ";
                    }

                    if (i == Pages)
                    {
                        lblPages1.Text = lblPages1.Text.Remove(lblPages1.Text.Length - 2);
                    }
                }

                if (CurrentPage < Pages)
                {
                    lblPages1.Text += " <a href=\"thread.aspx?id=" + Request.QueryString["id"] + "&page=" + Convert.ToString(CurrentPage + 1) + "\">Næste</a>";
                }

                lblPages1.Text += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Side " + CurrentPage.ToString() + " af " + Pages.ToString();
            }
            else
            {
                lblPages1.Text = "Side 1 af 1";
            }

            lblPages2.Text = lblPages1.Text;

            string OPUser = table.Rows[0][3].ToString();
            ProfileCommon profile = Profile.GetProfile(OPUser);

            Editor1.Subject = "Sv. " + table.Rows[0][1].ToString();

            lblThreadTitle.Text = table.Rows[0][1].ToString();
            hplTitle1.Text = table.Rows[0][1].ToString();
            hplTitle1.NavigateUrl = Request.RawUrl;
            hplTitle2.Text = table.Rows[0][1].ToString();
            hplTitle2.NavigateUrl = Request.RawUrl;
            hplTitle3.Text = table.Rows[0][1].ToString();
            hplTitle3.NavigateUrl = Request.RawUrl;

            dal.AddParameter("@ID", Request.QueryString["id"], DbType.Int32);
            hplSubForum1.Text = dal.ExecuteScalar("SELECT Name FROM Forums WHERE ID = (SELECT ForumRefID FROM Threads WHERE ID = @ID)").ToString();
            dal.ClearParameters();
            dal.AddParameter("@ID", Request.QueryString["id"], DbType.Int32);
            hplSubForum1.NavigateUrl = "subforum.aspx?id=" + dal.ExecuteScalar("SELECT ForumRefID FROM Threads WHERE ID = @ID").ToString();
            dal.ClearParameters();
            hplSubForum2.Text = hplSubForum1.Text;
            hplSubForum2.NavigateUrl = hplSubForum1.NavigateUrl;

            hplUsername1.Text = OPUser;
            hplUsername1.NavigateUrl = "user.aspx?user=" + OPUser;

            if (profile.Avatar != "")
            {
                imgAvatar1.ImageUrl = "images/avatars/" + profile.Avatar;
                imgAvatar1.Visible = true;
            }

            lblCreated1.Text = Utilities.GetDate(Convert.ToDateTime(table.Rows[0][5]), true, true);
            lblPost.Text = Utilities.GetSmileys(Utilities.BBToHTML(table.Rows[0][2].ToString()), ResolveClientUrl("~/images/smileys/"));
            
            if (profile.Signature != "")
            {
                lblSignature1.Text = "<br /><br /><hr />" + Utilities.GetSmileys(Utilities.BBToHTML(profile.Signature), ResolveClientUrl("~/images/smileys/"));
                lblSignature1.Visible = true;
            }
            
            lblJoined1.Text = Membership.GetUser(OPUser).CreationDate.ToLongDateString();
            dal.AddParameter("@Username", OPUser, DbType.String);
            lblPostCount1.Text = dal.ExecuteScalar("SELECT COUNT(*) FROM Posts WHERE Author = @Username AND Visible = 1").ToString();
            dal.ClearParameters();

            int PostsPerPage = 20;
            int page = 1;

            if (User.Identity.IsAuthenticated)
            {
                PostsPerPage = Profile.Options.PostsPerPage;
            }

            if (Request.QueryString["page"] != null)
            {
                page = ((Convert.ToInt32(Request.QueryString["page"]) - 1) * PostsPerPage) + 1;
            }

            dal.AddParameter("@ID", Request.QueryString["id"], DbType.Int32);
            dal.AddParameter("@Page", page, DbType.Int32);
            dal.AddParameter("@PostsPerPage", PostsPerPage, DbType.Int32);
            Repeater1.DataSource = dal.ExecuteDataTable("DECLARE @first_id int DECLARE @startRowIndex int SET ROWCOUNT @Page SELECT @first_id = ID FROM Posts WHERE ThreadRefID = @ID SET ROWCOUNT @PostsPerPage SELECT * FROM Posts WHERE ThreadRefID = @ID AND ID >= @first_id");
            Repeater1.DataBind();
            dal.ClearParameters();
        }
    }
    void Editor1_OnSubmit(string post, string subject)
    {
        DataAccessLayer dal = new DataAccessLayer();

        dal.AddParameter("@ID", Request.QueryString["id"], DbType.Int32);
        string forumrefid = dal.ExecuteScalar("SELECT ForumRefID FROM Threads WHERE ID = @ID").ToString();
        dal.ClearParameters();

        dal.AddParameter("@Title", subject, DbType.String);
        dal.AddParameter("@Text", post, DbType.String);
        dal.AddParameter("@Author", User.Identity.Name, DbType.String);
        dal.AddParameter("@Created", DateTime.Now, DbType.DateTime);
        dal.AddParameter("@ThreadRefID", Request.QueryString["id"], DbType.Int32);
        dal.AddParameter("@ForumRefID", forumrefid, DbType.Int32);
        dal.AddParameter("@Visible", true, DbType.Boolean);
        int lastid = Convert.ToInt32(dal.ExecuteScalar("INSERT INTO Posts ([Title], [Text], [Author], [Created], ThreadRefID, ForumRefID, [Visible]) VALUES(@Title, @Text, @Author, @Created, @ThreadRefID, @ForumRefID, @Visible);SELECT @@IDENTITY"));
        dal.ClearParameters();

        Response.Redirect("thread.aspx?id=" + Request.QueryString["id"] + "&page=" + Utilities.GetPageOfPost(Convert.ToInt32(Request.QueryString["id"]), lastid, Profile.Options.PostsPerPage).ToString() + "#" + lastid.ToString());
    }
    protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            DataAccessLayer dal = new DataAccessLayer();
            
            Label lblCreated2 = (Label)e.Item.FindControl("lblCreated2");
            Label lblJoined2 = (Label)e.Item.FindControl("lblJoined2");
            Label lblPostCount2 = (Label)e.Item.FindControl("lblPostCount2");
            Label lblSignature2 = (Label)e.Item.FindControl("lblSignature2");

            lblCreated2.Text = Utilities.GetDate(Convert.ToDateTime(DataBinder.Eval(e.Item.DataItem, "Created")), true, true);
            lblJoined2.Text = Membership.GetUser(DataBinder.Eval(e.Item.DataItem, "Author").ToString()).CreationDate.ToLongDateString();
            dal.AddParameter("@Username", DataBinder.Eval(e.Item.DataItem, "Author"), DbType.String);
            lblPostCount2.Text = dal.ExecuteScalar("SELECT COUNT(*) FROM Posts WHERE Author = @Username").ToString();
            dal.ClearParameters();
            ProfileCommon profile = Profile.GetProfile(DataBinder.Eval(e.Item.DataItem, "Author").ToString());
            
            if (profile.Signature != "")
            {
                lblSignature2.Text = "<br /><br /><hr />" + Utilities.GetSmileys(Utilities.BBToHTML(profile.Signature), ResolveClientUrl("~/images/smileys/"));
                lblSignature2.Visible = true;
            }

            if (profile.Avatar != "")
            {
                Image imgAvatar2 = (Image)e.Item.FindControl("imgAvatar2");
                imgAvatar2.ImageUrl = ResolveClientUrl("~/images/avatars/" + profile.Avatar);
                imgAvatar2.Visible = true;
            }
        }
    }
    protected void imgbtnReplyWithQuote1_Click(object sender, ImageClickEventArgs e)
    {
        Editor1.Post += "\n[quote=" + hplUsername1.Text + "]" + lblPost.Text + "[/quote]\n";
        Editor1.SetFocus = true;
    }
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName.ToString() == "Reply")
        {
            DataAccessLayer dal = new DataAccessLayer();

            dal.AddParameter("@ID", e.CommandArgument, DbType.Int32);
            DataTable table = dal.ExecuteDataTable("SELECT [Title], [Text], Author FROM Posts WHERE ID = @ID");
            
            if (Editor1.Subject == ("Sv. " + hplTitle1.Text))
            {
                Editor1.Subject = "Sv. " + table.Rows[0][0].ToString();
            }
            
            Editor1.Post += "\n[quote=" + table.Rows[0][2].ToString() + "]" + table.Rows[0][1].ToString() + "[/quote]\n";
            Editor1.SetFocus = true;
        }
    }
}