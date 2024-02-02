<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Read.aspx.cs" Inherits="FinalProject201931073.Board.Read" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style103 {
            height: 26px;
        }
        .auto-style104 {
            width: 430px;
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
    <h3>파일(자료) 보기</h3>
    <table>
        <tr>
            <td style="background-color: #b8dff8" >
                작성자</td>
            <td style="width: 430px; background-color: #b8dff8;">
                <asp:Label ID="Label2" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="background-color: #b8dff8">
                작성일자</td>
            <td style="width: 430px; background-color: #b8dff8;">
                <asp:Label ID="Label3" runat="server"></asp:Label>
           </td>
        </tr>
        <tr>
            <td style="background-color: #b8dff8">
                제목</td>
            <td style="width: 430px; background-color: #b8dff8;">
                <asp:Label ID="Label4" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="background-color: #b8dff8" >
                내용</td>
            <td style="width: 430px; background-color: #b8dff8;" >
                <asp:TextBox ID="TextBox4" runat="server" Height="200px" TextMode="MultiLine" 
                    Width="95%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="background-color: #b8dff8" class="auto-style2" >
                첨부 파일</td>
            <td style="background-color: #b8dff8;" class="auto-style3" > 
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">LinkButton</asp:LinkButton>
&nbsp;<asp:Label ID="Label5" runat="server"></asp:Label>
&nbsp;<asp:Label ID="Label6" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="background-color: #b8dff8" class="auto-style103"></td>
            <td style="background-color: #b8dff8;" class="auto-style104"><asp:ImageButton ID="ImageButton1" runat="server" 
                    ImageUrl="~/Images/btn_edit.gif" style="height: 20px" /> &nbsp;<asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/Images/btn_reply.gif" />
&nbsp;<asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/Images/btn_delete.gif" />
&nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                    ImageUrl="~/Images/btn_list.gif" PostBackUrl="~/Board/List.aspx" />
           </td>
        </tr>
        </table>
    <br />
</div>
</asp:Content>