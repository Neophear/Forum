using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Stiig;

public partial class editor : System.Web.UI.UserControl
{
    public delegate void ucEventdelegate(string post, string subject);
    public event ucEventdelegate OnSubmit;

    private int Counter = 1;

    protected void Page_Load(object sender, EventArgs e)
    {
        DataAccessLayer dal = new DataAccessLayer();

        Repeater1.DataSource = dal.ExecuteDataTable("SELECT * FROM Smileys");
        Repeater1.DataBind();
    }
    protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Label label = ((Label)e.Item.FindControl("Label1"));

            label.Text = "";

            if (Counter == 1)
            {
                label.Text = "<tr>";
            }

            label.Text += "<td><a href=\"javascript:smiley('" + DataBinder.Eval(e.Item.DataItem, "Code").ToString() + "')\"><img src=\"" + ResolveClientUrl("~/images/smileys/") + DataBinder.Eval(e.Item.DataItem, "FileName").ToString() + "\" alt=\"" + DataBinder.Eval(e.Item.DataItem, "Name").ToString() + "\"></a></td>";

            if (Counter == 5)
            {
                label.Text += "</tr>";
                Counter = 0;
            }
            
            Counter++;
        }
        else if (e.Item.ItemType == ListItemType.Footer)
        {
            if (Counter != 5)
            {
                ((Label)e.Item.FindControl("Label2")).Visible = true;
            }
        }
    }
    private bool _setfocus = false;

    public bool SetFocus
    {
        get { return _setfocus; }
        set
        {
            txtPost.Focus();
            _setfocus = value;
        }
    }
    public string Title
    {
        get { return lblTitle.Text; }
        set { lblTitle.Text = value; }
    }
    public string SubTitle
    {
        get { return lblSubTitle.Text; }
        set { lblSubTitle.Text = value; }
    }
    public string Subject
    {
        get { return txtSubject.Text.Trim(); }
        set
        {
            string subject = value;

            subject = subject.Replace("<", "&#60;");
            subject = subject.Replace(">", "&#62;");

            txtSubject.Text = subject;
        }
    }
    public bool SubjectVisible
    {
        get
        {
            return lblSubject.Visible;
        }
        set
        {
            txtSubject.Visible = value;
            lblSubject.Visible = value;
        }
    }
    public string Post
    {
        get { return txtPost.Text.Trim(); }
        set
        {
            txtPost.Text = Utilities.HTMLToBB(value);
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string subject = txtSubject.Text;

        subject = subject.Replace("<", "&#60;");
        subject = subject.Replace(">", "&#62;");

        OnSubmit(txtPost.Text, subject);
    }
}