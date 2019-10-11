<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="manageforum.aspx.cs" Inherits="admin_manageforum" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="javascript" type="text/javascript">
    function ResetNewTopic_onclick()
    {
        document.forms[0].<%= txtNewTopicName.ClientID %>.value = "";
    }
    function ResetNewSmiley_onclick()
    {
        document.forms[0].<%= fupNewSmileyUpload.ClientID %>.value = "";
        document.forms[0].<%= txtNewSmileyName.ClientID %>.value = "";
        document.forms[0].<%= txtNewSmileyCode.ClientID %>.value = "";
    }
    function ResetEditSmiley_onclick()
    {
        document.forms[0].<%= fupEditSmileyUpload.ClientID %>.value = "";
        document.forms[0].<%= txtEditSmileyName.ClientID %>.value = document.forms[0].<%= txtEditSmileyName.ClientID %>.defaultValue;
        document.forms[0].<%= txtEditSmileyCode.ClientID %>.value = document.forms[0].<%= txtEditSmileyCode.ClientID %>.defaultValue;
    }
</script>

    <center>
        <asp:Label ID="lblSaved" CssClass="cattitle" Font-Size="10pt" runat="server" Visible="false"></asp:Label>
        <table border="0" cellpadding="2" cellspacing="1" class="forumline" width="100%">
            <tr>
                <td style="height:28px;" class="catLeft" colspan="2">
                    <span class="cattitle">Opret nyt emne</span>
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
                        <asp:Label ID="lblNewTopicName" AssociatedControlID="txtNewTopicName" runat="server" Text="Navn på det nye emne"></asp:Label>
                    </span>
                </td>
                <td style="white-space:nowrap;width:50%;" align="center" class="row4" valign="middle">
                    <span class="genmed">
                        <asp:TextBox ID="txtNewTopicName" runat="server" ValidationGroup="NewTopic"></asp:TextBox><br />
                        <asp:Label ID="lblNewTopicNameExists" runat="server" Text='<span style="color:#FF0000;">Emnet eksisterer i forvejen.</span>'
                            Visible="False"></asp:Label>&nbsp;
                        <asp:RequiredFieldValidator ID="reqNewTopicName" ControlToValidate="txtNewTopicName" ValidationGroup="NewTopic" runat="server" ErrorMessage="Du skal skrive et navn." Display="Dynamic"></asp:RequiredFieldValidator>
                    </span>
                </td>
            </tr>
            <tr>
                <td style="height:50px;" align="center" class="row4" colspan="2">
                    <span class="genmed">
                        <asp:Button ID="btnNewTopicSave" runat="server" ValidationGroup="NewTopic" Text="Opret emne" OnClick="btnNewTopicSave_Click" />
                        <input id="ResetNewTopic" type="button" value="Nulstil" onclick="return ResetNewTopic_onclick()" />
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
                <td style="height:28px;" class="catLeft" colspan="2">
                    <span class="cattitle">Slet emne</span>
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
                        <asp:Label ID="lblDeleteTopicChoose" AssociatedControlID="drpDeleteTopicChoose" runat="server" Text="Emne<br />(Advarsel! Alle debatter og posts under dette emne vil blive slettet!)"></asp:Label>
                    </span>
                </td>
                <td style="white-space:nowrap;width:50%;" align="center" class="row4" valign="middle">
                    <span class="genmed">
                        <asp:DropDownList ID="drpDeleteTopicChoose" runat="server" AppendDataBoundItems="True" DataTextField="Name" DataValueField="ID" ValidationGroup="DeleteTopic">
                            <asp:ListItem>-Emne-</asp:ListItem>
                        </asp:DropDownList><br />
                        <asp:RegularExpressionValidator ID="regexDeleteTopicChoose" runat="server" ControlToValidate="drpDeleteTopicChoose" ErrorMessage="Du skal vælge et emne." ValidationExpression="\d*" ValidationGroup="DeleteTopic"></asp:RegularExpressionValidator>
                    </span>
                </td>
            </tr>
            <tr>
                <td style="height:50px;" align="center" class="row4" colspan="2">
                    <span class="genmed">
                        <asp:Button ID="btnDeleteTopic" runat="server" ValidationGroup="DeleteTopic" Text="Slet emne" OnClick="btnDeleteTopic_Click" />
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
                <td style="height:28px;" class="catLeft" colspan="2">
                    <span class="cattitle">Upload smiley</span>
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
                        <asp:Label ID="lblNewSmileyDir" AssociatedControlID="fupNewSmileyUpload" runat="server" Text="Sti på smiley"></asp:Label>
                    </span>
                </td>
                <td style="white-space:nowrap;width:50%;" align="center" class="row4" valign="middle">
                    <span class="genmed">
                        <asp:FileUpload ID="fupNewSmileyUpload" CssClass="genmed" runat="server" /><br />
                        <asp:RequiredFieldValidator ID="reqNewSmileyUpload" runat="server" ControlToValidate="fupNewSmileyUpload"
                            Display="Dynamic" ErrorMessage="Du skal vælge et billede." ValidationGroup="NewSmiley"></asp:RequiredFieldValidator>&nbsp;<asp:RegularExpressionValidator
                                ID="rexNewSmileyUpload" runat="server" ControlToValidate="fupNewSmileyUpload"
                                Display="Dynamic" ErrorMessage="Du skal uploade et billede (gif, jpg, png, bmp)."
                                ValidationExpression="[\w\W]+(.jpg|.jpeg|.gif|.bmp|.png)" ValidationGroup="NewSmiley"></asp:RegularExpressionValidator>
                    </span>
                </td>
            </tr>
            <tr>
                <td style="height:50px;width:50%;" class="row4">
                    <span class="genmed">
                        <asp:Label ID="lblNewSmileyName" AssociatedControlID="txtNewSmileyName" runat="server" Text='Navn på smiley (fx. "Stort smil", "Tunge" eller lignende)'></asp:Label>
                    </span>
                </td>
                <td style="white-space:nowrap;width:50%;" align="center" class="row4" valign="middle">
                    <span class="genmed">
                        <asp:TextBox ID="txtNewSmileyName" ValidationGroup="NewSmiley" runat="server"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="reqNewSmileyName" runat="server" ControlToValidate="txtNewSmileyName"
                            ErrorMessage="Du skal skrive et navn." ValidationGroup="NewSmiley"></asp:RequiredFieldValidator>
                    </span>
                </td>
            </tr>
            <tr>
                <td style="height:50px;width:50%;" class="row4">
                    <span class="genmed">
                        <asp:Label ID="lblNewSmileyCode" AssociatedControlID="txtNewSmileyCode" runat="server" Text='Kode for smiley (fx. ":D", ":P" eller lignende)'></asp:Label>
                    </span>
                </td>
                <td style="white-space:nowrap;width:50%;" align="center" class="row4" valign="middle">
                    <span class="genmed">
                        <asp:TextBox ID="txtNewSmileyCode" ValidationGroup="NewSmiley" runat="server"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="reqNewSmileyCode" runat="server" ErrorMessage="Du skal skrive en kode for smileyen."
                            ValidationGroup="NewSmiley" ControlToValidate="txtNewSmileyCode"></asp:RequiredFieldValidator>
                    </span>
                </td>
            </tr>
            <tr>
                <td style="height:50px;" align="center" class="row4" colspan="2">
                    <span class="genmed">
                        <asp:Button ID="btnNewSmileySave" runat="server" ValidationGroup="NewSmiley" Text="Upload smiley" OnClick="btnNewSmileySave_Click" />
                        <input type="button" value="Nulstil" id="ResetNewSmiley" onclick="return ResetNewSmiley_onclick()" />
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
                <td style="height:28px;" class="catLeft" colspan="2">
                    <span class="cattitle">Rediger/slet smiley</span>
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
                        <asp:Label ID="lblEditSmileyChoose" AssociatedControlID="drpEditSmiley" runat="server" Text="Vælg den smiley du vil redigere"></asp:Label>
                    </span>
                </td>
                <td style="white-space:nowrap;width:50%;" align="center" class="row4" valign="middle">
                    <span class="genmed">
                        <asp:DropDownList ID="drpEditSmiley" runat="server" DataSourceID="SqlDataSource1" DataTextField="Code" DataValueField="ID" AppendDataBoundItems="True" AutoPostBack="True" ValidationGroup="EditSmiley" OnSelectedIndexChanged="drpEditSmiley_SelectedIndexChanged">
                            <asp:ListItem>-Smiley-</asp:ListItem>
                        </asp:DropDownList>
                    </span>
                </td>
            </tr>
            <tr>
                <td style="height:50px;width:50%;" class="row4">
                    <span class="genmed">
                        <asp:Label ID="lblEditSmileyImage" AssociatedControlID="txtEditSmileyCode" runat="server" Text="Billede"></asp:Label>
                    </span>
                </td>
                <td style="white-space:nowrap;width:50%;" align="center" class="row4" valign="middle">
                    <span class="genmed">
                        <asp:Label ID="lblEditSmileyImageChoose" runat="server" AssociatedControlID="drpEditSmiley" Text="Vælg smiley"></asp:Label>
                        <asp:Image ID="imgEditSmileyImage" Visible="false" runat="server" /><br />
                        
                    </span>
                </td>
            </tr>
            <tr>
                <td style="height:50px;width:50%;" class="row4">
                    <span class="genmed">
                        <asp:Label ID="lblEditSmileyUplad" AssociatedControlID="fupEditSmileyUpload" runat="server" Text="Nyt billede (lad være tom hvis du vil beholde det gamle billede)"></asp:Label>
                    </span>
                </td>
                <td style="white-space:nowrap;width:50%;" align="center" class="row4" valign="middle">
                    <span class="genmed">
                        <asp:FileUpload ID="fupEditSmileyUpload" runat="server" Enabled="false" /><br />
                        <asp:RegularExpressionValidator ID="rexEditSmileyUpload" runat="server" ControlToValidate="fupEditSmileyUpload"
                            Enabled="False" ErrorMessage="Du skal uploade et billede (gif, jpg, png, bmp)."
                            ValidationExpression="[\w\W]+(.jpg|.jpeg|.gif|.bmp|.png)" ValidationGroup="EditSmiley"></asp:RegularExpressionValidator></span></td>
            </tr>
            <tr>
                <td style="height:50px;width:50%;" class="row4">
                    <span class="genmed">
                        <asp:Label ID="lblEditSmileyName" AssociatedControlID="txtEditSmileyName" runat="server" Text="Navn på smiley"></asp:Label>
                    </span>
                </td>
                <td style="white-space:nowrap;width:50%;" align="center" class="row4" valign="middle">
                    <span class="genmed">
                        <asp:TextBox ID="txtEditSmileyName" runat="server" Enabled="false" ValidationGroup="EditSmiley"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="reqEditSmileyName" runat="server" ControlToValidate="txtEditSmileyName"
                            Enabled="False" ErrorMessage="Du skal angive et navn for smileyen." SetFocusOnError="True"
                            ValidationGroup="EditSmiley"></asp:RequiredFieldValidator>
                    </span>
                </td>
            </tr>
            <tr>
                <td style="height:50px;width:50%;" class="row4">
                    <span class="genmed">
                        <asp:Label ID="lblEditSmileyCode" AssociatedControlID="txtEditSmileyCode" runat="server" Text="Kode for smiley"></asp:Label>
                    </span>
                </td>
                <td style="white-space:nowrap;width:50%;" align="center" class="row4" valign="middle">
                    <span class="genmed">
                        <asp:TextBox ID="txtEditSmileyCode" runat="server" Enabled="false" ValidationGroup="EditSmiley"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="reqEditSmileyCode" runat="server" ControlToValidate="txtEditSmileyCode"
                            Enabled="False" ErrorMessage="Du skal angive en kode for smileyen." SetFocusOnError="True"
                            ValidationGroup="EditSmiley"></asp:RequiredFieldValidator>
                    </span>
                </td>
            </tr>
            <tr>
                <td style="height:50px;" align="center" class="row4" colspan="2">
                    <span class="genmed">
                        <asp:Button ID="btnEditSmileySave" runat="server" ValidationGroup="EditSmiley" Text="Gem smiley" Enabled="False" OnClick="btnEditSmileySave_Click" />
                        <asp:Button ID="btnEditSmileyDelete" OnClientClick="return confirm('Er du sikker på at du vil slette denne smiley?');" runat="server" Text="Slet smiley" CausesValidation="False" Enabled="False" ValidationGroup="EditSmiley" OnClick="btnEditSmileyDelete_Click" />
                        <input type="button" value="Nulstil" id="ResetEditSmiley" onclick="return ResetEditSmiley_onclick()" />
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
        <asp:GridView CssClass="genmed" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                    SortExpression="ID" Visible="False" />
                <asp:TemplateField HeaderText="&#160;&#160;Billede&#160;&#160;">
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("FileName", "~/images/smileys/{0}") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Name" HeaderText="&#160;&#160;Navn&#160;&#160;" SortExpression="Name" />
                <asp:BoundField DataField="Code" HeaderText="&#160;&#160;Kode&#160;&#160;" SortExpression="Code" />
            </Columns>
            <RowStyle HorizontalAlign="Center" />
        </asp:GridView>
    </center>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        DeleteCommand="DELETE FROM [Smileys] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Smileys] ([Name], [Code], [FileName]) VALUES (@Name, @Code, @FileName)"
        SelectCommand="SELECT * FROM [Smileys] ORDER BY [Code]" UpdateCommand="UPDATE [Smileys] SET [Name] = @Name, [Code] = @Code, [FileName] = @FileName WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Code" Type="String" />
            <asp:Parameter Name="FileName" Type="String" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Code" Type="String" />
            <asp:Parameter Name="FileName" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>