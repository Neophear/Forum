using System;
using System.Data;
using System.Drawing;
using System.Drawing.Imaging;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Stiig;

public partial class private_manageaccount : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Editor1.OnSubmit += new editor.ucEventdelegate(Editor1_OnSubmit);
        lblSaved.ForeColor = System.Drawing.Color.Empty;

        if (!IsPostBack)
        {
            drpDay.Items.Add("-Dag-");
            drpYear.Items.Add("-År-");

            for (int i = 1; i < 32; i++)
            {
                drpDay.Items.Add(i.ToString());
            }
            for (int i = 1900; i < DateTime.Today.Year - 6; i++)
            {
                drpYear.Items.Add(i.ToString());
            }

            Update();
        }
    }
    void Editor1_OnSubmit(string post, string subject)
    {
        Profile.Signature = post;
        lblSaved.Text = "Din signatur blev gemt.<br /><br />";
        lblSaved.Visible = true;
        Update();
    }
    protected void btnRegisteringInfo_Click(object sender, EventArgs e)
    {
        MembershipUser user = Membership.GetUser(User.Identity.Name);
        user.Email = txtEmail.Text;
        Membership.UpdateUser(user);
        lblSaved.Text = "Din email blev ændret.<br /><br />";
        lblSaved.Visible = true;
        Update();
    }
    protected void btnChangePassword_Click(object sender, EventArgs e)
    {
        MembershipUser user = Membership.GetUser(User.Identity.Name);
        
        if (user.ChangePassword(txtPassword.Text, txtNewPassword.Text))
        {
            lblSaved.Text = "Dit password blev ændret.<br /><br />";
        }
        else
        {
            lblSaved.Text = "Du har angivet forkert password. Prøv igen.<br /><br />";
            lblSaved.ForeColor = System.Drawing.Color.Red;
        }
        lblSaved.Visible = true;
        
        Update();
    }
    protected void btnPersonal_Click(object sender, EventArgs e)
    {
        lblSaved.Text = "Dine personlige informationer er blevet gemt.<br /><br />";
        Profile.Personal.FirstName = txtFirstname.Text;
        Profile.Personal.LastName = txtLastname.Text;

        if (rdbGender1.Checked)
        {
            Profile.Personal.Gender = true;
        }
        else if (rdbGender2.Checked)
        {
            Profile.Personal.Gender = false;
        }

        if (drpDay.SelectedIndex > 0 || drpMonth.SelectedIndex > 0 || drpYear.SelectedIndex > 0)
        {
            if (Convert.ToInt32(drpDay.SelectedValue) <= DateTime.DaysInMonth(Convert.ToInt32(drpYear.SelectedValue), Convert.ToInt32(drpMonth.SelectedValue)))
            {
                Profile.Personal.BirthDate = Convert.ToDateTime(drpDay.SelectedValue + "-" + drpMonth.SelectedValue + "-" + drpYear.SelectedValue);
                lblSaved.ForeColor = System.Drawing.Color.Empty;
                lblWrongDate.Visible = false;
            }
            else
            {
                lblWrongDate.Text = "<br />Der er ikke " + drpDay.SelectedValue + " dage i " + drpMonth.SelectedItem + " i år "+ drpYear.SelectedValue;
                lblWrongDate.ForeColor = System.Drawing.Color.Red;
                lblWrongDate.Visible = true;
                lblSaved.Text = "Fødselsdag er forkert.<br /><br />";
                lblSaved.ForeColor = System.Drawing.Color.Red;
                lblSaved.Visible = true;
            }
        }
        else if (drpDay.SelectedIndex == 0 | drpMonth.SelectedIndex == 0 | drpYear.SelectedIndex == 0)
        {
            Profile.Personal.BirthDate = Convert.ToDateTime(null);
        }
        
        Profile.Personal.City = txtCity.Text;
        Profile.Personal.Country = txtCountry.Text;

        lblSaved.Visible = true;

        Update();
    }
    protected void btnProfileInfo_Click(object sender, EventArgs e)
    {
        Profile.Homepage = txtHomepage.Text;
        Profile.Messenger = txtMessenger.Text;
        Profile.Interests = txtInterests.Text;
        Profile.Occupation = txtOccupation.Text;

        lblSaved.Text = "Dine profilinformationer blev gemt.<br /><br />";
        lblSaved.Visible = true;

        Update();
    }
    protected void btnAvatar_Click(object sender, EventArgs e)
    {
        if (ckbDeleteAvatar.Checked)
        {
            if (Profile.Avatar != "")
            {
                File.Delete(Server.MapPath("~/images/avatars/") + Profile.Avatar);
                Profile.Avatar = "";

                lblSaved.Text = "Din avatar er slettet.<br /><br />";
                lblSaved.Visible = true;
                Update();
            }
            ckbDeleteAvatar.Checked = false;
        }
        else
        {
            if (fupAvatar.HasFile)
            {
                if (IsImage(fupAvatar.FileName))
                {
                    if (Profile.Avatar != "")
                    {
                        File.Delete(Server.MapPath("~/images/avatars/") + Profile.Avatar);
                    }

                    fupAvatar.SaveAs(Server.MapPath("~/images/avatars/") + "original_" + User.Identity.Name + Path.GetExtension(fupAvatar.FileName));

                    Utilities.CreateThumbnail(Server.MapPath("~/images/avatars/") + "original_" + User.Identity.Name + Path.GetExtension(fupAvatar.FileName), Server.MapPath("~/images/avatars/") + User.Identity.Name + Path.GetExtension(fupAvatar.FileName), 140F, 300F);

                    File.Delete(Server.MapPath("~/images/avatars/") + "original_" + User.Identity.Name + Path.GetExtension(fupAvatar.FileName));

                    Profile.Avatar = User.Identity.Name + Path.GetExtension(fupAvatar.FileName);

                    lblSaved.Text = "Din avatar er gemt.<br /><br />";
                    lblSaved.Visible = true;
                }
                else
                {
                    lblSaved.Text = "Du kan kun uploade et billede.<br /><br />";
                    lblSaved.ForeColor = System.Drawing.Color.Red;
                    lblSaved.Visible = true;
                }
            }
            else
            {
                lblSaved.Text = "Du skal angive et gyldigt billede.<br /><br />";
                lblSaved.ForeColor = System.Drawing.Color.Red;
                lblSaved.Visible = true;
            }
        }

        Update();
    }
    protected void btnOptions_Click(object sender, EventArgs e)
    {
        Profile.Options.ShowEmail = ckbShowEmail.Checked;
        Profile.Options.NotifyPrivateMsg = ckbNotifyPrivateMsg.Checked;
        Profile.Options.PostsPerPage = Convert.ToInt32(drpPostsPerPage.SelectedValue);

        lblSaved.Text = "Dine indstillinger blev gemt.<br /><br />";
        lblSaved.Visible = true;

        Update();
    }
    private bool IsImage(string filename)
    {
        bool isimage = false;

        switch (Path.GetExtension(filename))
        {
            case ".bmp":
                isimage = true;
                break;
            case ".gif":
                isimage = true;
                break;
            case ".jpe":
                isimage = true;
                break;
            case ".jpeg":
                isimage = true;
                break;
            case ".jpg":
                isimage = true;
                break;
            case ".png":
                isimage = true;
                break;
            default:
                isimage = false;
                break;
        }

        return isimage;
    }
    private void Update()
    {
        txtEmail.Text = Membership.GetUser(User.Identity.Name).Email;

        txtFirstname.Text = Profile.Personal.FirstName;
        txtLastname.Text = Profile.Personal.LastName;

        if (Profile.Personal.Gender)
        {
            rdbGender1.Checked = true;
            rdbGender2.Checked = false;
        }
        else if (Profile.Personal.Gender == false)
        {
            rdbGender1.Checked = false;
            rdbGender2.Checked = true;
        }
        else
        {
            rdbGender1.Checked = false;
            rdbGender2.Checked = false;
        }

        if (Profile.Personal.BirthDate != Convert.ToDateTime(null))
        {
            drpDay.SelectedIndex = Profile.Personal.BirthDate.Day;
            drpMonth.SelectedIndex = Profile.Personal.BirthDate.Month;
            drpYear.SelectedIndex = Profile.Personal.BirthDate.Year - 1899;
        }

        txtCity.Text = Profile.Personal.City;
        txtCountry.Text = Profile.Personal.Country;

        txtHomepage.Text = Profile.Homepage;
        txtMessenger.Text = Profile.Messenger;
        txtInterests.Text = Profile.Interests;
        txtOccupation.Text = Profile.Occupation;

        if (Profile.Avatar != "")
        {
            imgAvatar.ImageUrl = "../images/avatars/" + Profile.Avatar;
            imgAvatar.Visible = true;
        }
        else
        {
            imgAvatar.Visible = false;
        }

        ckbShowEmail.Checked = Profile.Options.ShowEmail;
        ckbNotifyPrivateMsg.Checked = Profile.Options.NotifyPrivateMsg;
        drpPostsPerPage.SelectedValue = Profile.Options.PostsPerPage.ToString();

        Editor1.Post = Profile.Signature;
    }
}