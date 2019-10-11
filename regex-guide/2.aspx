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
            Som sagt bruges Regex til at h�ndtere Regular Expressions. Som eksempel vil jeg
            bruge BB-koder. Fx. [b]Tekst[/b] som s� skal �ndres til &lt;b&gt;Tekst&lt;/b&gt;.
            Dette kan let g�res med en replace direkte p� stringen. Men det er en d�rlig l�sning.
            For hvis vi nu siger at det er p� et forum, hvor BB-divr oftest bruges. S� kan
            det blive et problem at replace. Se f�lgende eksempel:<br />
            <br />
            Her har vi noget tekst med BB-div som en bruger vil poste:<br />
            <br /><div class="code">[b]Hej med dig[/b]</div>
            <br />
            <br />
            Det vil s� efter en replace direkte p� stringen blive �ndret til:<br />
            <br /><div class="code">&lt;b&gt;Hej med dig&lt;/b&gt;</div>
            <br />
            <br />
            Men hvad nu hvis brugeren lige kommer til at skrive forkert eller med vilje g�r
            f�lgende:<br />
            <br /><div class="code">[b]Hej med dig[/b][b]</div>&nbsp;<br />
            <br />
            S� vil det blive �ndret til:<br />
            <br /><div class="code">&lt;b&gt;Hej med dig&lt;/b&gt;&lt;b&gt;</div><br />
            <br />
            Dvs. at resten af teksten p� siden bliver fed. Det er jo ikke s� godt.<br />
            <br />
            Derfor bruger man Regular Expressions til s�dan noget. Der kan man s�tte det til
            at tjekke p� om der b�de er et start- og et slut-tag. Hvis der er det skal det �ndres.
            Ellers ikke.<br />
            <br />
            Regular Expressions kan ogs� bruges til at validere med. Fx. hvis du har en textbox
            p� din side som skal indeholde en mail kan du validere om det nu ogs� er en email-adresse
            som bliver skrevet i feltet.<br /><br />
            <a href="3.aspx">Hvordan ser sproget ud?</a>
        </form>
    </body>
</html>