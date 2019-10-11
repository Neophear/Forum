<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="public_login" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
        <asp:Login CssClass="gensmall" ID="Login1" runat="server" FailureText="Du blev ikke logget ind. Prøv igen."
            LoginButtonText="Log Ind" PasswordRequiredErrorMessage="Password er påkrævet."
            RememberMeText="Husk mig næste gang," TitleText="Log ind" UserNameLabelText="Brugernavn:"
            UserNameRequiredErrorMessage="Brugernavn er påkrævet." CreateUserText="Opret bruger" CreateUserUrl="~/public/createuser.aspx" DestinationPageUrl="~/Default.aspx" PasswordRecoveryText="Glemt password?" PasswordRecoveryUrl="~/public/recoverpass.aspx">
        </asp:Login>
    </center>
</asp:Content>