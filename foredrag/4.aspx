<%@ Page Language="C#" AutoEventWireup="true" CodeFile="4.aspx.cs" Inherits="foredrag_3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
    <head runat="server">
        <title>Foredrag om Regex</title>
        <link rel="stylesheet" href="style.css" type="text/css" />
    </head>
    <body>
        <form id="form1" runat="server">
            <h3>Hvordan bruges det?</h3>
            Regular Expression der finder datoer:<br />
            <br />
            Find tal<br />
            <div class="code">\d</div>
            <br />
            Find to tal efter hinanden<br />
            <div class="code">\d{2}</div><br />
            Find to tal efter hinanden efterfulgt af en bindestreg (-)<br />
            <div class="code">\d{2}-</div><br />
            Find datoer som fx. 12-04-1987<br />
            <div class="code">\d{2}-\d{2}-\d{4}</div>
            <br />
            Find datoer som fx. 12-04-1987 eller 01-09-90<br />
            <div class="code">\d{1,2}-\d{1,2}-\d{2,4}</div><br />
            Namespace<br />
            <div class="code">
                using System.Text.RegularExpressions;</div>
            <br />
            Opret regex<br />
            <div class="code">Regex finddates = new Regex(@"\d{1,2}-\d{1,2}-\d{2,4}")</div>
            <br />
            Kode for at finde datoer og udskrive dem<br />
            <div class="code">
                Regex finddates = new Regex(@"\d{1,2}-\d{1,2}-\d{2,4}");<br />
                string text = "Her står en dato: 12-04-1987. Og endnu en: 1-2-90.";<br />
                <br />
                MatchCollection matches = regex.Matches(text);<br />
                <br />
                foreach (Match date in matches)<br />
                {<br />
                &nbsp;&nbsp; Response.Write(date + "&lt;br /&gt;");<br />
                }<br />
            </div>
            <br />
            Kode til at udskifte BB-koder med HTML-koder<br />
            <div class="code">
                List<regex></regex>
                regexlist = new List<regex></regex>();<br />
                string text = "[b]fed skrift[/b][u]understreget[/u][i]kursiv[/i]";<br />
                string newtext;<br />
                <br />
                regexlist.Add(new Regex(@"\[(?&lt;tag&gt;b)\](?&lt;text&gt;[\w\W]*?)\[/b\]"));<br />
                regexlist.Add(new Regex(@"\[(?&lt;tag&gt;i)\](?&lt;text&gt;[\w\W]*?)\[/i\]"));<br />
                regexlist.Add(new Regex(@"\[(?&lt;tag&gt;u)\](?&lt;text&gt;[\w\W]*?)\[/u\]"));<br />
                <br />
                foreach (Regex regex in regexlist)<br />
                {<br />
                &nbsp;&nbsp; newtext = regex.Replace(text, "&lt;$1&gt;$2&lt;/$1&gt;");<br />
                }<br />
                <br />
                Response.Write(newtext);</div>
            
        </form>
    </body>
</html>