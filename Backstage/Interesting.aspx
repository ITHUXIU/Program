﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Interesting.aspx.cs" Inherits="Backstage_Interesting" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <script type="text/javascript" src="../common/js/tablecloth.js"></script>
    <link href="../common/css/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
    <style>

body{
	margin:0;
	padding:0;
	background:#f1f1f1;
	font:70% Arial, Helvetica, sans-serif; 
	color:#555;
	line-height:150%;
	text-align:left;
}
a{
	text-decoration:none;
	color:#057fac;
}
a:hover{
	text-decoration:none;
	color:#999;
}
h1{
	font-size:140%;
	margin:0 20px;
	line-height:80px;	
}
h2{
	font-size:120%;
}
#container{
	margin:0 auto;
	width:680px;
	background:#fff;
	padding-bottom:20px;
}
#content{margin:0 20px;}
p.sig{	
	margin:0 auto;
	width:680px;
	padding:1em 0;
}
form{
	margin:1em 0;
	padding:.2em 20px;
	background:#eee;
}
    .auto-style1 {
        height: 27px;
    }
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    	<table>
			<tr>
				<th>短趣标题</th>
				<th>短趣时间</th>
				<th>短趣点赞数</th>
                <th>短趣URL</th>
				<th>修改短趣</th>
				<th>删除短趣</th>
			</tr>
    <asp:Repeater ID="rptInterest" runat="server" OnItemCommand="rptInteresting_ItemCommand" >
        <ItemTemplate>
           <tr> 
               <td><asp:LinkButton ID="lbactivity_name" runat="server" Text='<%#Eval("interest_title") %>' PostBackUrl='<%#"Modify_interest.aspx?id="+Eval("interest_id") %>'></asp:LinkButton> </td>

            <td><%#Eval("interest_time") %></td>
                          <td><%#Eval("interest_like") %></td> 
               <td><asp:LinkButton ID="lbtnInterest" runat="server" Text='<%#Eval("interest_url") %>' CommandName="URL" CommandArgument='<%#Eval("interest_url") %>'></asp:LinkButton></td>                            
               <td><asp:LinkButton ID="lbmodify_activity" runat="server" Text="修改" PostBackUrl='<%#"Modify_interest.aspx?id="+Eval("interest_id") %>'></asp:LinkButton></td>
            <td><asp:LinkButton ID="lbdelete_activity" runat="server" Text="删除" CommandName="Delete" CommandArgument='<%#Eval("interest_id") %>'></asp:LinkButton></td>
               </tr>
           
        </ItemTemplate>
    </asp:Repeater>
            </table>
        <asp:Button ID="btnUp" runat="server" Text="上一页" OnClick="btnUp_Click" />
        <asp:Button ID="btnDown" runat="server" Text="下一页"  OnClick="btnDown_Click"/>
        <asp:Button ID="btnFirst" runat="server" Text="首页" OnClick="btnFirst_Click" />
        <asp:Button ID="btnLast" runat="server" Text="尾页"  OnClick="btnLast_Click"/>
        页次：<asp:Label ID="lbNow" runat="server" Text="1"></asp:Label>
        /<asp:Label ID="lbTotal" runat="server" Text="1"></asp:Label>
        转<asp:TextBox ID="txtJump" Text="1" runat="server" Width="16px" onkeyup="this.value=this.value.replace(/\D/g,'')"></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat ="server" ControlToValidate ="txtJump" ></asp:RequiredFieldValidator> 
        <asp:Button ID="btnJump" runat="server" Text="Go"  OnClick="btnJump_Click"/>
  
    </div>
    </form>
</body>
</html>
