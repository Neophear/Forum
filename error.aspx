<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="error.aspx.cs" Inherits="error" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="forumline" width="100%" cellspacing="1" cellpadding="3" border="0" align="center">
        <tr>
	        <th class="thHead" colspan="2" height="25" nowrap="nowrap">
                Der skete en fejl!
            </th>
        </tr>
        <tr>
	        <td class="row4" align="center">
	            <span class="gen">
	                <br />
                    <asp:Label ID="lblErrorMsg" runat="server"></asp:Label><br /><br />
                    Klik <asp:HyperLink ID="hplGoBack" NavigateUrl="javascript:history.back(1)" runat="server">her</asp:HyperLink> for at gå tilbage
                    <br />&nbsp;
                </span>
	        </td>
        </tr>
    </table>
</asp:Content>