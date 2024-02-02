<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="NoteList.aspx.cs" Inherits="FinalProject201931073.NoteList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div>
    <h2>자유게시판</h2>
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" 
        CellPadding="4" Width="629px" ForeColor="#333333" 
        OnDeleteCommand="DataList1_DeleteCommand" 
        OnItemDataBound="DataList1_ItemDataBound" Height="234px">
        <AlternatingItemStyle BackColor="White" />
        <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
        <FooterTemplate>
            WITH TOEIC
        </FooterTemplate>
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderTemplate>
            자유롭게 대화하세요~
        </HeaderTemplate>
        <ItemStyle BackColor="#E3EAEB" />
        <ItemTemplate>
            <asp:Label ID="Label1" runat="server" Text='<%# Eval("userID") %>'></asp:Label>
            &nbsp;<asp:Label ID="Label2" runat="server" Text='<%# GetContent(Eval("content")) %>'></asp:Label>
            &nbsp;<asp:Label ID="Label3" runat="server" Text='<%# Eval("nDate", "{0:yyyy-MM-dd HH:mm}") %>'></asp:Label>
            &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("nID") %>' CommandName="Delete">삭제</asp:LinkButton>

            <br />
            <br />
        </ItemTemplate>
        <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
    </asp:DataList>
    <hr />
            이름: <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            &nbsp;&nbsp;<asp:Label ID="Label4" runat="server"></asp:Label>
    <br />
    내용:
    <asp:TextBox ID="TextBox3" runat="server" Width="492px"></asp:TextBox>
&nbsp;<asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/arrow.gif" OnClick="ImageButton1_Click" />
&nbsp;<asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Images/save.gif" OnClick="ImageButton2_Click" />
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:master %>" SelectCommand="SELECT * FROM [oneNote] ORDER BY [nID] DESC">

    </asp:SqlDataSource>
    <br />
</div>
</asp:Content>
