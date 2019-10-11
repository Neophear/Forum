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

public partial class user : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUsername = Request.QueryString["user"];
        decimal PostCount;
        decimal PostCountTotal;
        MembershipUser user = Membership.GetUser(strUsername);
        ProfileCommon userprofile = Profile.GetProfile(strUsername);
        DataAccessLayer dal = new DataAccessLayer();

        if (strUsername != "")
        {
            if (Membership.FindUsersByName(strUsername).Count == 0)
            {
                Response.Redirect("error.aspx?error=1");
            }
        }
        else
        {
            Response.Redirect("error.aspx?error=1");
        }

        lblUsername1.Text = strUsername;
        lblUsername2.Text = strUsername;
        lblUsername3.Text = strUsername;
        lblRank.Text = Roles.GetRolesForUser(strUsername).GetValue(0).ToString();
        hplFindPostsByUser.Text = "Find alle posts skrevet af " + user.UserName;
        hplFindPostsByUser.NavigateUrl = "search.aspx?author=" + user.UserName;

        if (userprofile.Options.ShowEmail & user.Email != "")
        {
            hplEmail.Visible = true;
            hplEmail.NavigateUrl = "mailto:" + user.Email;
        }

        if (userprofile.Messenger != "")
        {
            lblMsn.Visible = true;
            lblMsn.Text = userprofile.Messenger;
        }

        lblCreated.Text = Utilities.GetDate(user.CreationDate, true, false);
        
        if (user.IsOnline)
        {
            lblLastOnline.Text = "Online nu!";
        }
        else
        {
            lblLastOnline.Text = Utilities.GetDate(user.LastActivityDate, true, true);
        }

        dal.AddParameter("Author", strUsername, DbType.String);
        PostCount = Convert.ToDecimal(dal.ExecuteScalar("SELECT COUNT(*) FROM Posts WHERE Author = @Author"));
        dal.ClearParameters();

        PostCountTotal = Convert.ToDecimal(dal.ExecuteScalar("SELECT COUNT(*) FROM Posts"));

        lblPostCount.Text = PostCount.ToString();
        lblPostPercentOfTotal.Text = Convert.ToString(Math.Round(((PostCount / PostCountTotal) * 100),2));

        lblPostsPerDay.Text = Convert.ToString(Math.Round((PostCount / Convert.ToInt32(Utilities.RemoveEndString(Convert.ToString(DateTime.Today.AddDays(1) - user.CreationDate.Date), ".00:00:00"))), 2));

        lblLocation.Text = userprofile.Personal.Country;

        if (userprofile.Homepage != "")
        {
            hplHomepage.Visible = true;
            hplHomepage.NavigateUrl = userprofile.Homepage;
            hplHomepage.Text = userprofile.Homepage;
        }

        lblOccupation.Text = userprofile.Occupation;
        lblInterests.Text = userprofile.Interests;
    }
}