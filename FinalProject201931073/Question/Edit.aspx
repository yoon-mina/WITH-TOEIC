<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="FinalProject201931073.Question.Edit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style2 {
        width: 500px;
    }
    .auto-style4 {
        color: #0000FF;
    }
        .auto-style5 {
            text-align: center;
            width: 91px;
        }
        .auto-style6 {
            text-align: center;
            width: 91px;
            height: 23px;
        }
        .auto-style7 {
            color: #0000FF;
            height: 23px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
    <h2>문제 풀이 수정</h2>
    <table class="auto-style2">
        <tr>
            <td class="auto-style5">문제 제목</td>
            <td class="auto-style4">
                <asp:TextBox ID="TextBox1" runat="server" Width="90%"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="사진 제목을 입력하세요." ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">문제 풀이</td>
            <td class="auto-style4">
                <asp:TextBox ID="TextBox2" runat="server" Width="90%" Rows="3" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">작성자</td>
            <td class="auto-style7">
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">사진</td>
            <td class="auto-style4">
                <asp:Label ID="Label2" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:Image ID="Image1" runat="server" Width="90px" />
            </td>
            <td class="auto-style4">
                <asp:Button ID="Button3" runat="server" Text="수 정" OnClick="Button3_Click" />
&nbsp;<asp:Button ID="Button4" runat="server" Text="취 소" OnClick="Button4_Click" CausesValidation="False" />
                <br />
                <br />
    <strong>
    <asp:Label ID="Label1" runat="server" CssClass="auto-style4"></asp:Label>
                <br />
    </strong>
            </td>
        </tr>
    </table>
   
    <br />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
    <br />
    <br />
    <br />
    <br />
    <br />
</div>

</asp:Content>
