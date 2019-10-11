using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.IO;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Stiig;

public partial class admin_manageforum : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblSaved.Visible = false;
        lblSaved.ForeColor = System.Drawing.Color.Empty;

        if (!IsPostBack)
        {
            DataAccessLayer dal = new DataAccessLayer();

            drpDeleteTopicChoose.DataSource = dal.ExecuteDataTable("SELECT * FROM Topics");
            drpDeleteTopicChoose.DataBind();
        }
    }
    protected void btnNewTopicSave_Click(object sender, EventArgs e)
    {
        DataAccessLayer dal = new DataAccessLayer();

        dal.AddParameter("@Name", txtNewTopicName.Text, DbType.String);
        int count = Convert.ToInt32(dal.ExecuteScalar("SELECT COUNT(*) FROM Topics WHERE [Name] = @Name"));
        dal.ClearParameters();

        if (count == 0)
        {
            dal.AddParameter("@Name", txtNewTopicName.Text, DbType.String);
            dal.ExecuteNonQuery("INSERT INTO Topics ([Name]) VALUES(@Name)");
            dal.ClearParameters();
            lblSaved.Text = "Emnet blev oprettet.<br /><br />";
            lblSaved.Visible = true;
            Reset();
        }
        else
        {
            lblSaved.Text = "Emnet eksisterer i forvejen.<br /><br />";
            lblSaved.ForeColor = System.Drawing.Color.Red;
            lblSaved.Visible = true;
        }
    }
    protected void btnDeleteTopic_Click(object sender, EventArgs e)
    {
        DataAccessLayer dal = new DataAccessLayer();

        dal.AddParameter("@TopicRefID", drpDeleteTopicChoose.SelectedValue, DbType.Int32);
        DataTable forums = dal.ExecuteDataTable("SELECT ID FROM Forums WHERE TopicRefID = @TopicRefID AND Visible = 1");
        dal.ClearParameters();

        foreach (DataRow row in forums.Rows)
        {
            dal.AddParameter("@ForumRefID", row[0], DbType.Int32);
            dal.ExecuteNonQuery("UPDATE Threads SET Visible = 0 WHERE ForumRefID = @ForumRefID");
            dal.ClearParameters();
        }

        dal.AddParameter("@TopicRefID", drpDeleteTopicChoose.SelectedValue, DbType.Int32);
        dal.ExecuteNonQuery("UPDATE Forums SET Visible = 0 WHERE TopicRefID = @TopicRefID");
        dal.ClearParameters();

        dal.AddParameter("@ID", drpDeleteTopicChoose.SelectedValue, DbType.Int32);
        dal.ExecuteNonQuery("DELETE FROM Topics WHERE ID = @ID");
        dal.ClearParameters();
    }
    protected void btnNewSmileySave_Click(object sender, EventArgs e)
    {
        if (fupNewSmileyUpload.HasFile)
        {
            if (!File.Exists(Server.MapPath("~/images/smileys/") + fupNewSmileyUpload.FileName))
            {
                DataAccessLayer dal = new DataAccessLayer();

                fupNewSmileyUpload.SaveAs(Server.MapPath("~/images/smileys/") + fupNewSmileyUpload.FileName);

                dal.AddParameter("@Name", txtNewSmileyName.Text, DbType.String);
                dal.AddParameter("@Code", txtNewSmileyCode.Text, DbType.String);
                dal.AddParameter("@FileName", fupNewSmileyUpload.FileName, DbType.String);
                dal.ExecuteNonQuery("INSERT INTO Smileys ([Name], [Code], FileName) VALUES(@Name, @Code, @FileName)");
                dal.ClearParameters();

                txtNewSmileyCode.Text = "";
                txtNewSmileyName.Text = "";

                lblSaved.Text = "Smileyen blev uploadet.<br /><br />";
                Reset();
            }
            else
            {
                lblSaved.Text = "Billedet " + fupNewSmileyUpload.FileName + " eksisterer i forvejen.<br /><br />";
                lblSaved.ForeColor = System.Drawing.Color.Red;
            }
        }
        else
        {
            lblSaved.Text = "Billedet du har valgt eksisterer ikke.<br /><br />";
            lblSaved.ForeColor = System.Drawing.Color.Red;
        }
        lblSaved.Visible = true;
    }
    protected void drpEditSmiley_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (drpEditSmiley.SelectedIndex != 0)
        {
            DataAccessLayer dal = new DataAccessLayer();

            dal.AddParameter("@ID", drpEditSmiley.SelectedValue, DbType.Int32);
            DataTable table = dal.ExecuteDataTable("SELECT [Name], [Code], FileName FROM Smileys WHERE ID = @ID");
            dal.ClearParameters();

            imgEditSmileyImage.ImageUrl = ResolveClientUrl("~/images/smileys/") + table.Rows[0][2].ToString();
            imgEditSmileyImage.Visible = true;
            lblEditSmileyImageChoose.Visible = false;
            txtEditSmileyName.Text = table.Rows[0][0].ToString();
            txtEditSmileyCode.Text = table.Rows[0][1].ToString();
            fupEditSmileyUpload.Enabled = true;
            rexEditSmileyUpload.Enabled = true;
            txtEditSmileyName.Enabled = true;
            txtEditSmileyCode.Enabled = true;
            reqEditSmileyName.Enabled = true;
            reqEditSmileyCode.Enabled = true;
            btnEditSmileySave.Enabled = true;
            btnEditSmileyDelete.Enabled = true;
            txtEditSmileyName.Focus();
        }
        else
        {
            Reset();
        }
    }
    protected void btnEditSmileySave_Click(object sender, EventArgs e)
    {
        DataAccessLayer dal = new DataAccessLayer();

        if (fupEditSmileyUpload.HasFile)
        {
            if (!File.Exists(Server.MapPath("~/images/smileys/") + fupEditSmileyUpload.FileName))
            {
                dal.AddParameter("@ID", drpEditSmiley.SelectedValue, DbType.Int32);
                File.Delete(Server.MapPath("~/images/smileys/") + dal.ExecuteScalar("SELECT FileName FROM Smileys WHERE ID = @ID").ToString());
                dal.ClearParameters();

                fupEditSmileyUpload.SaveAs(Server.MapPath("~/images/smileys/") + fupEditSmileyUpload.FileName);
                dal.AddParameter("@ID", drpEditSmiley.SelectedValue, DbType.Int32);
                dal.AddParameter("@Name", txtEditSmileyName.Text, DbType.String);
                dal.AddParameter("@Code", txtEditSmileyCode.Text, DbType.String);
                dal.AddParameter("@FileName", fupEditSmileyUpload.FileName, DbType.String);
                dal.ExecuteNonQuery("UPDATE Smileys SET [Name] = @Name, [Code] = @Code, FileName = @FileName WHERE ID = @ID");
                dal.ClearParameters();
                lblSaved.Text = "Smileyen blev rettet.<br /><br />";
                Reset();
            }
            else if (Path.GetFileName(imgEditSmileyImage.ImageUrl) == fupEditSmileyUpload.FileName)
            {
                fupEditSmileyUpload.SaveAs(Server.MapPath("~/images/smileys/") + fupEditSmileyUpload.FileName);
                dal.AddParameter("@ID", drpEditSmiley.SelectedValue, DbType.Int32);
                dal.AddParameter("@Name", txtEditSmileyName.Text, DbType.String);
                dal.AddParameter("@Code", txtEditSmileyCode.Text, DbType.String);
                dal.AddParameter("@FileName", fupEditSmileyUpload.FileName, DbType.String);
                dal.ExecuteNonQuery("UPDATE Smileys SET [Name] = @Name, [Code] = @Code, FileName = @FileName WHERE ID = @ID");
                dal.ClearParameters();
                lblSaved.Text = "Smileyen blev rettet.<br /><br />";
                Reset();
            }
            else
            {
                lblSaved.Text = "Billedet eksisterer i forvejen.<br /><br />";
                lblSaved.ForeColor = System.Drawing.Color.Red;
                fupEditSmileyUpload.Focus();
            }
        }
        else
        {
            dal.AddParameter("@ID", drpEditSmiley.SelectedValue, DbType.Int32);
            dal.AddParameter("@Name", txtEditSmileyName.Text, DbType.String);
            dal.AddParameter("@Code", txtEditSmileyCode.Text, DbType.String);
            dal.ExecuteNonQuery("UPDATE Smileys SET [Name] = @Name, [Code] = @Code WHERE ID = @ID");
            dal.ClearParameters();
            lblSaved.Text = "Smileyen blev rettet.<br /><br />";
            Reset();
        }
        lblSaved.Visible = true;
    }
    protected void btnEditSmileyDelete_Click(object sender, EventArgs e)
    {
        DataAccessLayer dal = new DataAccessLayer();

        dal.AddParameter("@ID", drpEditSmiley.SelectedValue, DbType.Int32);
        dal.ExecuteNonQuery("DELETE FROM Smileys WHERE ID = @ID");
        dal.ClearParameters();
        
        File.Delete(imgEditSmileyImage.ImageUrl);

        lblSaved.Text = "Smileyen blev slettet.<br /><br />";
        lblSaved.Visible = true;

        Reset();
    }
    protected void Reset()
    {
        txtNewTopicName.Text = "";
        lblNewTopicNameExists.Visible = false;

        txtNewSmileyName.Text = "";
        txtNewSmileyCode.Text = "";

        drpEditSmiley.SelectedIndex = 0;
        imgEditSmileyImage.Visible = false;
        lblEditSmileyImageChoose.Visible = true;
        txtEditSmileyName.Text = "";
        txtEditSmileyCode.Text = "";
        fupEditSmileyUpload.Enabled = false;
        rexEditSmileyUpload.Enabled = false;
        txtEditSmileyName.Enabled = false;
        txtEditSmileyCode.Enabled = false;
        reqEditSmileyName.Enabled = false;
        reqEditSmileyCode.Enabled = false;
        btnEditSmileySave.Enabled = false;
        btnEditSmileyDelete.Enabled = false;
    }
}