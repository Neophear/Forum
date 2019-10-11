<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="search.aspx.cs" Inherits="search" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="forumline" width="100%" cellpadding="4" cellspacing="1" border="0">
        <tr>
            <th class="thHead" colspan="4" height="25">
                S�geord
            </th>
        </tr>
        <tr>
            <td class="row1" colspan="2" width="50%">
                <span class="gen">
                    S�g efter post/thread:
                </span><br />
                <span class="gensmall">
                    Skriv de ord du vil s�ge efter. Der bliver s�gt p� alle de ord du skriver.
                </span>
            </td>
            <td class="row1" colspan="2" valign="top">
                <span class="genmed">
                    <asp:TextBox ID="txtPostThreadQuery" Width="300px" runat="server" ValidationGroup="PostThread"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqPostThread" runat="server" ControlToValidate="txtPostThreadQuery"
                        ErrorMessage="Du skal skrive noget i feltet" ValidationGroup="PostThreadQuery"></asp:RequiredFieldValidator><br />
                    <asp:RadioButtonList ID="rdlst" runat="server">
                        <asp:ListItem Value="titles">S�g i titler</asp:ListItem>
                        <asp:ListItem Value="text">S�g i teksten</asp:ListItem>
                        <asp:ListItem Value="both" Selected="True">S�g i begge dele</asp:ListItem>
                    </asp:RadioButtonList>
                </span>
            </td>
        </tr>
        <tr>
            <td class="row1" colspan="2">
                <span class="gen">
                    S�g efter bruger:
                </span><br />
                <span class="gensmall">
                    S�g efter en bruger p� siden. Du kan s�ge efter b�de brugernavn og rigtigt navn og du kan ogs� n�jes med en del af navnet.
                </span>
            </td>
            <td class="row1" colspan="2" valign="middle">
                <span class="genmed">
                    <asp:TextBox ID="txtUserQuery" Width="300px" runat="server" ValidationGroup="User"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqUserQuery" runat="server" ControlToValidate="txtUserQuery"
                        ErrorMessage="Du skal skrive noget i feltet" ValidationGroup="User"></asp:RequiredFieldValidator>
                </span>
            </td>
        </tr>
        <tr>
            <th class="thHead" colspan="4" height="25">
                S�geindstillinger
            </th>
        </tr>
        <tr>
            <td class="row1" align="right">
                <span class="gen">
                    Forum:
                </span>
            </td>
            <td class="row1">
                <span class="genmed">
                    <asp:DropDownList ID="drplstForum" runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="drplstForum_SelectedIndexChanged">
                        <asp:ListItem>-Alle-</asp:ListItem>
                    </asp:DropDownList>
                </span>
            </td>
            <td class="row1" align="right" nowrap="nowrap">
                <span class="gen">
                    Alder:
                </span>
            </td>
            <td class="row1" valign="middle">
                <span class="genmed">
                    <asp:DropDownList ID="drpTime" runat="server">
                        <asp:ListItem Value="0">-Alle-</asp:ListItem>
                        <asp:ListItem Value="1">1 dag</asp:ListItem>
                        <asp:ListItem Value="7">1 uge</asp:ListItem>
                        <asp:ListItem Value="14">2 uger</asp:ListItem>
                        <asp:ListItem Value="30">1 m�ned</asp:ListItem>
                        <asp:ListItem Value="91">3 m�neder</asp:ListItem>
                        <asp:ListItem Value="182">6 m�neder</asp:ListItem>
                        <asp:ListItem Value="364">1 �r</asp:ListItem>
                    </asp:DropDownList>
                </span>
            </td>
        </tr>
        <tr>
            <td class="row1" align="right">
                <span class="gen">
                    Kategori:
                </span>
            </td>
            <td class="row1">
                <span class="genmed">
                    <asp:DropDownList ID="drplstCategory" runat="server" Enabled="false">
                    </asp:DropDownList>
                </span>
            </td>
            <td class="row1" align="right">
                <span class="gen">
                    Vis de f�rste
                </span>
            </td>
            <td class="row1">
                <span class="genmed">
                    <asp:DropDownList ID="drplstNumberOfCharsToShow" runat="server">
                        <asp:ListItem Value="0">Hele posten</asp:ListItem>
                        <asp:ListItem Value="25">25</asp:ListItem>
                        <asp:ListItem Value="50">50</asp:ListItem>
                        <asp:ListItem>100</asp:ListItem>
                        <asp:ListItem Selected="True">200</asp:ListItem>
                        <asp:ListItem>300</asp:ListItem>
                        <asp:ListItem>400</asp:ListItem>
                        <asp:ListItem>500</asp:ListItem>
                        <asp:ListItem>600</asp:ListItem>
                        <asp:ListItem>700</asp:ListItem>
                        <asp:ListItem>800</asp:ListItem>
                        <asp:ListItem>900</asp:ListItem>
                        <asp:ListItem>1000</asp:ListItem>
                    </asp:DropDownList> tegn af posten/threads.
                </span>
            </td>
        </tr>
        <tr>
            <td class="catBottom" colspan="4" align="center" height="28">
                <asp:Button CssClass="liteoption" ID="btnPostThread" runat="server" Text="S�g efter post/thread" OnClick="btnSearch_Click" ValidationGroup="PostThread" />
                <asp:Button CssClass="liteoption" ID="btnUser" runat="server" Text="S�g efter bruger" OnClick="btnSearch_Click" ValidationGroup="User" />
            </td>
        </tr>
    </table>
</asp:Content>
