<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="FinalProject201931073.Question.List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style103 {
            color: #009999;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
    <h2>문제 풀이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/write.gif" PostBackUrl="~/Question/AddPhoto.aspx" />
    </h2>
    <asp:DataList ID="DataList1" runat="server" DataKeyField="imgID" 
        DataSourceID="SqlDataSource1" style="text-align: center" 
        RepeatColumns="4" RepeatDirection="Horizontal" Width="500px" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
        <FooterStyle BackColor="White" ForeColor="#333333" />
        <FooterTemplate>
            <span class="auto-style103"><em>오답노트도 중요해요! </em></span>
        </FooterTemplate>
        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
        <HeaderTemplate>
            토익 문제 풀이
        </HeaderTemplate>
        <ItemStyle BackColor="White" ForeColor="#333333" />
        <ItemTemplate>
            <a href='Show.aspx?imgID=<%# Eval("imgID") %>'>
                <asp:Image ID="Image1" runat="server" Height="150px" 
                ImageUrl='<%# "~/Photos/" +  Eval("fName") %>' 
                Width="150px" />
            </a><br />
            <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/clip.jpg" />
            <asp:Label ID="Label1" runat="server" 
                style="font-weight: 700" Text='<%# Eval("title") %>'>
            </asp:Label><br />
            <asp:Label ID="Label2" runat="server" Text='<%# Eval("userID") %>'></asp:Label><br />
            [<asp:Label ID="Label3" runat="server" 
                Text='<%# Eval("pDate", "{0:yyyy-MM-dd}" ) %>'></asp:Label>]<br />
        </ItemTemplate>

        <SelectedItemStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />

    </asp:DataList>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:master %>" 
        SelectCommand="SELECT [imgID], [userID], [name], [title], [fName], [pDate] FROM [Question] ORDER BY [imgID] DESC" >
    </asp:SqlDataSource>
    <br />
</div>
</asp:Content>
