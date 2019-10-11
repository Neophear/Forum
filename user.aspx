<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="user.aspx.cs" Inherits="user" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="forumline" width="100%" cellspacing="1" cellpadding="3" border="0" align="center">
        <tr>
	        <th class="thHead" colspan="2" height="25" nowrap="nowrap">
                <asp:Label ID="lblUsername1" runat="server"></asp:Label>'s profil
            </th>
        </tr>
        <tr>
	        <td class="catLeft" width="40%" height="28" align="center">
	            <b><span class="gen">Avatar</span></b>
	        </td>
	        <td class="catRight" width="60%">
	            <b><span class="gen">
	                Alt om <asp:Label ID="lblUsername3" runat="server"></asp:Label>
	            </span></b>
	        </td>
        </tr>
        <tr>
            <td class="row1" height="6" valign="top" align="center">
                <br /><span class="postdetails">
                    <asp:Label ID="lblRank" runat="server"></asp:Label>
                </span>
            </td>
	        <td class="row1" rowspan="3" valign="top">
	            <table width="100%" border="0" cellspacing="1" cellpadding="3">
		            <tr>
		                <td valign="middle" align="right" nowrap="nowrap">
		                    <span class="gen">Oprettet:</span>
		                </td>
		                <td width="100%">
		                    <b><span class="gen">
                                <asp:Label ID="lblCreated" runat="server"></asp:Label>
                            </span></b>
		                </td>
		            </tr>
		            <tr>
		                <td valign="middle" align="right" nowrap="nowrap">
		                    <span class="gen">Sidst online:</span>
		                </td>
		                <td width="100%">
		                    <b><span class="gen">
                                <asp:Label ID="lblLastOnline" runat="server"></asp:Label>
                            </span></b>
		                </td>
		            </tr>
		            <tr>
                        <td valign="top" align="right" nowrap="nowrap">
                            <span class="gen">Total posts:</span>
                        </td>
		                <td valign="top">
		                    <b><span class="gen">
                                <asp:Label ID="lblPostCount" runat="server"></asp:Label>
                            </span></b><br />
		                    <span class="genmed">
		                        [<asp:Label ID="lblPostPercentOfTotal" runat="server"></asp:Label>% af alle / <asp:Label ID="lblPostsPerDay" runat="server"></asp:Label> posts per dag]
		                    </span><br />
		                    <span class="genmed">
		                        <asp:HyperLink ID="hplFindPostsByUser" runat="server"></asp:HyperLink>
		                    </span>
		                </td>
		            </tr>
		            <tr>
		                <td valign="middle" align="right" nowrap="nowrap">
		                    <span class="gen">Land:</span>
		                </td>
		                <td>
		                    <b><span class="gen">
                                <asp:Label ID="lblLocation" runat="server"></asp:Label>
                            </span></b>
		                </td>
                    </tr>
		            <tr>
		                <td valign="middle" align="right" nowrap="nowrap">
		                    <span class="gen">Hjemmeside:</span>
		                </td>
		                <td>
		                    <span class="gen"><b>
                                <asp:HyperLink ID="hplHomepage" runat="server" Visible="false" Target="_blank"></asp:HyperLink>
                            </b></span>
		                </td>
		            </tr>
		            <tr>
		                <td valign="middle" align="right" nowrap="nowrap">
		                    <span class="gen">Beskæftigelse:</span>
		                </td>
		                <td>
		                    <b><span class="gen">
                                <asp:Label ID="lblOccupation" runat="server"></asp:Label>
                            </span></b>
		                </td>
		            </tr>
		            <tr>
		                <td valign="top" align="right" nowrap="nowrap">
		                    <span class="gen">Interesser:</span>
		                </td>
		                <td>
		                    <b><span class="gen">
                                <asp:Label ID="lblInterests" runat="server"></asp:Label>
                            </span></b>
		                </td>
		            </tr>
	            </table>
	        </td>
        </tr>
        <tr>
	        <td class="catLeft" align="center" height="28">
	            <b><span class="gen">
	                Kontakt <asp:Label ID="lblUsername2" runat="server"></asp:Label>
	            </span></b>
	        </td>
        </tr>
        <tr>
	        <td class="row1" valign="top">
	            <table width="100%" border="0" cellspacing="1" cellpadding="3">
		            <tr>
		                <td valign="middle" align="right" nowrap="nowrap">
		                    <span class="gen">E-mail address:</span>
		                </td>
		                <td class="row1" valign="middle" width="100%">
		                    <b><span class="gen">
                                <asp:HyperLink ID="hplEmail" Visible="false" runat="server"><img src="images/icon_email.gif" alt="Send e-mail" title="Send e-mail" border="0" /></asp:HyperLink>
		                    </span></b>
		                </td>
		            </tr>
		            <tr>
		                <td valign="middle" nowrap="nowrap" align="right">
		                    <span class="gen">Private Message:</span>
		                </td>
		                <td class="row1" valign="middle">
		                    <b><span class="gen"><a href="#"><img src="images/icon_pm.gif" alt="Send private message" title="Send private message" border="0" /></a></span></b>
		                </td>
		            </tr>
		            <tr>
		                <td valign="middle" nowrap="nowrap" align="right">
		                    <span class="gen">MSN Messenger:</span>
		                </td>
		                <td class="row1" valign="middle">
		                    <span class="gen">
                                <asp:Label ID="lblMsn" runat="server" Visible="false"></asp:Label>
                            </span>
		                </td>
		            </tr>
	            </table>
	        </td>
        </tr>
    </table>
</asp:Content>