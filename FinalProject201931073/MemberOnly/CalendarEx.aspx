<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="CalendarEx.aspx.cs" Inherits="FinalProject201931073.MemberOnly.CalendarEx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 803px;
        }
        .auto-style3 {
            width: 356px;
        }
        .auto-style4 {
            font-weight: normal;
        }
        .auto-style5 {
            width: 100%;
        }
        .auto-style7 {
            width: 57px;
        }
        .auto-style8 {
            color: #FF0066;
        }
        .auto-style103 {
            color: #330099;
            background-color: #FFFFCC;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
    <h2>일정관리&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
        <asp:Label ID="Label2" runat="server" CssClass="auto-style4"></asp:Label>
        </h2>
        <table class="auto-style2">
            <tr>
                <td class="auto-style3" style="vertical-align: top">
                    <asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="337px" ShowGridLines="True" Width="349px" OnDayRender="Calendar1_DayRender" OnSelectionChanged="Calendar1_SelectionChanged" OnVisibleMonthChanged="Calendar1_VisibleMonthChanged">
                        <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                        <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                        <OtherMonthDayStyle ForeColor="#CC9966" />
                        <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                        <SelectorStyle BackColor="#FFCC66" />
                        <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                        <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                    </asp:Calendar>
                </td>
                <td style="vertical-align: top">
                    <asp:DataList ID="DataList1" runat="server" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" GridLines="Both" Width="423px" OnDeleteCommand="DataList1_DeleteCommand" OnItemCommand="DataList1_ItemCommand">
                        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                        <FooterTemplate>
                            오늘도 화이팅합시다 !!!
                        </FooterTemplate>
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                        <HeaderTemplate>
                            오늘의 일정
                        </HeaderTemplate>
                        <ItemStyle BackColor="White" ForeColor="#330099" />
                        <ItemTemplate>
                            <table class="auto-style5">
                                <tr>
                                    <td class="auto-style7">
                                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/done.gif" Width="20px" CommandArgument='<%# Eval("seq") %>' CommandName="Done" />
                                        &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Images/deleteX.gif" Width="20px" CommandArgument='<%# Eval("seq") %>' CommandName="Delete" />
                                    </td>
                                    <td>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("sTime" ) %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style7">&nbsp;</td>
                                    <td>
                                        <asp:Label ID="Label4" runat="server" Text='<%# DoneCheck( Eval("ToDO" ), Eval( "hasDone" ) ) %>'></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                    </asp:DataList>
                    <br />
                    새 할일 : <asp:TextBox ID="TextBox1" runat="server" Width="336px"></asp:TextBox>
                    <br />
                    시작시간: <asp:DropDownList ID="DropDownList1" runat="server">
                    </asp:DropDownList>
&nbsp;<asp:DropDownList ID="DropDownList2" runat="server">
                    </asp:DropDownList>
&nbsp;<asp:Button ID="Button5" runat="server" Text="등록" OnClick="Button5_Click" />
                    <br />
                    <br />
                    <br />
                    <strong>
                    <asp:Label ID="Label5" runat="server" CssClass="auto-style8"></asp:Label>
                    </strong>
                </td>
            </tr>
        </table>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
</div>
</asp:Content>
