<%@ Page Language="C#" ValidateRequest="false" EnableEventValidation="false" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="thread.aspx.cs" Inherits="thread" Title="Untitled Page" %>
<%@ Import Namespace="Stiig" %>
<%@ Register Src="editor.ascx" TagName="editor" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%" class="forumline" cellspacing="1" cellpadding="1" border="0">
        <tr>
            <td align="left" valign="top" class="row5">
                <asp:HyperLink CssClass="maintitle" ID="hplTitle1" runat="server"></asp:HyperLink>
            </td>
        </tr>
    </table>
    <br />
    <table width="100%" cellspacing="1" cellpadding="1" border="0">
        <tr>
            <td style="white-space:nowrap;" align="left" valign="bottom">
                <span class="nav">
                    <a href="#"><img src="images/lang_english/post.gif" alt="Post new topic" /></a>
                    <a href="#"><img src="images/lang_english/reply.gif" alt="Reply to topic" /></a>
                </span>
            </td>
            <td style="width:100%;" align="left" valign="middle">
                <span class="nav">
                    <a href="Default.aspx" class="nav">Cyber-Blade.dk - Forum</a> » <asp:HyperLink CssClass="nav" ID="hplSubForum1" runat="server"></asp:HyperLink> » <asp:HyperLink CssClass="nav" ID="hplTitle2" runat="server"></asp:HyperLink>
                </span>
            </td>
            <td style="white-space:nowrap;" align="right" valign="top">
                <span class="nav">
                    <asp:Label ID="lblPages1" runat="server"></asp:Label><br />
                </span>
            </td>
        </tr>
    </table>
    <br />
    <table class="forumline" width="100%" cellspacing="1" cellpadding="3" border="0">
        <tr>
            <td style="width:150px;height:26px;white-space:nowrap;" align="left" class="row4">
                <span class="postdetails">
                    <asp:Label ID="lblCreated1" runat="server" Text="Label"></asp:Label>
                </span>
            </td>
            <td style="white-space:nowrap;" class="row4">
                <a href="#">
                    <img src="images/icon_minipost.gif" alt="Post" title="Post" />
                </a>
                <span class="postdetails">
                    <asp:Label ID="lblThreadTitle" runat="server"></asp:Label>
                </span>
            </td>
        </tr>
        <tr>
            <td style="width:150px;" align="left" valign="top" class="row4">
                <span class="name">
                    <asp:HyperLink ID="hplUsername1" runat="server" Font-Bold="True">[hplUsername1]</asp:HyperLink>
                </span>
                <br />
                <span class="postdetails">
                    Rank<br />
                    <asp:Image ID="imgAvatar1" runat="server" /><br />
                    <br />
                    Joined: <asp:Label ID="lblJoined1" runat="server"></asp:Label><br />
                    Posts: <asp:Label ID="lblPostCount1" runat="server"></asp:Label><br />
                </span>
                <br />
            </td>
            <td style="word-spacing:100%;height:28px;" class="row4" valign="top">
                <table width="100%" border="0" cellspacing="0" class="row4" cellpadding="0">
                    <tr>
                        <td style="width:100%;">
                            
                        </td>
                        <td style="white-space:nowrap;" valign="top">
                            <asp:ImageButton ImageUrl="images/lang_english/icon_quote.gif" ID="imgbtnReplyWithQuote1" runat="server" OnClick="imgbtnReplyWithQuote1_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div class="postbody">
                                <asp:Label ID="lblPost" runat="server"></asp:Label>
                            </div>
                            <asp:Label ID="lblSignature1" Visible="false" CssClass="postbody" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="width:150px;" class="row4" align="left" valign="middle">
                <span class="nav">
                    <a href="#top" class="nav">Til toppen</a>
                </span>
            </td>
            <td style="width:100%;height:28px;white-space:nowrap;" class="row4" valign="bottom">
                <table style="width:18px;height:18px;" cellspacing="0" cellpadding="0" border="0">
                    <tr>
                        <td style="white-space:nowrap;" valign="middle">
                            <a href="#"><img src="images/lang_english/icon_profile.gif" alt="View user's profile" title="View user's profile" /></a>
                            <a href="#"><img src="images/lang_english/icon_pm.gif" alt="Send private message" title="Send private message" /></a>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <br />
    <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound" OnItemCommand="Repeater1_ItemCommand">
        <ItemTemplate>
            <table class="forumline" width="100%" cellspacing="1" cellpadding="3" border="0">
                <tr>
                    <td style="width:150px;height:26px;white-space:nowrap;" align="left" class="row4">
                        <span class="postdetails">
                            <asp:Label ID="lblCreated2" runat="server" Text="Label"></asp:Label>
                        </span>
                    </td>
                    <td style="white-space:nowrap;" class="row4">
                        <a id="<%# Eval("ID") %>" href="#">
                            <img src="images/icon_minipost.gif" alt="Post" title="Post" />
                        </a>
                        <span class="postdetails">
                            <%# Eval("Title") %>.
                        </span>
                    </td>
                </tr>
                <tr>
                    <td style="width:150px;" align="left" valign="top" class="row4">
                        <span class="name">
                            <a href="user.aspx?user=<%# Eval("Author") %>"><b><%# Eval("Author") %></b></a>
                        </span>
                        <br />
                        <span class="postdetails">
                            Rank<br />
                            <asp:Image ID="imgAvatar2" ImageUrl="~/images/transparrent.gif" runat="server" />
                            <br />
                            <br />
                            Joined: <asp:Label ID="lblJoined2" runat="server"></asp:Label><br />
                            Posts: <asp:Label ID="lblPostCount2" runat="server"></asp:Label><br />
                        </span>
                        <br />
                    </td>
                    <td style="word-spacing:100%;height:28px;" class="row4" valign="top">
                        <table width="100%" border="0" cellspacing="0" class="row4" cellpadding="0">
                            <tr>
                                <td style="width:100%;">
                                    
                                </td>
                                <td style="white-space:nowrap;" valign="top">
                                    <asp:ImageButton ImageUrl="images/lang_english/icon_quote.gif" ID="imgbtnReplyWithQuote2" CommandName="Reply" CommandArgument='<%# Eval("ID") %>' runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align:left;" colspan="2">
                                    <div class="postbody">
                                        <%# Utilities.GetSmileys(Utilities.BBToHTML(Eval("Text").ToString()), ResolveClientUrl("~/images/smileys/")) %>
                                    </div>
                                    <asp:Label ID="lblSignature2" Visible="false" CssClass="postbody" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="width:150px;" class="row4" align="left" valign="middle">
                        <span class="nav">
                            <a href="#top" class="nav">Til toppen</a>
                        </span>
                    </td>
                    <td style="width:100%;height:28px;white-space:nowrap;" class="row4" valign="bottom">
                        <table style="width:18px;height:18px;" cellspacing="0" cellpadding="0" border="0">
                            <tr>
                                <td style="white-space:nowrap;" valign="middle">
                                    <a href="#"><img src="images/lang_english/icon_profile.gif" alt="View user's profile" title="View user's profile" /></a>
                                    <a href="#"><img src="images/lang_english/icon_pm.gif" alt="Send private message" title="Send private message" /></a>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <br />
        </ItemTemplate>
    </asp:Repeater>
    <div class="nav" style="width:100;text-align:right;"><asp:Label ID="lblPages2" runat="server"></asp:Label></div><br />
    <uc1:editor id="Editor1" runat="server"></uc1:editor>
    <br />
    <table width="100%" cellspacing="1" cellpadding="2" border="0" align="center">
        <tr>
            <td style="white-space:nowrap;" align="left" valign="middle">
                <span class="nav">
                    <a href="#"><img src="images/lang_english/post.gif" alt="Post new topic" align="middle" /></a>
                    <a href="#"><img src="images/lang_english/reply.gif" alt="Reply to topic" align="middle" /></a>
                </span>
            </td>
            <td style="width:100%;" align="left" valign="middle">
                <span class="nav">
                    <a href="Default.aspx" class="nav">Cyber-Blade.dk - Forum</a> » <asp:HyperLink CssClass="nav" ID="hplSubForum2" runat="server"></asp:HyperLink> » <asp:HyperLink CssClass="nav" ID="hplTitle3" runat="server"></asp:HyperLink>
                </span>
            </td>
        </tr>
    </table>
    <table width="100%" cellspacing="2" border="0">
        <tr>
            <td style="width:40%;white-space:nowrap;" valign="top" align="left">
                <span class="gensmall">
                    <span class="gensmall">Display posts from previous:
                        <select name="postdays">
                            <option value="0" selected="selected">All Posts</option>
                            <option value="1">1 Day</option>
                            <option value="7">7 Days</option>
                            <option value="14">2 Weeks</option>
                            <option value="30">1 Month</option>
                            <option value="90">3 Months</option>
                            <option value="180">6 Months</option>
                            <option value="364">1 Year</option>
                        </select>
                        <select name="postorder">
                            <option value="asc" selected="selected">Oldest First</option>
                            <option value="desc">Newest First</option>
                        </select>
                        <input type="submit" value="Go" class="liteoption" name="submit" />
                    </span>
                    <br />
                </span>
            </td>
        </tr>
    </table>
</asp:Content>