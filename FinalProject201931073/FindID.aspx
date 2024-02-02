<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FindID.aspx.cs" Inherits="FinalProject201931073.FindID" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
        }
    </style>
</head>
<body>
   <form id="form1" runat="server">
        <div>
            * <span class="auto-style1"><strong>아이디 중복확인</strong></span><strong><br />
            </strong>
            <hr />
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="Button1" runat="server" Text="중복확인" OnClick="Button1_Click" />
            <br />
            <br />
            <strong>
            <asp:Label ID="Label1" runat="server"></asp:Label>
&nbsp;</strong><asp:Button ID="Button2" runat="server" Text="사 용" OnClick="Button2_Click" />
            <br />
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
	ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="* 아이디를 입력해주세요" 
	ForeColor="#FF3300"></asp:RequiredFieldValidator>&nbsp;
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
	ControlToValidate="TextBox1" ErrorMessage="* 영문, 숫자 3~10자리로 입력해주세요" 
	ForeColor="Red" ValidationExpression="[0-9a-zA-Z]{3,10}"></asp:RegularExpressionValidator>
            <br />
            <br />
        </div>
    </form>
</body>
</html>
