<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="FinalProject201931073.Board.List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div>
        <h3>파일 공유 (자료실)</h3>
    </div>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None"
            BorderWidth="1px" CellPadding="3" DataKeyNames="seq" 
            DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="seq" HeaderText="번호" InsertVisible="False" ReadOnly="True" SortExpression="seq" >
                <HeaderStyle Width="60px" />
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="제목" SortExpression="title">
                    <ItemTemplate>
                        <%# ShowDepth((int)Eval("depth")) %>
                        <%# ShowReplyIcon((int)Eval("inner_id")) %>
                        <%# ShowTitle( Eval("seq").ToString( ), 
                                        Eval("title").ToString( ), 
                                        Eval("deleted").ToString( )) %>
                    </ItemTemplate>
                    <HeaderStyle Width="330px" />
                </asp:TemplateField>
                <asp:BoundField DataField="name" HeaderText="이름" SortExpression="name" >
                <HeaderStyle Width="70px" />
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="wDate" HeaderText="날짜" SortExpression="wDate" DataFormatString="{0:yyyy-MM-dd}" >
                <HeaderStyle Width="90px" />
                </asp:BoundField>
                <asp:BoundField DataField="hit" HeaderText="조회" SortExpression="hit" >
                <HeaderStyle Width="40px" />
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:master %>" SelectCommand="SELECT [seq], [userID], [title], [name], [wDate], [hit], [ref_id], [inner_id], [depth], [deleted] FROM [shareBoard] ORDER BY [ref_id] DESC, [inner_id]"></asp:SqlDataSource>
    </p>
    <p>
        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/btn_write.gif" PostBackUrl="~/Board/Write.aspx" />
        <br />
    </p>
</asp:Content>
