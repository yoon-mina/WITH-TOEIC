<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Show.aspx.cs" Inherits="FinalProject201931073.Question.Show" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 100%;
        }
        .auto-style4 {
            width: 84px;
            text-align: center;
        }
        .auto-style5 {
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div>
    <h2>문제 풀이 보기</h2>
        <div class="auto-style5">
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/modify.gif" OnClick="ImageButton1_Click" />
&nbsp;<asp:ImageButton ID="ImageButton2" runat="server" 
    ImageUrl="~/Images/delete.gif" OnClick="ImageButton2_Click"  
    OnClientClick="return confirm('정말로 삭제하십니까?');" />
&nbsp;<asp:ImageButton ID="ImageButton3" runat="server" 
    ImageUrl="~/Images/write.gif" PostBackUrl="~/Question/AddPhoto.aspx" />
&nbsp;<asp:ImageButton ID="ImageButton4" runat="server" 
    ImageUrl="~/Images/list.gif" PostBackUrl="~/Question/List.aspx" />
            <br />
        </div>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="imgID" DataSourceID="SqlDataSource1" Width="603px">
            <EditItemTemplate>
                imgID:
                <asp:Label ID="imgIDLabel1" runat="server" Text='<%# Eval("imgID") %>' />
                <br />
                userID:
                <asp:TextBox ID="userIDTextBox" runat="server" Text='<%# Bind("userID") %>' />
                <br />
                name:
                <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
                <br />
                pwd:
                <asp:TextBox ID="pwdTextBox" runat="server" Text='<%# Bind("pwd") %>' />
                <br />
                title:
                <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                <br />
                body:
                <asp:TextBox ID="bodyTextBox" runat="server" Text='<%# Bind("body") %>' />
                <br />
                fName:
                <asp:TextBox ID="fNameTextBox" runat="server" Text='<%# Bind("fName") %>' />
                <br />
                hit:
                <asp:TextBox ID="hitTextBox" runat="server" Text='<%# Bind("hit") %>' />
                <br />
                pDate:
                <asp:TextBox ID="pDateTextBox" runat="server" Text='<%# Bind("pDate") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="업데이트" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="취소" />
            </EditItemTemplate>
            <InsertItemTemplate>
                userID:
                <asp:TextBox ID="userIDTextBox" runat="server" Text='<%# Bind("userID") %>' />
                <br />
                name:
                <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
                <br />
                pwd:
                <asp:TextBox ID="pwdTextBox" runat="server" Text='<%# Bind("pwd") %>' />
                <br />
                title:
                <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                <br />
                body:
                <asp:TextBox ID="bodyTextBox" runat="server" Text='<%# Bind("body") %>' />
                <br />
                fName:
                <asp:TextBox ID="fNameTextBox" runat="server" Text='<%# Bind("fName") %>' />
                <br />
                hit:
                <asp:TextBox ID="hitTextBox" runat="server" Text='<%# Bind("hit") %>' />
                <br />
                pDate:
                <asp:TextBox ID="pDateTextBox" runat="server" Text='<%# Bind("pDate") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="삽입" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="취소" />
            </InsertItemTemplate>
            <ItemTemplate>
                <table class="auto-style2" style="border-collapse: collapse">
                    <tr>
                        <td class="auto-style4" style="border: 1px solid #C0C0C0;">번호</td>
                        <td style="border: 1px solid #C0C0C0;">
                            <asp:Label ID="imgIDLabel" runat="server" Text='<%# Eval("imgID") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4" style="border: 1px solid #C0C0C0;">아이디</td>
                        <td style="border: 1px solid #C0C0C0;">
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("userID") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4" style="border: 1px solid #C0C0C0;">문제 제목</td>
                        <td style="border: 1px solid #C0C0C0;">
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("title") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4" style="border: 1px solid #C0C0C0;">문제 풀이</td>
                        <td style="border: 1px solid #C0C0C0;">
                            <asp:TextBox ID="TextBox1" runat="server" Rows="3" Text='<%# Bind("body") %>' TextMode="MultiLine" Width="95%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4" style="border: 1px solid #C0C0C0;">조회수</td>
                        <td style="border: 1px solid #C0C0C0;">
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("hit") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4" style="border: 1px solid #C0C0C0;">올린 날짜</td>
                        <td style="border: 1px solid #C0C0C0;">
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("pDate") %>'></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/Photos/" +  Eval("fName") %>' Width="100%" />
                <br />
                <br />
                <br />
                <br />

            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:master %>" SelectCommand="SELECT * FROM [Question] WHERE ([imgID] = @imgID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="imgID" QueryStringField="imgID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
</div>
</asp:Content>
