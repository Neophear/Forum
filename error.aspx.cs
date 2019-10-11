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

public partial class error : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string errorCode;

        if (Request.QueryString["error"] != null)
        {
            errorCode = Request.QueryString["error"].ToString();
        }
        else
        {
            errorCode = "";
        }

        switch (errorCode)
        {
            case "1":
                lblErrorMsg.Text = "Brugeren eksisterer ikke eller er blevet slettet.";
                break;
            case "401":
                lblErrorMsg.Text = "Du har ikke rettigheder til at se denne side/fil.";
                break;
            case "403":
                lblErrorMsg.Text = "Du har ikke adgang til denne side/fil.";
                break;
            case "404":
                lblErrorMsg.Text = "Du har efterspurgt en side/fil som ikke eksisterer.";
                break;
            case "408":
                lblErrorMsg.Text = "Din forespørgsel udløb. Prøv igen.";
                break;
            default:
                lblErrorMsg.Text = "";
                break;
        }
    }
}