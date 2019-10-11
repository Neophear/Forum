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

public partial class createuser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
    {
        ProfileCommon profile = Profile.GetProfile(CreateUserWizard1.UserName);
        profile.Options.ShowEmail = false;
        profile.Options.NotifyPrivateMsg = false;
        profile.Options.PostsPerPage = 20;
        profile.Save();
        Roles.AddUserToRole(CreateUserWizard1.UserName, "Normal bruger");
    }
}