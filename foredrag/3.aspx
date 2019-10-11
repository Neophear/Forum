<%@ Page Language="C#" AutoEventWireup="true" CodeFile="3.aspx.cs" Inherits="foredrag_3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
    <head runat="server">
        <title>Foredrag om Regex</title>
        <link rel="stylesheet" href="style.css" type="text/css" />
    </head>
    <body>
        <form id="form1" runat="server">
            <h3>Hvordan ser sproget ud?</h3>
            Finde et tal
            <div class="code">tekst\d</div>
            <br />
            Finde flere tal<br />
            <div class="code">tekst\d+</div>
            <br />
            Finde ord<br />
            <div class="code">[a-z]+</div>
            <br />
            Finde kombination med bogstaver og tal<br /><div class="code">[a-z\d]+</div>
            <br />
            Finde ord der gentager sig med grupper<br />
            <div class="code">([a-z]+)\s\1</div>
            <br />
            Finde ord der gentager sig med navngivne grupper<br />
            <div class="code">(?&lt;ord&gt;[a-z]+)\s\&lt;ord&gt;</div>
            <br />
            <a href="4.aspx">Hvordan bruges det</a>
        </form>
    </body>
</html>