<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="subforum.aspx.cs" Inherits="subforum" Title="Untitled Page" %>
<%@ Import Namespace="Stiig" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="text-align:center;" width="100%" cellspacing="0" cellpadding="2" border="0">
        <tr>
            <td style="width:50px;" align="left" valign="middle">
                <asp:HyperLink ID="hplCreateThread1" Enabled="false" runat="server"><asp:Image ID="imgCreateThread1" ImageUrl="~/images/lang_english/post.gif" runat="server" /></asp:HyperLink>
            </td>
            <td style="width:100%;" align="left" valign="middle" class="nav">
                <span class="nav">&nbsp;&nbsp;&nbsp;<a href="Default.aspx" class="nav">Cyber-Blade.dk - Forum</a> »&nbsp; <asp:HyperLink CssClass="nav" ID="HyperLink2" runat="server"></asp:HyperLink></span>
            </td>
            <td style="white-space:nowrap;" align="right" valign="bottom" class="nav">
                <span class="gensmall"><a href="#">Mark all topics read</a></span>
            </td>
        </tr>
    </table>
    <table border="0" cellpadding="3" cellspacing="1" width="100%" class="forumline">
        <tr>
            <td class="row1" align="right">
                <span class="gensmall"><b>All times are GMT</b></span>
            </td>
        </tr>
        <tr>
            <td class="row1" align="right">
                <span class="gensmall">Goto page <b>1</b>, <a href="#">2</a>, <a href="#">3</a>, <a href="#">4</a>, <a href="#">5</a>, <a href="#">6</a>, <a href="#">7</a>, <a href="#">8</a>&nbsp;&nbsp;<a href="#">Next</a>&nbsp;&nbsp;Page <b>1</b> of <b>8</b></span>
            </td>
        </tr>
    </table>
    <br />
    <table style="text-align:center;height:28px;" width="100%" cellpadding="2" cellspacing="1" border="0" class="forumline">
        <tr>
            <td align="left" colspan="7" valign="bottom" class="row4">
                »&nbsp;<asp:HyperLink CssClass="maintitle" ID="HyperLink1" runat="server"></asp:HyperLink>
            </td>
        </tr>
        <asp:Repeater ID="Repeater1" runat="server" Visible="false" OnItemDataBound="Repeater1_ItemDataBound">
            <HeaderTemplate>
                <tr>
                    <th style="height:25px;white-space:nowrap;" colspan="2" align="center" class="thCornerL">
                        &nbsp;Debat&nbsp;
                    </th>
                    <th style="width:50px;white-space:nowrap;" align="center" class="thTop">
                        &nbsp;Svar&nbsp;
                    </th>
                    <th style="width:100px;white-space:nowrap;" align="center" class="thTop">
                        &nbsp;Forfatter&nbsp;
                    </th>
                    <th style="width:50px;white-space:nowrap;" align="center" class="thTop">
                        &nbsp;Visninger&nbsp;
                    </th>
                    <th style="width:50px;white-space:nowrap;" align="center" class="thTop">
                        &nbsp;Oprettet&nbsp;
                    </th>
                    <th style="text-align:center;white-space:nowrap;" class="thCornerR">
                        &nbsp;Sidste indlæg&nbsp;
                    </th>
                </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td style="height:50px;width:20px;text-align:center;" class="row4" valign="middle">
                        <img src="images/folder.gif" alt="No new posts" title="No new posts" />
                    </td>
                    <td style="width:100%;height:50px;" class="row4">
                        <span class="topictitle">
                            <a href="thread.aspx?id=<%# Eval("ID") %>" class="topictitle"><%# Eval("Title") %></a>
                        </span>
                        <span class="gensmall">
                        </span>
                    </td>
                    <td style="height:50px;" class="row4" align="center" valign="middle">
                        <span class="postdetails"><%# Eval("PostCount") %></span>
                    </td>
                    <td style="height:50px;" class="row4" align="center" valign="middle">
                        <span class="name"><a href="user.aspx?user=<%# Eval("Author") %>"><%# Eval("Author") %></a></span>
                    </td>
                    <td style="height:50px;" class="row4" align="center" valign="middle">
                        <span class="postdetails"><%# Eval("Views") %></span>
                    </td>
                    <td style="height:50px;white-space:nowrap;" class="row4" align="center" valign="middle">
                        <span class="postdetails">&nbsp;<%# Utilities.GetDate((DateTime)Eval("Created"), true, true) %>&nbsp;</span>
                    </td>
                    <td style="height:50px;white-space:nowrap;" class="row4" align="center" valign="middle">
                        <span class="postdetails">
                            <asp:Panel ID="pnlLastPost" runat="server">
                                <asp:Label ID="lblLastCreated" runat="server"></asp:Label><br />
                                <a href="user.aspx?user=<%# Eval("LastAuthor") %>"><%# Eval("LastAuthor") %></a> <asp:HyperLink ID="hplLastPost" runat="server"><img src="images/icon_latest_reply.gif" alt="Gå til sidste post" title="Gå til sidste post" /></asp:HyperLink>
                            </asp:Panel>
                            <asp:Panel ID="pnlNoLastPost" runat="server" Visible="false">
                                ---
                            </asp:Panel>
                        </span>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
        <asp:Label ID="Label1" runat="server" Text="<tr><td colspan='7' class='row4'><span class='topictitle'><br />Der er ingen threads igang i dette subforum.<br />&nbsp;</span></td></tr>" Visible="false"></asp:Label><tr>
            <td class="catBottom" align="left" valign="middle" colspan="7" height="28">
                <span class="genmed">
                    Display topics from previous:&nbsp;
                    <select name="topicdays">
                        <option value="0" selected="selected">All Topics</option>
                        <option value="1">1 Day</option>
                        <option value="7">7 Days</option>
                        <option value="14">2 Weeks</option>
                        <option value="30">1 Month</option>
                        <option value="90">3 Months</option>
                        <option value="180">6 Months</option>
                        <option value="364">1 Year</option>
                    </select>&nbsp;
                    <input type="submit" class="liteoption" value="Go" name="submit" />
                </span>
            </td>
        </tr>
    </table>
    <table width="100%" cellspacing="0" cellpadding="0">
        <tr>
            <td align="left" valign="top" nowrap="nowrap">
                <br />
                <asp:HyperLink ID="hplCreateThread2" Enabled="false" runat="server"><asp:Image ID="imgCreateThread2" ImageUrl="~/images/lang_english/post.gif" runat="server" /></asp:HyperLink>
                <table cellspacing="3" cellpadding="0" border="0">
                    <tr>
	                    <td width="20" align="left">
	                        <img src="images/folder_new.gif" alt="New posts" width="19" height="18" />
	                    </td>
	                    <td class="gensmall">
	                        New posts
	                    </td>
	                    <td width="20" align="center">
	                        <img src="images/folder.gif" alt="No new posts" width="19" height="18" />
	                    </td>
	                    <td class="gensmall">
	                        No new posts
	                    </td>
	                    <td width="20" align="center">
	                        <img src="images/folder_announce.gif" alt="Announcement" width="19" height="18" />
	                    </td>
	                    <td class="gensmall">
	                        Announcement
	                    </td>
                    </tr>
                    <tr>
	                    <td width="20" align="center">
	                        <img src="images/folder_new_hot.gif" alt="New posts [ Popular ]" width="19" height="18" />
	                    </td>
	                    <td class="gensmall">
	                        New posts [ Popular ]
	                    </td>
	                    <td width="20" align="center">
	                        <img src="images/folder_hot.gif" alt="No new posts [ Popular ]" width="19" height="18" />
	                    </td>
	                    <td class="gensmall">
	                        No new posts [ Popular ]
	                    </td>
	                    <td width="20" align="center">
	                        <img src="images/folder_sticky.gif" alt="Sticky" width="19" height="18" />
	                    </td>
	                    <td class="gensmall">
	                        Sticky
	                    </td>
                    </tr>
                    <tr>
	                    <td class="gensmall">
	                        <img src="images/folder_lock_new.gif" alt="New posts [ Locked ]" width="19" height="18" />
	                    </td>
	                    <td class="gensmall">
	                        New posts [ Locked ]
	                    </td>
	                    <td class="gensmall">
	                        <img src="images/folder_lock.gif" alt="No new posts [ Locked ]" width="19" height="18" />
	                    </td>
	                    <td class="gensmall">
	                        No new posts [ Locked ]
	                    </td>
                    </tr>
                </table>
            </td>
            <td align="right">
                <span class="gensmall">You <b>cannot</b> post new topics in this forum<br />You <b>cannot</b> reply to topics in this forum<br />You <b>cannot</b> edit your posts in this forum<br />You <b>cannot</b> delete your posts in this forum<br />You <b>cannot</b> vote in polls in this forum<br /></span>
            </td>
        </tr>
    </table>
</asp:Content>