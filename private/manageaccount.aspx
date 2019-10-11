<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="manageaccount.aspx.cs" Inherits="private_manageaccount" Title="Untitled Page" %>

<%@ Register Src="../editor.ascx" TagName="editor" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="javascript" type="text/javascript">
    function ResetRegisteringInfo_onclick()
    {
        document.forms[0].<%= txtEmail.ClientID %>.value = document.forms[0].<%= txtEmail.ClientID %>.defaultValue;
    }
    function ResetPersonalInfo_onclick()
    {
        document.forms[0].<%= txtFirstname.ClientID %>.value = document.forms[0].<%= txtFirstname.ClientID %>.defaultValue;
        document.forms[0].<%= txtLastname.ClientID %>.value = document.forms[0].<%= txtLastname.ClientID %>.defaultValue;
        document.forms[0].<%= rdbGender1.ClientID %>.checked = document.forms[0].<%= rdbGender1.ClientID %>.defaultChecked;
        document.forms[0].<%= rdbGender2.ClientID %>.checked = document.forms[0].<%= rdbGender2.ClientID %>.defaultChecked;
        
        for(i=0;i<document.forms[0].<%= drpDay.ClientID %>.length;i++)
        {
            if(document.forms[0].<%= drpDay.ClientID %>.options[i].defaultSelected)
            {
                document.forms[0].<%= drpDay.ClientID %>.options.selectedIndex = i;
            }
        }
        for(i=0;i<document.forms[0].<%= drpMonth.ClientID %>.length;i++)
        {
            if(document.forms[0].<%= drpMonth.ClientID %>.options[i].defaultSelected)
            {
                document.forms[0].<%= drpMonth.ClientID %>.options.selectedIndex = i;
            }
        }
        for(i=0;i<document.forms[0].<%= drpYear.ClientID %>.length;i++)
        {
            if(document.forms[0].<%= drpYear.ClientID %>.options[i].defaultSelected)
            {
                document.forms[0].<%= drpYear.ClientID %>.options.selectedIndex = i;
            }
        }
        
        document.forms[0].<%= txtCity.ClientID %>.value = document.forms[0].<%= txtCity.ClientID %>.defaultValue;
        document.forms[0].<%= txtCountry.ClientID %>.value = document.forms[0].<%= txtCountry.ClientID %>.defaultValue;
    }
    function ResetProfileInfo_onclick()
    {
        document.forms[0].<%= txtHomepage.ClientID %>.value = document.forms[0].<%= txtHomepage.ClientID %>.defaultValue;
        document.forms[0].<%= txtMessenger.ClientID %>.value = document.forms[0].<%= txtMessenger.ClientID %>.defaultValue;
        document.forms[0].<%= txtInterests.ClientID %>.value = document.forms[0].<%= txtInterests.ClientID %>.defaultValue;
        document.forms[0].<%= txtOccupation.ClientID %>.value = document.forms[0].<%= txtOccupation.ClientID %>.defaultValue;
    }
    function ResetOptions_onclick()
    {
        document.forms[0].<%= ckbShowEmail.ClientID %>.checked = document.forms[0].<%= ckbShowEmail.ClientID %>.defaultChecked;
        document.forms[0].<%= ckbNotifyPrivateMsg.ClientID %>.checked = document.forms[0].<%= ckbNotifyPrivateMsg.ClientID %>.defaultChecked;
        for(i=0;i<document.forms[0].<%= drpPostsPerPage.ClientID %>.length;i++)
        {
            if(document.forms[0].<%= drpPostsPerPage.ClientID %>.options[i].defaultSelected)
            {
                document.forms[0].<%= drpPostsPerPage.ClientID %>.options.selectedIndex = i;
            }
        }
    }
</script>

    <center>
        <asp:Label ID="lblSaved" CssClass="cattitle" Font-Size="10pt" runat="server" Visible="false"></asp:Label>
        <table border="0" cellpadding="2" cellspacing="1" class="forumline" width="100%">
            <tr>
                <td style="height:28px;" align="center" class="catLeft" colspan="2">
                    <span class="cattitle">Registrerings-info</span>
                </td>
            </tr>
            <tr>
                <th style="height:20px;white-space:nowrap;" class="thCornerL">
                    &nbsp;Navn&nbsp;
                </th>
                <th style="white-space:nowrap;" class="thCornerR">
                    &nbsp;Indstilling&nbsp;
                </th>
            </tr>
            <tr>
                <td style="height:50px;width:50%;" class="row4">
                    <span class="genmed">
                        <asp:Label ID="lblEmail" runat="server" Text="Email" AssociatedControlID="txtEmail"></asp:Label>
                    </span>
                </td>
                <td style="white-space:nowrap;width:50%;" align="center" class="row4" valign="middle">
                    <span class="genmed">
                        <asp:TextBox ID="txtEmail" runat="server" ValidationGroup="RegisteringInfo"></asp:TextBox>
                    </span>
                </td>
            </tr>
            <tr>
                <td style="height:50px;" align="center" class="row4" colspan="2">
                    <span class="genmed">
                        <asp:Button ID="btnRegisteringInfo" runat="server" Text="Gem" ValidationGroup="RegisteringInfo" OnClick="btnRegisteringInfo_Click" />
                        <input id="ResetRegisteringInfo" type="button" value="Nulstil" onclick="return ResetRegisteringInfo_onclick()" /></span></td>
            </tr>
            <tr>
                <td style="height:15px;" class="v2" colspan="2">
                    &nbsp;
                </td>
            </tr>
        </table>
        <br />
        <table border="0" cellpadding="2" cellspacing="1" class="forumline" width="100%">
            <tr>
               <td style="height:28px;" align="center" class="catLeft" colspan="2">
                    <span class="cattitle">Skift password</span>
                </td>
            </tr>
            <tr>
                <th style="height:20px;white-space:nowrap; width: 375px;" class="thCornerL">
                    &nbsp;Navn&nbsp;
                </th>
                <th style="white-space:nowrap;" class="thCornerR">
                    &nbsp;Indstilling&nbsp;
                </th>
            </tr>
            <tr>
                <td style="height:50px;width:375px;" class="row4">
                    <span class="genmed">
                        <asp:Label ID="lblPassword" runat="server" AssociatedControlID="txtPassword">Password</asp:Label>
                    </span>
                </td>
                <td style="white-space:nowrap;width:50%;" align="center" class="row4" valign="middle">
                    <span class="genmed">
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" ValidationGroup="ChangePassword"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPassword"
                            ErrorMessage="*" ToolTip="Du skal skrive dit password" ValidationGroup="ChangePassword">*</asp:RequiredFieldValidator>
                    </span>
                </td>
            </tr>
            <tr>
                <td style="height:50px;width:375px;" class="row4">
                    <span class="genmed">
                        <asp:Label ID="lblNewPassword" runat="server" AssociatedControlID="txtNewPassword">Nyt Password</asp:Label>
                    </span>
                </td>
                <td style="white-space:nowrap;width:50%;" align="center" class="row4" valign="middle">
                    <span class="genmed">
                        <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" ValidationGroup="ChangePassword"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNewPassword"
                            ErrorMessage="*" ToolTip="Du skal angive et nyt password"
                            ValidationGroup="ChangePassword">*</asp:RequiredFieldValidator><br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtNewPassword"
                            ErrorMessage="Passwordet skal være på minimum 7 tegn." ValidationExpression="........+"
                            ValidationGroup="ChangePassword"></asp:RegularExpressionValidator>
                    </span>
                </td>
            </tr>
            <tr>
                <td style="height:50px;width:375px;" class="row4">
                    <span class="genmed">
                        <asp:Label ID="lblConfirmPassword" runat="server" AssociatedControlID="txtConfirmPassword">Bekræft Nyt Password</asp:Label>
                    </span>
                </td>
                <td style="white-space:nowrap;width:50%;" align="center" class="row4" valign="middle">
                    <span class="genmed">
                        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" ValidationGroup="ChangePassword"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtConfirmPassword"
                            ErrorMessage="*" ToolTip="Du skal bekræfte dit nye password" ValidationGroup="ChangePassword">*</asp:RequiredFieldValidator><br />
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNewPassword"
                            ControlToValidate="txtConfirmPassword" ErrorMessage="De to passwords skal være ens."
                            ToolTip='"Nyt Password" og "Bekræft Password" skal være ens.' ValidationGroup="ChangePassword"></asp:CompareValidator>
                    </span>
                </td>
            </tr>
            <tr>
                <td style="height:50px;" align="center" class="row4" colspan="2">
                    <span class="genmed">
                        <asp:Button ID="btnChangePassword" runat="server" Text="Skift Password" ValidationGroup="ChangePassword" OnClick="btnChangePassword_Click" />
                    </span>
                </td>
            </tr>
            <tr>
                <td style="height:15px;" class="v2" colspan="2">
                    &nbsp;
                </td>
            </tr>
        </table>
        <br />
        <table border="0" cellpadding="2" cellspacing="1" class="forumline" width="100%">
            <tr>
                <td style="height:28px;" align="center" class="catLeft" colspan="2">
                    <span class="cattitle">Personlig Info</span>
                </td>
            </tr>
            <tr>
                <th style="height:20px;white-space:nowrap;" class="thCornerL">
                    &nbsp;Navn&nbsp;
                </th>
                <th style="white-space:nowrap;" class="thCornerR">
                    &nbsp;Indstilling&nbsp;
                </th>
            </tr>
            <tr>
                <td style="height:50px;width:50%;" class="row4">
                    <span class="genmed">
                        <asp:Label ID="lblFirstname" runat="server" AssociatedControlID="txtFirstname" Text="Fornavn"></asp:Label>
                    </span>
                </td>
                <td style="white-space:nowrap;width:50%;" align="center" class="row4" valign="middle">
                    <span class="genmed">
                        <asp:TextBox ID="txtFirstname" runat="server" ValidationGroup="PersonalInfo"></asp:TextBox>
                    </span>
                </td>
            </tr>
            <tr>
                <td style="height:50px;width:50%;" class="row4">
                    <span class="genmed">
                        <asp:Label ID="lblLastname" runat="server" AssociatedControlID="txtLastname" Text="Efternavn"></asp:Label>
                    </span>
                </td>
                <td style="white-space:nowrap;width:50%;" align="center" class="row4" valign="middle">
                    <span class="genmed">
                        <asp:TextBox ID="txtLastname" runat="server" ValidationGroup="PersonalInfo"></asp:TextBox>
                    </span>
                </td>
            </tr>
            <tr>
                <td style="height:50px;width:50%;" class="row4">
                    <span class="genmed">
                        <asp:Label ID="lblGender" runat="server" Text="Køn"></asp:Label>
                    </span>
                </td>
                <td style="white-space:nowrap;width:50%;" align="center" class="row4" valign="middle">
                    <span class="genmed">
                        <asp:RadioButton ID="rdbGender1" runat="server" GroupName="Gender" Text="Mand" ValidationGroup="PersonalInfo" />
                        <asp:RadioButton ID="rdbGender2" runat="server" GroupName="Gender" Text="Kvinde" ValidationGroup="PersonalInfo" />
                    </span>
                </td>
            </tr>
            <tr>
                <td style="height:50px;width:50%;" class="row4">
                    <span class="genmed">
                        <asp:Label ID="lblBirthday" runat="server" Text="Fødselsdag"></asp:Label>
                    </span>
                </td>
                <td style="white-space:nowrap;width:50%;" align="center" class="row4" valign="middle">
                    <span class="genmed">
                        <asp:DropDownList ID="drpDay" runat="server" ValidationGroup="PersonalInfo">
                        </asp:DropDownList>
                        <asp:DropDownList ID="drpMonth" runat="server" ValidationGroup="PersonalInfo">
                            <asp:ListItem>-Dag-</asp:ListItem>
                            <asp:ListItem Value="1">Januar</asp:ListItem>
                            <asp:ListItem Value="2">Februar</asp:ListItem>
                            <asp:ListItem Value="3">Marts</asp:ListItem>
                            <asp:ListItem Value="4">April</asp:ListItem>
                            <asp:ListItem Value="5">Maj</asp:ListItem>
                            <asp:ListItem Value="6">Juni</asp:ListItem>
                            <asp:ListItem Value="7">Juli</asp:ListItem>
                            <asp:ListItem Value="8">August</asp:ListItem>
                            <asp:ListItem Value="9">September</asp:ListItem>
                            <asp:ListItem Value="10">Oktober</asp:ListItem>
                            <asp:ListItem Value="11">November</asp:ListItem>
                            <asp:ListItem Value="12">December</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="drpYear" runat="server" ValidationGroup="PersonalInfo">
                        </asp:DropDownList>
                        <asp:Label ID="lblWrongDate" runat="server" Visible="False"></asp:Label>
                    </span>
                </td>
            </tr>
            <tr>
                <td style="height:50px;width:50%;" class="row4">
                    <span class="genmed">
                        <asp:Label ID="lblCity" runat="server" AssociatedControlID="txtCity" Text="By"></asp:Label>
                    </span>
                </td>
                <td style="white-space:nowrap;width:50%;" align="center" class="row4" valign="middle">
                    <span class="genmed">
                        <asp:TextBox ID="txtCity" runat="server" ValidationGroup="PersonalInfo"></asp:TextBox>
                    </span>
                </td>
            </tr>
             <tr>
                <td style="height:50px;width:50%;" class="row4">
                    <span class="genmed">
                        <asp:Label ID="lblCountry" runat="server" AssociatedControlID="txtCountry" Text="Land"></asp:Label>
                    </span>
                </td>
                <td style="white-space:nowrap;width:50%;" align="center" class="row4" valign="middle">
                    <span class="genmed">
                        <asp:TextBox ID="txtCountry" runat="server" ValidationGroup="PersonalInfo"></asp:TextBox>
                    </span>
                </td>
            </tr>
            <tr>
                <td style="height:50px;" align="center" class="row4" colspan="2">
                    <span class="genmed">
                        <asp:Button ID="btnPersonal" runat="server" Text="Gem" OnClick="btnPersonal_Click" ValidationGroup="PersonalInfo" />
                        <input id="ResetPersonalInfo" type="button" value="Nulstil" onclick="return ResetPersonalInfo_onclick()" />
                    </span>
                </td>
            </tr>
            <tr>
                <td style="height:15px;" class="v2" colspan="2">
                    &nbsp;
                </td>
            </tr>
        </table>
        <br />
        <table border="0" cellpadding="2" cellspacing="1" class="forumline" width="100%">
            <tr>
                <td style="height:28px;" align="center" class="catLeft" colspan="2">
                    <span class="cattitle">Profil Info</span>
                </td>
            </tr>
            <tr>
                <th style="height:20px;white-space:nowrap;" class="thCornerL">
                    &nbsp;Navn&nbsp;
                </th>
                <th style="white-space:nowrap;" class="thCornerR">
                    &nbsp;Indstilling&nbsp;
                </th>
            </tr>
            <tr>
                <td style="height:50px;width:50%;" class="row4">
                    <span class="genmed">
                        <asp:Label ID="lblHomepage" runat="server" Text="Hjemmeside" AssociatedControlID="txtHomepage"></asp:Label>
                    </span>
                </td>
                <td style="white-space:nowrap;width:50%;" align="center" class="row4" valign="middle">
                    <span class="genmed">
                        <asp:TextBox ID="txtHomepage" runat="server" ValidationGroup="ProfileInfo"></asp:TextBox>
                    </span>
                </td>
            </tr>
            <tr>
                <td style="height:50px;width:50%;" class="row4">
                    <span class="genmed">
                        <asp:Label ID="lblMessenger" runat="server" Text="Messenger" AssociatedControlID="txtMessenger"></asp:Label>
                    </span>
                </td>
                <td style="white-space:nowrap;width:50%;" align="center" class="row4" valign="middle">
                    <span class="genmed">
                        <asp:TextBox ID="txtMessenger" runat="server" ValidationGroup="ProfileInfo"></asp:TextBox>
                    </span>
                </td>
            </tr>
            <tr>
                <td style="height:50px;width:50%;" class="row4">
                    <span class="genmed">
                        <asp:Label ID="lblInterests" runat="server" Text="Interesser" AssociatedControlID="txtInterests"></asp:Label>
                    </span>
                </td>
                <td style="white-space:nowrap;width:50%;" align="center" class="row4" valign="middle">
                    <span class="genmed">
                        <asp:TextBox ID="txtInterests" TextMode="MultiLine" runat="server" ValidationGroup="ProfileInfo"></asp:TextBox>
                    </span>
                </td>
            </tr>
            <tr>
                <td style="height:50px;width:50%;" class="row4">
                    <span class="genmed">
                        <asp:Label ID="lblOccupation" runat="server" Text="Arbejde/Uddannelse" AssociatedControlID="txtOccupation"></asp:Label>
                    </span>
                </td>
                <td style="white-space:nowrap;width:50%;" align="center" class="row4" valign="middle">
                    <span class="genmed">
                        <asp:TextBox ID="txtOccupation" runat="server" ValidationGroup="ProfileInfo" TextMode="MultiLine"></asp:TextBox>
                    </span>
                </td>
            </tr>
            <tr>
                <td style="height:50px;" align="center" class="row4" colspan="2">
                    <span class="genmed">
                        <asp:Button ID="btnProfileInfo" runat="server" Text="Gem" ValidationGroup="ProfileInfo" OnClick="btnProfileInfo_Click" />
                        <input id="ResetProfileInfo" type="button" value="Nulstil" onclick="return ResetProfileInfo_onclick()" />
                    </span>
                </td>
            </tr>
            <tr>
                <td style="height:15px;" class="v2" colspan="2">
                    &nbsp;
                </td>
            </tr>
        </table>
        <br />
        <table border="0" cellpadding="2" cellspacing="1" class="forumline" width="100%">
            <tr>
                <td style="height:28px;" align="center" class="catLeft" colspan="2">
                    <span class="cattitle">Avatar</span>
                </td>
            </tr>
            <tr>
                <th style="height:20px;white-space:nowrap;" class="thCornerL">
                    &nbsp;Navn&nbsp;
                </th>
                <th style="white-space:nowrap;" class="thCornerR">
                    &nbsp;Indstilling&nbsp;
                </th>
            </tr>
            <tr>
                <td style="height:50px;width:50%;" class="row4">
                    <span class="genmed">
                        <asp:Label ID="lblAvatar" runat="server" Text="Avatar (*.jpg, *.jpeg, *.jpe, *.bmp, *.gif, *.png)" AssociatedControlID="fupAvatar"></asp:Label>
                    </span>
                </td>
                <td style="white-space:nowrap;width:50%;" align="center" class="row4" valign="middle">
                    <span class="genmed">
                        <br /><asp:Image ID="imgAvatar" runat="server" Visible="false" /><br /><br />
                        <asp:FileUpload ID="fupAvatar" CssClass="genmed" runat="server" ToolTip="Upload Avatar" />
                        <br /><br /><asp:CheckBox Text="Slet avatar" ID="ckbDeleteAvatar" ValidationGroup="Avatar" runat="server" /><br />&nbsp;
                    </span>
                </td>
            </tr>
            <tr>
                <td style="height:50px;" align="center" class="row4" colspan="2">
                    <span class="genmed">
                        <asp:Button ID="btnAvatar" runat="server" Text="Gem" ValidationGroup="Avatar" OnClick="btnAvatar_Click" />
                    </span>
                </td>
            </tr>
            <tr>
                <td style="height:15px;" class="v2" colspan="2">
                    &nbsp;
                </td>
            </tr>
        </table>
        <br />
        <table border="0" cellpadding="2" cellspacing="1" class="forumline" width="100%">
            <tr>
                <td style="height:28px;" align="center" class="catLeft" colspan="2">
                    <span class="cattitle">Indstillinger</span>
                </td>
            </tr>
            <tr>
                <th style="height:20px;white-space:nowrap;" class="thCornerL">
                    &nbsp;Navn&nbsp;
                </th>
                <th style="white-space:nowrap;" class="thCornerR">
                    &nbsp;Indstilling&nbsp;
                </th>
            </tr>
            <tr>
                <td style="height:50px;width:50%;" class="row4">
                    <span class="genmed">
                        <asp:Label ID="lblShowEmail" runat="server" Text="Vis din email offentligt" AssociatedControlID="ckbShowEmail"></asp:Label>
                    </span>
                </td>
                <td style="white-space:nowrap;width:50%;" align="center" class="row4" valign="middle">
                    <span class="genmed">
                        <asp:CheckBox ID="ckbShowEmail" Text="Vis email" ValidationGroup="Options" runat="server" />
                    </span>
                </td>
            </tr>
            <tr>
                <td style="height:50px;width:50%;" class="row4">
                    <span class="genmed">
                        <asp:Label ID="lblNotifyPrivateMsg" runat="server" Text="Få besked via email når du modtager en ny privat besked" AssociatedControlID="ckbNotifyPrivateMsg"></asp:Label>
                    </span>
                </td>
                <td style="white-space:nowrap;width:50%;" align="center" class="row4" valign="middle">
                    <span class="genmed">
                        <asp:CheckBox ID="ckbNotifyPrivateMsg" Text="Få besked" ValidationGroup="Options" runat="server" />
                    </span>
                </td>
            </tr>
            <tr>
                <td style="height:50px;width:50%;" class="row4">
                    <span class="genmed">
                        <asp:Label ID="lblPostsPerPage" runat="server" Text="Posts der skal vises per side" AssociatedControlID="drpPostsPerPage"></asp:Label>
                    </span>
                </td>
                <td style="white-space:nowrap;width:50%;" align="center" class="row4" valign="middle">
                    <span class="genmed">
                        <asp:DropDownList ID="drpPostsPerPage" runat="server">
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>20</asp:ListItem>
                            <asp:ListItem>30</asp:ListItem>
                            <asp:ListItem>50</asp:ListItem>
                            <asp:ListItem>70</asp:ListItem>
                            <asp:ListItem>100</asp:ListItem>
                        </asp:DropDownList>
                    </span>
                </td>
            </tr>
            <tr>
                <td style="height:50px;" align="center" class="row4" colspan="2">
                    <span class="genmed">
                        <asp:Button ID="btnOptions" runat="server" Text="Gem" ValidationGroup="Options" OnClick="btnOptions_Click" />
                        <input id="ResetOptions" type="button" value="Nulstil" onclick="return ResetOptions_onclick()" />
                    </span>
                </td>
            </tr>
            <tr>
                <td style="height:15px;" class="v2" colspan="2">
                    &nbsp;
                </td>
            </tr>
        </table>
        <br />
        <uc1:editor ID="Editor1" SubjectVisible="false" Title="Signatur" SubTitle="Her kan du skrive din signatur." runat="server" />
    </center>
</asp:Content>