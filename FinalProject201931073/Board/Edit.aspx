<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="FinalProject201931073.Board.Edit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style101 {
            height: 26px;
        }
        .auto-style102 {
            width: 430px;
            height: 26px;
        }
        .auto-style103 {
            clear: both;
            font-size: small;
            text-align: left;
            width: 69px;
            padding: 10px;
            background-color: lightgrey;
        }
        .auto-style104 {
            width: 430px;
            font-size: xx-small;
        }
        .auto-style105 {
            height: 375px;
        }
        .auto-style106 {
            width: 69px;
        }
        .auto-style107 {
            width: 69px;
            height: 25px;
        }
        .auto-style108 {
            height: 25px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div>
    <h3>글 수정</h3>
    <table class="auto-style105">
        <tr>
            <td style="background-color: #b8dff8" class="auto-style106" >
                작성자</td>
            <td style="width: 430px; background-color: #b8dff8;">
                <asp:TextBox ID="TextBox1" runat="server" Width="150px"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TextBox1" ErrorMessage="작성자를 입력하세요." ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="background-color: #b8dff8" class="auto-style106">
                제목</td>
            <td style="width: 430px; background-color: #b8dff8;">
                <asp:TextBox ID="TextBox3" runat="server" Width="90%"></asp:TextBox> 
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3"
                     ErrorMessage="제목을 입력하세요." ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="background-color: #b8dff8" class="auto-style106" >
                내용</td>
            <td style="width: 430px; background-color: #b8dff8;" >
                <asp:TextBox ID="TextBox4" runat="server" Height="200px" TextMode="MultiLine" 
                    Width="95%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="background-color: #b8dff8" class="auto-style106" >
                첨부 파일</td>
            <td style="background-color: #b8dff8;" class="auto-style3" > 
                <asp:Label ID="Label2" runat="server"></asp:Label>
&nbsp;<asp:Label ID="Label3" runat="server"></asp:Label>
&nbsp;<asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">[파일 삭제]</asp:LinkButton>
&nbsp;<asp:HiddenField ID="HiddenField1" runat="server" />
            </td>
        </tr>
        <tr>
            <td style="background-color: #b8dff8" class="auto-style107" >
                파일 첨부</td>
            <td style="background-color: #b8dff8;" class="auto-style108" > 
                <asp:FileUpload ID="FileUpload1" runat="server" />
                <strong>&nbsp;*먼저 위의 파일 삭제</strong></td>
        </tr>
        <tr>
            <td style="background-color: #b8dff8" class="auto-style103"></td>
            <td style="background-color: #b8dff8;" class="auto-style104"><asp:ImageButton ID="ImageButton1" runat="server" 
                    ImageUrl="~/Images/btn_edit.gif" onclick="ImageButton1_Click" /> &nbsp; 
                <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                    ImageUrl="~/Images/btn_list.gif" PostBackUrl="~/Board/List.aspx" />
           </td>
        </tr>
        </table>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
    <br />
</div>
</asp:Content>
