<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="CheckPassword.aspx.cs" Inherits="FinalProject201931073.Board.CheckPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style type="text/css">
        .auto-style2 {
            color: #FF3399;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div>
    <h2>비밀번호 확인</h2>* 글을 작성할 때 입력한 비밀번호를 입력하세요.&nbsp;&nbsp;&nbsp;
    <br />
    <br />
&nbsp;글 비밀번호 :
    <asp:TextBox ID="TextBox1" runat="server" TextMode="Password"></asp:TextBox>
    <br />
    <br />
&nbsp;<strong><asp:Label ID="Label1" runat="server" CssClass="auto-style2"></asp:Label>
    </strong>
    <br />
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:ImageButton ID="ImageButton1" runat="server" OnClick="ImageButton1_Click" />
&nbsp;<asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Images/btn_list.gif" PostBackUrl="~/Board/List.aspx" />
    <br />
    <br />

</div>
</asp:Content>
