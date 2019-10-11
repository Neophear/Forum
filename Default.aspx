<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" Title="Untitled Page" %>

<%@ Register Src="editor.ascx" TagName="editor" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
        <ItemTemplate>
            <table border="0" cellpadding="2" cellspacing="1" class="forumline" width="100%">
                <tr>
                    <td style="height:28px;" class="catLeft" colspan="5">
                        <span class="cattitle"><%# Eval("Name") %></span>
                    </td>
                </tr>
                <asp:Repeater ID="Repeater2" runat="server" OnItemDataBound="Repeater2_ItemDataBound">
                    <HeaderTemplate>
                        <tr>
                            <th style="height:20px;white-space:nowrap;" class="thCornerL" colspan="2">
                                &nbsp;
                            </th>
                            <th style="width:50px;white-space:nowrap;" class="thTop">
                                &nbsp;Debatter&nbsp;
                            </th>
                            <th style="width:50px;white-space:nowrap;" class="thTop">
                                &nbsp;Posts&nbsp;
                            </th>
                            <th style="white-space:nowrap;" class="thCornerR">
                                &nbsp;Sidste post&nbsp;
                            </th>
                        </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td style="height:50px;" align="center" class="row4" valign="middle">
                                <img src="images/folder_big.gif" />
                            </td>
                            <td style="height:50px;width:100%;" class="row4">
                                <span class="forumlink"><a class="forumlink" href="subforum.aspx?id=<%# Eval("ID") %>"><%# Eval("Name") %></a><br />
                                </span><span class="genmed"><%# Eval("Description") %><br />
                            </td>
                            <td style="height:50px;" align="center" class="row4" valign="middle">
                                <span class="gensmall"><%# Eval("ThreadCount") %></span>
                            </td>
                            <td style="height:50px;" align="center" class="row4" valign="middle">
                                <span class="gensmall"><%# Eval("PostCount") %></span>
                            </td>
                            <td style="white-space:nowrap;height:50px;" align="center" class="row4" valign="middle">
                                <asp:Panel ID="Panel1" runat="server" Height="50px" Width="125px">
                                    <br />
                                    <span class="gensmall">
                                        <asp:Label ID="lblLastCreated" runat="server"></asp:Label><br />
                                        <a href="user.aspx?user=<%# Eval("LastAuthor") %>"><%# Eval("LastAuthor") %></a>
                                        <asp:HyperLink ID="hplLastPost" runat="server"><img src="images/icon_latest_reply.gif" alt="Gå til sidste post" /></asp:HyperLink>
                                    </span>
                                </asp:Panel>
                                <asp:Label ID="Label1" runat="server" Text="---" Visible="false"></asp:Label>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        <tr>
                            <td style="height:15px;" class="v2" colspan="5">
                                &nbsp;
                            </td>
                        </tr>
                    </FooterTemplate>
                </asp:Repeater>
            </table>
            <br />
        </ItemTemplate>
    </asp:Repeater>
    <table border="0" cellpadding="3" cellspacing="1" class="forumline" width="100%">
        <tr>
            <td style="height:28px;" class="row5" colspan="2">
                <span class="whoisonline"><a class="whoisonline" href="#">Hvem er online</a> </span>
            </td>
        </tr>
        <tr>
            <td style="width:30px;" align="center" class="row4" rowspan="3" valign="middle">
                &nbsp;<img src="images/whosonline.gif" />&nbsp;</td>
            <td style="width:100%;" align="left" class="row4">
                <span class="gensmall">Tiden er nu <asp:Label ID="lblCurrentTime" runat="server"></asp:Label></span>
            </td>
        </tr>
        <tr>
            <td style="width:100%;" align="center" class="row4" valign="middle">
                <span class="gensmall">Username: &nbsp;
                    <input class="post" name="username" size="10" type="text" />
                    &nbsp; &nbsp;Password:
                    <input class="post" maxlength="32" name="password" size="10" type="password" />
                </span><span class="gensmall">
                    <input class="mainoption" name="login" type="submit" value="Log in" /></span>
                <span class="forumlink">
                    <input class="text" name="autologin" type="checkbox" />
                    Log me on automatically each visit </span>
            </td>
        </tr>
        <tr>
            <td style="width:100%;" align="left" class="row4">
                <span class="gensmall">Der er skrevet <asp:Label ID="lblTotalPosts" Font-Bold="true" runat="server"></asp:Label> posts ialt og der er oprettet <asp:Label ID="lblTotalThreads" Font-Bold="true" runat="server"></asp:Label> threads ialt
                    <br />
                    Der er <asp:Label ID="lblUserCount" Font-Bold="true" runat="server" Text="0"></asp:Label> medlemmer
                    <br />
                    Den nyeste bruger er <asp:HyperLink ID="hplNewestMember" Font-Bold="true" runat="server"></asp:HyperLink>
                    <br />
                    I alt er der <asp:Label ID="lblUsersOnline" runat="server" Font-Bold="true" Text="0"></asp:Label> registrerede brugere online
                    <br />
                    Registrerede brugere online: 
                    <asp:Label ID="lblWhoIsOnline" runat="server" Text="Ingen brugere online"></asp:Label>
                    <br />
                    [ <span style="color: #0098ca">Admin</span> ] &nbsp; [ <span style="color: #b3c9d7">
                        Moderator</span> ]</span>
            </td>
        </tr>
    </table>
    <br />
    <table border="0" cellpadding="2" cellspacing="1" class="forumline" width="100%">
        <tr>
            <td align="left" class="row2" colspan="2">
                <table style="text-align:center;" border="0" cellpadding="0" cellspacing="3" width="100%">
                    <tr>
                        <td style="width:20px;">
                            <img src="images/folder_new_big.gif" /></td>
                        <td>
                            <span class="gensmall">Nye posts</span></td>
                        <td>
                            &nbsp;&nbsp;</td>
                        <td style="width:20px;">
                            <img src="images/folder_big.gif" /></td>
                        <td>
                            <span class="gensmall">Ingen nye posts</span></td>
                        <td>
                            &nbsp;
                            <img src="images/folder_locked_big.gif" /></td>
                        <td style="width:20px;">
                        </td>
                        <td>
                            <span class="gensmall">Forum er låst</span></td>
                        <td style="height:20px;" align="right" class="row2" colspan="3">
                            <span class="gensmall"><a class="gensmall" href="index.php?mark=forums&style=354">Mark
                                all forums read</a>
                                <br />
                                All times are GMT </span>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>