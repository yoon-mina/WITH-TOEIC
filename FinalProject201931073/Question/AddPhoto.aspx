<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="AddPhoto.aspx.cs" Inherits="FinalProject201931073.Question.AddPhoto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style2 {
        width: 500px;
    }
    .auto-style3 {
        width: 110px;
        text-align: center;
    }
    .auto-style4 {
        color: #0000FF;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
    <h2>문제 추가</h2>
    <table class="auto-style2">
        <tr>
            <td class="auto-style3">문제 제목 </td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" Width="90%"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="사진 제목을 입력하세요." ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">문제 풀이 </td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server" Width="90%" Rows="3" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">작성자</td>
            <td>
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">비밀번호</td>
            <td>
                <asp:TextBox ID="TextBox4" runat="server" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">사진</td>
            <td>
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
        </tr>
    </table>
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button1" runat="server" Text="문제 올리기" OnClick="Button1_Click" />
&nbsp;<asp:Button ID="Button2" runat="server" Text="문제 풀이 페이지 이동" CausesValidation="False" PostBackUrl="~/Question/List.aspx" />
    <br />
    <br />
    <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label1" runat="server" CssClass="auto-style4"></asp:Label>
    <br />
    </strong>
    <br />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
    <br />
    <br />
    <br />
    <br />
    <br />
</div>
</asp:Content>
