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
            Regular Expressions ser lidt roddet ud n�r man lige f�rst ser dem.
            Man skriver det man vil finde og indimellem inds�tter man specielle koder for at indikere at man
            vil finde en speciel type eller kombination af tegn. Fx. hvis man vil finde ordet
            "tekst" som er efterfulgt af et et-cifret tal skal man skrive det p� f�lgende m�de:<br />
            <br /><div class="code">tekst\d</div><br />
            <br />
            "tekst" betyder at vi vil ordet "tekst" og det efterf�lgende "\d" betyder at vi
            vil finde et et-cifret tal. S� med dette expression finder vi tekster som fx. "tekst5",
            "tekst9" osv.<br />
            Nu vil vi pr�ve at finde ordet "tekst" efterfulgt af et tal uanset hvor mange cifre
            det tal er p�. Det g�r vi s�dan her:<br />
            <br /><div class="code">tekst\d+</div>
            <br />
            <br />
            Plusset efter "\d" betyder at vi vil finde tal som er p� et eller flere cifre. S�
            nu finder vi fx. "tekst304", "tekst2" osv.<br />
            Hvis nu vi vil finde et tilf�ldigt ord g�r skal vi lave en gruppe af tegn som vi
            vil lede efter. Til det bruger vi "[" og "]". Fx. s�dan her:<br />
            <br /><div class="code">[a-z]+</div><br />
            <br />
            Med denne s�tning finder vi alle kombinationer der indeholder tegnene a-z som indeholder
            mindst et tegn. Vi kan ogs� bare skrive "[agk]" i stedet for at finde alle de kombinationer
            som indeholder mindst et af de bogstaver. Men kun de bogstaver.<br />
            Hvis vi s� vil finde kombinationer som indeholder enten tal eller bogstaver eller
            begge dele kan vi g�re p� denne m�de:<br />
            <br /><div class="code">[a-z\d]+</div><br />
            <br />
            Det er ogs� muligt at lave grupper. De fungerer s�dan at man kan "fange" en gruppe
            og bruge den senere. Fx. hvis man vil finde to ens ord efter hinanden kan man g�re
            s�ledes:<br />
            <br />
            <div class="code">([a-z]+)\s\1</div><br />
            <br />
            Paranteserne omkring "[a-z]+" betyder at man laver en gruppe som man vil bruge senere.
            Den f�r automatisk nummeret 1. "\s" st�r for " ", alts� mellemrum, og det sidste
            "\1" henviser til gruppe #1. S� denne s�tning finder alts� kombinationer hvor to
            ord efterfulgt af hinanden er ens.<br />
            Man kan ogs� navngive gruppen p� f�lgende m�de:<br />
            <br />
            <div class="code">(?&lt;ord&gt;[a-z]+)\s\&lt;ord&gt;</div><br />
            <br />
            Denne s�tning fungerer p� samme m�de bortset fra at vi bare har navngivet gruppen
            i stedet. Grupper kan ogs� bruges til andre ting. Det kommer jeg ind p� i n�ste
            afsnit.<br />
            <br />
            <a href="4.aspx">Hvordan bruges det</a>
        </form>
    </body>
</html>