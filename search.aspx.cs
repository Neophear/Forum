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

public partial class search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataAccessLayer dal = new DataAccessLayer();

        if (!IsPostBack)
        {
            drplstForum.DataSource = dal.ExecuteDataTable("SELECT * FROM Topics");
            drplstForum.DataTextField = "Name";
            drplstForum.DataValueField = "ID";
            drplstForum.DataBind();
        }
    }
    protected void drplstForum_SelectedIndexChanged(object sender, EventArgs e)
    {
        drplstCategory.Items.Clear();

        if (drplstForum.SelectedIndex != 0)
        {
            DataAccessLayer dal = new DataAccessLayer();
            string searchAsAnonymous = "";
            DataTable categories;

            if (User.Identity.IsAuthenticated)
            {
                searchAsAnonymous = " AND VisibleWhenAnonymous = 1";
            }

            dal.AddParameter("@TopicRefID", drplstForum.SelectedValue, DbType.Int32);
            categories = dal.ExecuteDataTable("SELECT ID, Name FROM Forums WHERE TopicRefID = @TopicRefID AND Visible = 1" + searchAsAnonymous);
            dal.ClearParameters();

            drplstCategory.Items.Add(new ListItem("-Alle-", "0"));

            foreach (DataRow category in categories.Rows)
            {
                drplstCategory.Items.Add(new ListItem(category[1].ToString(), category[0].ToString()));
            }

            drplstCategory.DataBind();
            drplstCategory.Enabled = true;
        }
        else
        {
            drplstCategory.Enabled = false;
        }
    }
}