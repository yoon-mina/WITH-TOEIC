<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Reply.aspx.cs" Inherits="FinalProject201931073.Board.Reply" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style103 {
            width: 418px;
        }
        .auto-style104 {
            width: 525px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div>
    <h3>댓글쓰기</h3>
    <table class="auto-style104">
        <tr>
            <td style="background-color: #b8dff8" >
                작성자</td>
            <td style="background-color: #b8dff8;" class="auto-style103">
                <asp:TextBox ID="TextBox1" runat="server" Width="150px"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TextBox1" ErrorMessage="작성자를 입력하세요." ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="background-color: #b8dff8">
                글 비밀번호</td>
            <td style="background-color: #b8dff8;" class="auto-style103">
                <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" Width="150px"></asp:TextBox> 
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2"
                     ErrorMessage="글 비밀번호를 입력하세요." ForeColor="Red">*</asp:RequiredFieldValidator>
           </td>
        </tr>
        <tr>
            <td style="background-color: #b8dff8">
                제목</td>
            <td style="background-color: #b8dff8;" class="auto-style103">
                <asp:TextBox ID="TextBox3" runat="server" Width="90%"></asp:TextBox> 
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3"
                     ErrorMessage="제목을 입력하세요." ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="background-color: #b8dff8" >
                내용</td>
            <td style="background-color: #b8dff8;" class="auto-style103" >
                <asp:TextBox ID="TextBox4" runat="server" Height="200px" TextMode="MultiLine" 
                    Width="95%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="background-color: #b8dff8" class="auto-style2" >
                파일 첨부</td>
            <td style="background-color: #b8dff8;" class="auto-style103" > 
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
        </tr>
        <tr>
            <td style="background-color: #b8dff8"></td>
            <td style="background-color: #b8dff8;" class="auto-style103"><asp:ImageButton ID="ImageButton1" runat="server" 
                    ImageUrl="~/Images/btn_reply.gif" OnClick="ImageButton1_Click" /> &nbsp; 
                <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                    ImageUrl="~/Images/btn_list.gif" PostBackUrl="~/Board/List.aspx" />
           </td>
        </tr>
        </table>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
    <br />
</div>
</asp:Content>
