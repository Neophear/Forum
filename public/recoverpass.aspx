<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="recoverpass.aspx.cs" Inherits="public_recoverpass" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
        <asp:PasswordRecovery CssClass="gensmall" ID="PasswordRecovery1" runat="server" AnswerLabelText="Svar"
            AnswerRequiredErrorMessage="Svar er p�kr�vet." GeneralFailureText="Dit fors�g p� at resette dit password lykkedes ikke. Pr�v igen."
            QuestionFailureText="Du har angivet forkert svar. Pr�v igen." QuestionInstructionText="Svar p� f�lgende sp�rgsm�l for at resette dit password."
            QuestionLabelText="Sp�rgsm�l:" SubmitButtonText="Reset password" SuccessPageUrl="~/Default.aspx"
            SuccessText="Dit nye password er blevet sendt til din mail." UserNameFailureText="Der skete en fejl. Pr�v igen senere."
            UserNameInstructionText="Skriv dit brugernavn for at resette dit password." UserNameLabelText="Brugernavn:"
            UserNameRequiredErrorMessage="Brugernavn er p�kr�vet." UserNameTitleText="Reset password">
        </asp:PasswordRecovery>
    </center>
</asp:Content>