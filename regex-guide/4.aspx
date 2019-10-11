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
            Først skal man lave sit Regular Expression. Til det kan man fx. bruge programmet
            Expresso hvori man kan teste sine expressions, man kan gennemgå deres tutorial,
            få hjælp og bruge deres standard expressions eller få idéer fra dem. Når man leger
            med Regular Expressions er det vigtigt at man tager et skridt ad gangen. Starter
            med at finde en del af en tekst og så pejler man sig mere og mere ind på det man
            vil finde. Ellers bliver det for uoverskueligt.<br />
            Vi vil prøve at lave et expression der finder datoer.<br />
            <br />
            Vi starter med at finde alle tal. Det gør vi med følgende expression:<br />
            <br />
            <div class="code">\d</div><br />
            <br />
            \d betyder at vi vil finde alle et-cifrede tal. Det vil vi så udvidde lidt på følgende
            måde:<br />
            <br />
            <div class="code">\d{2}</div><br />
            <br />
            Denne sætning finder alle tal der er på 2 cifre. {2} lige efter \d indikerer at
            tallet skal være på 2 tegn.<br />
            Det kan så udvides med et tegn. Fx:<br />
            <br />
            <div class="code">\d{2}-</div><br />
            <br />
            Nu finder den alle tocifrede tal der er efterfulgt af en bindestreg.<br />
            Det kan vi så bruge til at finde datoer ved at sætte det sammen på følgende måde:<br />
            <br />
            <div class="code">\d{2}-\d{2}-\d{4}</div><br />
            <br />
            Nu finder den datoer som fx. 12-04-1987. Men hvad nu hvis man vil finde datoer der
            kun har et ciffer i dagen eller måneden? Eller kun 2 cifre i året? Fx. 3-12-2006 eller 11-9-01. Så må vi
            udvidde vores sætning lidt mere.<br />
            <br />
            <div class="code">\d{1,2}-\d{1,2}-\d{2,4}</div><br />
            <br />
            \d{1,2} indikerer at den skal finde alle tal der enten har et eller to cifre. Så
            den finder både tal som 7 og 23.<br />
            Så nu har vi en sætning som finder alle datoer.<br />
            Så skal vi inkludere det rette namespace. Det ligger under System.Text.RegularExpressions.
            Derefter kan vi lave følgende kode:<br />
            <br />
            <div class="code">Regex finddates = new Regex("---Expression---")</div>
            <br />
            Der hvor der står "---Expression---" skal man skrive sit Regular Expression. Så
            i vores tilfælde kommer linien til at være som følgende:<br />
            <br />
            <div class="code">Regex finddates = new Regex(@"\d{1,2}-\d{1,2}-\d{2,4}")</div>
            <br />
            Nu har vi instantieret vores Regular Expression. Grunden til at der er et "@" foran
            er for at "\" ikke skal escape karakterer.<br />
            Dette regex kan vi blandt andet bruge til
            at finde kombinationer eller erstatte kombinationer i en streng. Vi vil først prøve
            at finde alle datoer i vores streng og så udskrive dem. Det gør vi sådan her:<br />
            <br />
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
            Her får vi alle datoer udskrevet med linieskift.<br />
            <br />
            Hvis vi vil lave et regex der skal lave BB-koder om til html kan vi gøre således
            (jeg bruger List&lt;&gt; da jeg synes den er rarest:<br />
            <br />
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
                Response.Write(newtext);<br />
            </div>
            <br />
            Nu får vi udskrevet teksten hvor den er lavet til html.<br />
            <br />
            
        </form>
    </body>
</html>