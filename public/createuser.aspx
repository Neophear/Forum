<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="createuser.aspx.cs" Inherits="createuser" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
        <asp:CreateUserWizard CssClass="gensmall" ID="CreateUserWizard1" runat="server" AnswerLabelText="Sikkerheds sp�rgsm�l:" AnswerRequiredErrorMessage="Sikkerhedssvar er p�kr�vet." CancelButtonText="Annuller" CancelDestinationPageUrl="~/Default.aspx" CompleteSuccessText="Din bruger blev oprettet." ConfirmPasswordCompareErrorMessage="De to passwords skal v�re ens." ConfirmPasswordLabelText="Bekr�ft password:" ConfirmPasswordRequiredErrorMessage="Du skal bekr�fte dit password." ContinueButtonText="Forts�t" ContinueDestinationPageUrl="~/Default.aspx" CreateUserButtonText="Opret bruger" DuplicateEmailErrorMessage="Email-adressen du har indtastet er allerede i brug. Pr�v en anden." DuplicateUserNameErrorMessage="Indtast venligst et andet brugernavn." EmailRegularExpressionErrorMessage="Indtast venligst en anden emailadresse." EmailRequiredErrorMessage="Email er p�kr�vet." FinishCompleteButtonText="Afslut" FinishDestinationPageUrl="~/Default.aspx" FinishPreviousButtonText="Tilbage" InvalidAnswerErrorMessage="Indtast venligst et andet sikkerhedssvar." InvalidEmailErrorMessage="Indtast venligst en valid email-adresse." InvalidPasswordErrorMessage="Password skal v�re p� minimum {0} tegn." InvalidQuestionErrorMessage="Indtast venligst et andet sikkerhedssp�rgsm�l." LoginCreatedUser="False" PasswordRegularExpressionErrorMessage="Indtast venligst et andet password." PasswordRequiredErrorMessage="Password er p�kr�vet." QuestionLabelText="Sikkerhedssp�rgsm�l:" QuestionRequiredErrorMessage="Sikkerhedssp�rgsm�l er p�kr�vet." StartNextButtonText="N�ste" StepNextButtonText="N�ste" StepPreviousButtonText="Tilbage" UnknownErrorMessage="Din bruger blev ikke oprettet. Pr�v igen." UserNameLabelText="Brugernavn:" UserNameRequiredErrorMessage="Brugernavn er p�kr�vet." OnCreatedUser="CreateUserWizard1_CreatedUser">
            <WizardSteps>
                <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                    <ContentTemplate>
                        <table border="0">
                            <tr>
                                <td align="center" colspan="2">
                                    Opret bruger</td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Brugernavn:</asp:Label></td>
                                <td>
                                    <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                        ErrorMessage="Brugernavn er p�kr�vet." ToolTip="Brugernavn er p�kr�vet." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label></td>
                                <td>
                                    <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                        ErrorMessage="Password er p�kr�vet." ToolTip="Password er p�kr�vet." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Bekr�ft password:</asp:Label></td>
                                <td>
                                    <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword"
                                        ErrorMessage="Du skal bekr�fte dit password." ToolTip="Du skal bekr�fte dit password."
                                        ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label></td>
                                <td>
                                    <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email"
                                        ErrorMessage="Email er p�kr�vet." ToolTip="Email er p�kr�vet." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question">Sikkerhedssp�rgsm�l:</asp:Label></td>
                                <td>
                                    <asp:TextBox ID="Question" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" ControlToValidate="Question"
                                        ErrorMessage="Sikkerhedssp�rgsm�l er p�kr�vet." ToolTip="Sikkerhedssp�rgsm�l er p�kr�vet."
                                        ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">Sikkerhedssvar:</asp:Label></td>
                                <td>
                                    <asp:TextBox ID="Answer" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer"
                                        ErrorMessage="Sikkerhedssvar er p�kr�vet." ToolTip="Sikkerhedssvar er p�kr�vet."
                                        ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2">
                                    <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password"
                                        ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="De to passwords skal v�re ens."
                                        ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="color: red">
                                    <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:CreateUserWizardStep>
                <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                    <ContentTemplate>
                        <table border="0">
                            <tr>
                                <td align="center" colspan="2" style="height: 20px">
                                    Opret bruger</td>
                            </tr>
                            <tr>
                                <td>
                                    Din bruger blev oprettet.</td>
                            </tr>
                            <tr>
                                <td align="right" colspan="2">
                                    <asp:Button ID="ContinueButton" runat="server" CausesValidation="False" CommandName="Continue"
                                        Text="Forts�t" ValidationGroup="CreateUserWizard1" />
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:CompleteWizardStep>
            </WizardSteps>
        </asp:CreateUserWizard>
    </center>
</asp:Content>