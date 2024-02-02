<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="myLogin.aspx.cs" Inherits="FinalProject201931073.myLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            height: 25px;
        }
        .auto-style103 {
            height: 24px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div>
    <h2>로그인</h2>
        <table class="auto-style2">
            <tr>
                <td class="auto-style4">아이디</td>
                <td class="auto-style3">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style6" rowspan="2">
                    <asp:Button ID="Button1" runat="server" Height="47px" Text="로그인" Width="64px" OnClick="Button1_Click" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">비밀번호</td>
                <td class="auto-style2">
                    <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style103"></td>
                <td class="auto-style103">
                    <asp:CheckBox ID="CheckBox1" runat="server" Text="로그인 상태 유지" />
                </td>
                <td class="auto-style103"></td>
            </tr>
        </table>
        <br />
        <strong>
        <asp:Label ID="Label1" runat="server" CssClass="auto-style5" style="color: #FF33CC"></asp:Label>
        </strong>
        <br />
        <br />
        <br />
        <br />
</div>
</asp:Content>
