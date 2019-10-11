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

public partial class createthread : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Editor1.OnSubmit += new editor.ucEventdelegate(Editor1_OnSubmit);
    }

    void Editor1_OnSubmit(string post, string subject)
    {
        DataAccessLayer dal = new DataAccessLayer();

        dal.AddParameter("@Title", subject, DbType.String);
        dal.AddParameter("@Text", post, DbType.String);
        dal.AddParameter("@Author", User.Identity.Name, DbType.String);
        dal.AddParameter("@Created", DateTime.Now, DbType.DateTime);
        dal.AddParameter("@TypeRefID", 1, DbType.Int32);
        dal.AddParameter("@ForumRefID", Request.QueryString["forumid"], DbType.Int32);
        string lastthreadid = dal.ExecuteScalar("INSERT INTO Threads ([Title], [Text], [Author], [Views], [Created], [TypeRefID], [ForumRefID], [Visible], [Locked]) VALUES(@Title, @Text, @Author, 0, @Created, @TypeRefID, @ForumRefID, 1, 0);SELECT @@IDENTITY").ToString();
        dal.ClearParameters();

        Response.Redirect("thread.aspx?id=" + lastthreadid);
    }
}