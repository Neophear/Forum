<%@ Page Language="C#" AutoEventWireup="true" CodeFile="2.aspx.cs" Inherits="foredrag_2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
    <head runat="server">
        <title>Foredrag om Regex</title>
        <link rel="stylesheet" href="style.css" type="text/css" />
    </head>
    <body>
        <form id="form1" runat="server">
            <h3>Hvad bruger man det til?</h3>
            BB-kode for fed skrift<div class="code">[b]Hej med dig[/b]</div>
            <br />
            HTML-kode for fed skrift<br /><div class="code">&lt;b&gt;Hej med dig&lt;/b&gt;</div>
            <br />
            BB-kode med fejl<br /><div class="code">[b]Hej med dig[/b][b]</div>
            <br />
            HTML-kode med fejl<br /><div class="code">&lt;b&gt;Hej med dig&lt;/b&gt;&lt;b&gt;</div><br />
            <a href="3.aspx">Hvordan ser sproget ud?</a>
        </form>
    </body>
</html>