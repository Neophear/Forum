<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="recoverpass.aspx.cs" Inherits="public_recoverpass" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
        <asp:PasswordRecovery CssClass="gensmall" ID="PasswordRecovery1" runat="server" AnswerLabelText="Svar"
            AnswerRequiredErrorMessage="Svar er påkrævet." GeneralFailureText="Dit forsøg på at resette dit password lykkedes ikke. Prøv igen."
            QuestionFailureText="Du har angivet forkert svar. Prøv igen." QuestionInstructionText="Svar på følgende spørgsmål for at resette dit password."
            QuestionLabelText="Spørgsmål:" SubmitButtonText="Reset password" SuccessPageUrl="~/Default.aspx"
            SuccessText="Dit nye password er blevet sendt til din mail." UserNameFailureText="Der skete en fejl. Prøv igen senere."
            UserNameInstructionText="Skriv dit brugernavn for at resette dit password." UserNameLabelText="Brugernavn:"
            UserNameRequiredErrorMessage="Brugernavn er påkrævet." UserNameTitleText="Reset password">
        </asp:PasswordRecovery>
    </center>
</asp:Content>