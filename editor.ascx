<%@ Control Language="C#" AutoEventWireup="true" CodeFile="editor.ascx.cs" Inherits="editor" %>
<script type="text/javascript">
    //Variables for controlling opening and closing tags (function tag)
    var b = 2;
    var i = 2;
    var u = 2;
    var q = 2;
    var c = 2;
    var url = 2;
    var img = 2;

    //Function for creating non-font tags
    function focus()
    {
        document.forms[0].<%= txtPost.ClientID %>;
    }
    function tag(v, tagadd, newbut, tagclose, oldbut, name)
    {
        if (eval(v)%2 == 0)
        {
            eval("document.forms[0]." + name + ".value = newbut;");
            var Post = document.forms[0].<%= txtPost.ClientID %>.value;
            document.forms[0].<%= txtPost.ClientID %>.value = Post + tagadd;
            document.forms[0].<%= txtPost.ClientID %>;
        }
        else
        {
            eval("document.forms[0]." + name + ".value = oldbut;");
            var Post = document.forms[0].<%= txtPost.ClientID %>.value;
            document.forms[0].<%= txtPost.ClientID %>.value = Post + tagclose;
            document.forms[0].<%= txtPost.ClientID %>.focus();
        }
        eval(v + "++;");
    }

    //Function for adding font color and size tags
    function font(bbopen, bbclose)
    {
        var Post = document.forms[0].<%= txtPost.ClientID %>;
        Post.value += bbopen + bbclose;
        Post.focus();
        return;
    }

    //Function for adding smileys
    function smiley (smiley)
    {
        var Post = document.forms[0].<%= txtPost.ClientID %>;
        Post.value += " " + smiley + " ";
        Post.focus();
        return;
    }

    //Helpbox messages
    bold_help = "Fed tekst: [b]tekst[/b]";
    italic_help = "Kursiv tekst: [i]tekst[/i]";
    underline_help = "Understreget tekst: [u]tekst[/u]";
    quote_help = "Citeret tekst: [quote]tekst[/quote] eller [quote=navn]tekst[/quote]";
    code_help = "Kode: [code]kode[/code]";
    img_help = "Indsæt billede: [img]http://billede_url[/img]";
    url_help = "Indsæt link: [url]http://url[/url] eller [url=http://url]Link navn[/url]";
    fontcolor_help = "Tekst farve: [color=red]tekst[/color]  Tip: Du kan også bruge [color=#FF0000]";
    fontsize_help = "Tekst størrelse: [size=6]lille tekst[/size]";

    //Function for displaying help information

    // Shows the help messages in the helpline window
    function helpline(help)
    {
        var helpbox = document.forms[0].helpbox;
        helpbox.value = eval(help + "_help");
    }
    function ResetEditor_onclick() {
        if(confirm("Feltet vil blive nulstillet til som det var før.\nEr du sikker?"))
        {
            document.forms[0].<%= txtPost.ClientID %>.value = document.forms[0].<%= txtPost.ClientID %>.defaultValue;
            document.forms[0].<%= txtSubject.ClientID %>.value = document.forms[0].<%= txtSubject.ClientID %>.defaultValue;
        }
    }
</script>
<div id="post"></div>
<table border="0" cellpadding="2" cellspacing="1" class="forumline" width="100%">
    <tr>
        <td style="height:28px;" align="center" class="catLeft" colspan="2">
            <asp:Label CssClass="cattitle" ID="lblTitle" runat="server" Text="Post ny besked"></asp:Label>
        </td>
    </tr>
    <tr>
        <th style="height:20px;white-space:nowrap;" class="thCornerL" colspan="2">
            <asp:Label ID="lblSubTitle" runat="server" Text="&nbsp;Her kan du poste en ny besked.&nbsp;"></asp:Label>
        </th>
    </tr>
    <tr>
        <td style="height:50px;width:50%;" align="center" class="row4" colspan="2">
            <table>
                <tr>
                    <td>
                        <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
                            <HeaderTemplate>
                                <table>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server"></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                    <asp:Label ID="Label2" runat="server" Visible="false" Text="</tr>"></asp:Label>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </td>
                    <td>
                        <span class="genmed">
                            <asp:Label CssClass="genmed" ID="lblSubject" runat="server" Text="Emne:"></asp:Label>
                            <asp:TextBox CssClass="genmed" ID="txtSubject" Columns="50" runat="server"></asp:TextBox><br />
                            <input type="button" class="button" value="Fed" name="bold" onclick="javascript:tag('b', '[b]', 'Fed*', '[/b]', 'Fed', 'bold');"
                                onmouseover="helpline('bold')" />
                            <input type="button" class="button" value="Kursiv" name="italic" onclick="javascript:tag('i', '[i]', 'Kursiv*', '[/i]', 'Kursiv', 'italic');"
                                onmouseover="helpline('italic')" />
                            <input type="button" class="button" value="Understreget" name="underline" onclick="javascript:tag('u', '[u]', 'Understreget*', '[/u]', 'Understreget', 'underline');"
                                onmouseover="helpline('underline')" />
                            <input type="button" class="button" value="Citat" name="quote" onclick="javascript:tag('q', '[quote]', 'Citat*', '[/quote]', 'Citat', 'quote');"
                                onmouseover="helpline('quote')" />
                            <input type="button" class="button" value="Kode" name="code" onclick="javascript:tag('c', '[code]', 'Kode*', '[/code]', 'Kode', 'code');"
                                onmouseover="helpline('code')" />
                            <input type="button" class="button" value="Url" name="url" onclick="javascript:tag('url', '[url]', 'Url*', '[/url]', 'Url', 'url');"
                                onmouseover="helpline('url')" />
                            <input type="button" class="button" value="Billede" name="img" onclick="javascript:tag('img', '[img]', 'Billede*', '[/img]', 'Billede', 'img');"
                                onmouseover="helpline('img')" />
                            <br />
                            Tekststørrelse:
                            <select name="fontsize" onchange="font('[size=' + this.form.fontsize.options[this.form.fontsize.selectedIndex].value + ']', '[/size]'); this.selectedIndex=2;"
                                onmouseover="helpline('fontsize')" class="form_elements_dropdown">
                                <option value="4">Meget lille</option>
                                <option value="6">Lille</option>
                                <option value="8" selected="selected">Normal</option>
                                <option value="10">Stor</option>
                                <option value="12">Meget stor</option>
                            </select>
                            Tekstfarve:
                            <select name="fontcolor" onchange="font('[color=' + this.form.fontcolor.options[this.form.fontcolor.selectedIndex].value + ']', '[/color]'); this.selectedIndex=0;"
                                onmouseover="helpline('fontcolor')" class="form_elements_dropdown">
                                <option value="black" style="color: black;">Sort</option>
                                <option value="silver" style="color: silver;">Sølv</option>
                                <option value="gray" style="color: gray;">Grå</option>
                                <option value="maroon" style="color: maroon;">Maroon</option>
                                <option value="red" style="color: red;">Rød</option>
                                <option value="purple" style="color: purple;">Lilla</option>
                                <option value="fuchsia" style="color: fuchsia;">Lyserød</option>
                                <option value="navy" style="color: navy;">Navy</option>
                                <option value="blue" style="color: blue;">Blå</option>
                                <option value="aqua" style="color: aqua;">Aqua</option>
                                <option value="teal" style="color: teal;">Teal</option>
                                <option value="lime" style="color: lime;">Lime</option>
                                <option value="green" style="color: green;">Grøn</option>
                                <option value="olive" style="color: olive;">Oliven</option>
                                <option value="yellow" style="color: yellow;">Gul</option>
                                <option value="white" style="color: white;">Hvid</option>
                            </select>
                            <br />
                            <input type="text" name="helpbox" size="75" class="helpbox" readonly="readonly" /><br />
                            Post:<br />
                            <asp:TextBox ID="txtPost" TextMode="MultiLine" Rows="10" Columns="58" runat="server"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPost" ErrorMessage="Du skal skrive noget i feltet." ValidationGroup="Editor"></asp:RequiredFieldValidator></span></td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td style="height:50px;" align="center" class="row4" colspan="2">
            <span class="genmed">
                <asp:Button ID="btnSubmit" runat="server" Text="Gem" ValidationGroup="Editor" OnClick="btnSubmit_Click" />
                <input type="button" value="Nulstil" id="ResetEditor" onclick="return ResetEditor_onclick()" />
            </span>
        </td>
    </tr>
    <tr>
        <td style="height:15px;" class="v2" colspan="2">
            &nbsp;
        </td>
    </tr>
</table>