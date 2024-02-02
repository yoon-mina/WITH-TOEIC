<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Information.aspx.cs" Inherits="FinalProject201931073.Information" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style103 {
            width: 102%;
            height: 207px;
            border: 1px solid #ADD8E6;
        }
        .auto-style105 {
            text-align: center;
        }
        .auto-style106 {
            height: 20px;
            text-align: center;
        }
        .auto-style107 {
            font-size: medium;
        }
        .auto-style108 {
            text-align: center;
            width: 49px;
        }
        .auto-style109 {
            height: 20px;
            text-align: center;
            width: 49px;
        }
        .auto-style110 {
            width: 102%;
            border: 1px solid #ADD8E6;
        height: 129px;
    }
        .auto-style111 {
            text-decoration: none;
            color: #0099CC;
        }
        .auto-style113 {
            width: 108px;
        }
        .auto-style114 {
            width: 108px;
            height: 20px;
        }
        .auto-style115 {
            height: 20px;
            width: 479px;
        }
        .auto-style116 {
            width: 479px;
        }
    .auto-style117 {
        font-size: small;
    }
        .auto-style903 {
            width: 108px;
            height: 38px;
        }
        .auto-style904 {
            width: 479px;
            height: 38px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>토익 정보</h2>
    <p class="auto-style107"><strong>* 시험 구성 </strong></p>
    <table class="auto-style103">
        <tr>
            <td class="auto-style105">구성</td>
            <td class="auto-style105">파트</td>
            <td class="auto-style105" colspan="3">파트별 문항 수 </td>
            <td class="auto-style105">시간</td>
            <td class="auto-style108">배점</td>
        </tr>
        <tr>
            <td class="auto-style105" rowspan="4">LC</td>
            <td class="auto-style105">1</td>
            <td class="auto-style105">사진묘사</td>
            <td class="auto-style105">6</td>
            <td class="auto-style105" rowspan="4">100</td>
            <td class="auto-style105" rowspan="4">45분</td>
            <td class="auto-style108" rowspan="4">495점</td>
        </tr>
        <tr>
            <td class="auto-style105">2</td>
            <td class="auto-style105">질의응답</td>
            <td class="auto-style105">25</td>
        </tr>
        <tr>
            <td class="auto-style105">3</td>
            <td class="auto-style105">짧은대화</td>
            <td class="auto-style105">39</td>
        </tr>
        <tr>
            <td class="auto-style105">4</td>
            <td class="auto-style105">설명문</td>
            <td class="auto-style105">30</td>
        </tr>
        <tr>
            <td class="auto-style105" rowspan="4">RC</td>
            <td class="auto-style106">5</td>
            <td class="auto-style106">단문공란 메우기 (문법/어휘)</td>
            <td class="auto-style106">30</td>
            <td class="auto-style105" rowspan="4">100</td>
            <td class="auto-style105" rowspan="4">75분</td>
            <td class="auto-style108" rowspan="4">495점</td>
        </tr>
        <tr>
            <td class="auto-style105">6</td>
            <td class="auto-style105">장문 공란 메우기</td>
            <td class="auto-style105">16</td>
        </tr>
        <tr>
            <td class="auto-style105" rowspan="2">7</td>
            <td class="auto-style105">독해 (단일)</td>
            <td class="auto-style105">29</td>
        </tr>
        <tr>
            <td class="auto-style105">독해 (복수)</td>
            <td class="auto-style105">25</td>
        </tr>
        <tr>
            <td class="auto-style106">total</td>
            <td class="auto-style106" colspan="2">7 Parts</td>
            <td class="auto-style106" colspan="2">200문항</td>
            <td class="auto-style106">120분</td>
            <td class="auto-style109">990점</td>
        </tr>
    </table>
    <strong>
    <br class="auto-style107" />
    <span class="auto-style107">* 수험자 가이드
    <br />
    <br />
    </span>
    <table class="auto-style110">
        <tr>
            <td class="auto-style113" rowspan="2">
                <asp:LinkButton ID="LinkButton1" runat="server"  CssClass="auto-style111">입실 시간</asp:LinkButton>
            </td>
    </strong>
            <td class="auto-style116">
                <asp:Label ID="Label2" runat="server" CssClass="auto-style117">오전 : AM 9:20 까지 입실(AM 9:50 이후 절대 입실 불가)</asp:Label>
            </td>
        </tr>
    <strong>
        <tr>
            <td class="auto-style116">
                <asp:Label ID="Label3" runat="server" CssClass="auto-style117">오후 : PM 2:20 까지 입실(PM 2:50 이후 절대 입실 불가)</asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style114">
                <strong>
                <asp:LinkButton ID="LinkButton3" runat="server" CssClass="auto-style111">준비물</asp:LinkButton>
                </strong>
            </td>
            <td class="auto-style115">
                <asp:Label ID="Label5" runat="server" CssClass="auto-style117">규정신분증, 연필 (볼펜 및 사인펜은 사용 불가), 지우개, 아날로그 손목시계</asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style113">
                <strong>
                <asp:LinkButton ID="LinkButton4" runat="server" CssClass="auto-style111">성적확인</asp:LinkButton>
                </strong>
            </td>
            <td class="auto-style116">
                <asp:Label ID="Label6" runat="server" CssClass="auto-style117">성적 확인은 TOEIC 홈페이지에 안내된 성적발표일에 인터넷 홈페이지, 어플리케이션을 통해 확인 가능합니다.</asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style903">
                <strong>
                <asp:LinkButton ID="LinkButton5" runat="server" CssClass="auto-style111">성적표 재발급</asp:LinkButton>
                </strong>
            </td>
            <td class="auto-style904">
                <asp:Label ID="Label7" runat="server" Text="성적표 재발급은 성적 유효기간(시험 시행일로부터 2년 뒤 해당 시험일자까지) 내에만 가능하며, 재발급 신청은 신용카드, 휴대폰 결제를 이용할 수 있습니다." CssClass="auto-style117"></asp:Label>
            </td>
        </tr>
    </table>
    </strong>&nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:master %>" SelectCommand="SELECT * FROM [Imformation]"></asp:SqlDataSource>

</asp:Content>
