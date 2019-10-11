<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="createthread.aspx.cs" Inherits="createthread" Title="Untitled Page" %>

<%@ Register Src="editor.ascx" TagName="editor" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:editor ID="Editor1" runat="server" SubTitle="Her kan du oprette en ny debat."
        Title="Opret debat" />
</asp:Content>