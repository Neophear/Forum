<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="admin_Default" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="forumline" width="100%" cellspacing="1" cellpadding="3" border="0" align="center">
        <tr>
	        <th class="thHead" colspan="2" height="25" nowrap="nowrap">
                Admin
            </th>
        </tr>
        <tr>
	        <td class="row4" align="center">
	            <span class="gen">
	                <br />
                    <b>Vælg hvad du vil gøre:</b><br />
                    <br />
                    <asp:HyperLink ID="hplManageForum" NavigateUrl="manageforum.aspx" runat="server">Manage Forum</asp:HyperLink><br />
                    <asp:HyperLink ID="hplUsers" NavigateUrl="manageusers.aspx" runat="server">Brugere</asp:HyperLink><br />
                    <br />&nbsp;
                </span>
	        </td>
        </tr>
    </table>
</asp:Content>