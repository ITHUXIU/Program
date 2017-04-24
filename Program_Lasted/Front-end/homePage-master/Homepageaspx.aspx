﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Homepageaspx.aspx.cs"  Inherits="Front_end_homePage_master_Homepageaspx"  EnableEventValidation="false"  %>

<!DOCTYPE html>
<html>
<head>
	<title>虎嗅首页</title>
	<meta charset = "UTF-8"/>
	<link rel="stylesheet" type="text/css" href="./css/homepageCss.css">
	<link rel="stylesheet" type="text/css" href="css/timeLine.css">
	<link rel="stylesheet" type="text/css" href="css/sendCss.css">
	<link rel="stylesheet" type="text/css" href="css/search.css">
	<link rel="stylesheet" type="text/css" media="all" href="css/load.css">
	    <script src="js/jquery-1.8.3.min.js" type="text/javascript" charset="utf-8"></script>
	    <script src="js/homePageJs.js" type="text/javascript"></script>
	    <script src="js/jquery-1.8.3.min.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript"  src="js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" charset="utf-8" src="js/jquery.leanModal.min.js"></script>
	<script type="text/javascript" src="js/pagescroller.min.js"></script>
</head>
<body>
    <form runat="server">
<div class="content">

	<div class="header">
		<div class="centera">
			<ul class="clearfix">
				<li class="clearfixHideI"><a class="header-left-float "  href="Homepageaspx.aspx"></a></li>
				<li class="clearfixHide"><a class=" header-right-float-people flatbtn" id="modaltrigger" href="#loginmodal"></a></li>
				<li class="clearfixHide"><a class="header-right-float-search flat" id="modal" href="#searchLo"></a></li>
				<li class="clearfixHide"><a class="header-right-float header-right-float-wide" href="">会员专享<br><span class="span-width ">	会员专享</span></a></li>
				<li class="clearfixHide"><a class="header-right-float header-right-float-wide" href="">创业白板<br><span class="span-width ">创业白板</span></a></li>
				<li class="clearfixHide"><a class="header-right-float" href="" >热议<br><span  >热议</span></a>
				</li>
				
                <li class="clearfixHide"><a class="header-right-float" href="../Period-huxiu/Activity.aspx">	活动<br><span  >活动	</span></a></li>
				<li class="unfold-li"><a class="header-right-float unfold-a" href="" >资讯	<br><span  >资讯</span></a>
				<ul class=" unfold">
                    <div>
                        <asp:Repeater ID="rptClass" runat="server">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtClass" runat="server" Text='<%# Eval("news_classname") %>'  PostBackUrl='<%#"~/Front-end/Period-huxiu/News_List.aspx?news_classid="+ Eval("news_classid")%>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    
                </ul>
				</li>

			</ul>

		</div>
	</div>
	<!-- 登录 -->
		<div id="loginmodal" style="display:none;">
   
    		<div class="mainLeft">
                <img id="mainLeftI" src ="images/blackHu.png"/>
      			

       			<asp:TextBox ID="txtusername" runat="server" CssClass="txtfield" TabIndex="1" Text="邮箱/虎嗅账号" onfocus="if(this.value=='邮箱/虎嗅账号'){this.value='';}"></asp:TextBox>
                      <asp:TextBox ID="txtpassword" runat="server" TextMode="Password" CssClass="txtfield" TabIndex="2" Text="密码" onfocus="if(this.value=='密码'){this.value='';}"></asp:TextBox>
								      <div id="Lo">
								         <asp:LinkButton ID="lkbtnForget" runat="server" Text="忘记密码？" PostBackUrl="~/Backstage/Find_password.aspx"></asp:LinkButton>
								      </div>
								      <div class="center1">
								         
                                          <asp:Button ID="btnLogin" runat="server" CssClass="flatbtn-blu hidemodal" Text="Log In" TabIndex="3" OnClick="btnLogin_Click" />
      				</div>

    		
    		</div>
   		 	<div class="mainRight">
     	 		<p class="white">第三方快速登录</p>
      			<div>
        			<ul>
          				<li><img src="images/QQ2.png"></li>
          				<li><img src="images/wechart2.png"></li>
          				<li><img src="images/weibo.png"></li>
          				<li><img src="images/buy.png"></li>
        			</ul>
      			</div>
      			<p class="red">短信快捷登录</p>
      			<p class="red">扫一扫下载客户端</p>
    		</div>
  		</div>
		
		<!-- 搜索 -->
		<div id="searchLo" style="display:none;">
            <asp:TextBox ID="txtSearch" runat="server" CssClass="txt" TabIndex="1"  onfocus="if(this.value=='关键字'){this.value='';}"></asp:TextBox>
    <asp:Button ID="btnSearch" runat="server" CssClass="search-blu hide" Text="搜索" TabIndex="3" OnClick="btnSearch_Click" />
    

           

        	<div class="kayWords">
         		<ul>
           	 	<li><a href="#">数码</a></li>
            	<li><a href="#">数码</a></li>
            	<li><a href="#">数码</a></li>
            	<li><a href="#">数码</a></li>
            	<li><a href="#">数码</a></li>
            	<li><a href="#">数码</a></li>
           	 	<li><a href="#">数码</a></li>
            	<li><a href="#">数码</a></li>
            	<li><a href="#">数码</a></li>
            	<li><a href="#">数码</a></li>
            	<li><a href="#">数码</a></li>
          		</ul>
        	</div>
      		
  		</div>
  		<!-- 投稿 -->
  		<div id="sendMes" style="display:none;">
       
      		<div class="titleHu">
        		<img src="images/blackHu.png">
      		</div>
      		<div class="sendText">
       	 		<form id="sentform" name="sentform" method="post" action="index.html">
           			<input type="text" name="tit" id="tit" class="titl" tabindex="1" value="标题" onblur="disappearT()" onfocus="if(this.value=='标题'){this.value='';}">
           			<textarea name="cont" id="cont" class="contText" tabindex="2" value="内容" onblur="disappear()" onfocus="if(this.value=='内容'){this.value='';}"  rows="10" cols="30">内容</textarea>
          			<input type="text" name="contect" id="contect" class="contectL" tabindex="3" value="联系方式" onblur="disappearC()" onfocus="if(this.value=='联系方式'){this.value='';}">
           			<textarea name="sentImg" id="sentImg" 	class="	sentImgL" tabindex="3" onblur="disappearS()" onfocus="if(this.value=='上传图片'){this.value='';}"  rows="10" cols="30">上传图片</textarea>
          			<div class="sentNote">
            		<div class="hide"><span></span><p>匿名投稿</p></div>
            		<div class="addition"><span></span><p>允许虎嗅将您的原创稿件授权于虎嗅有关合作关系的第三方平台</p></div>
            
            		<p class="care">请您放心，授权会严格满足转载规范，标明您的姓名及来源等信息</p>
          			</div>
					<div class="sendBut">
          			<input type="submit" name="sentAct" id="sentAct" class="sentActicle sentmodal" value="我要投稿" tabindex="4">
          			<input type="submit" name="save" id="save" class="save-blu sentmodal" value="存草稿" tabindex="5">

        			</div>

      			</form>
    		</div>
    	</div>
    

    	<!-- 时间轴 -->
    	<div  class="zhou">
			<div class="left-div">
			<ul>
				<li><a class="left-div-first flatbtnn" id="modalt" href="#sendMes"><span></span>投稿</a></li>
				<li><a class="left-div-second" href=""><span></span>客户端</a></li>
				<li><div class="floatCtro"><a class="left-div-last" href="#1">
            	返回顶部
          		</a></div></li>
			</ul>
			</div>
		</div>

	<div class="main">
		<div class="pictureNews">
		<div class="pict" id="pict"></div>
		<div class="pictures" id="pictures">
			<ul>
                <asp:Repeater ID="rptTop" runat="server">
                    <ItemTemplate>
                       <li>
                            <asp:Image ImageUrl='<%#"../../Backstage/" + Eval("top_cover") %>' runat="server" />
                            <a href="<%#"~/Front-end/zixunCont-master/News_Content.aspx?news_id="+ Eval("top_news")%>"><asp:Image class="headBacImg" ImageUrl='<%#"../../Backstage/"+ Eval("top_path") %>' runat="server" />
                            </a>
                                 </li>
                    </ItemTemplate>
                </asp:Repeater>

            </ul>

        </div>



       <script type="text/javascript">
           var simg = $(".pictures ul li").find(".headBacImg").attr("src");
		    var bimg=simg.replace(/-\d*/,'');
            $(".pict").css("background","url("+bimg+")");//url("+bimg+"),添加 变量的方法
            $(".pict").css("background-size","100% 475px");
        </script>

        </div>

        <div class="messageCont">
		<div class="message">
            <div class="messageLeft">

                <asp:Repeater ID="rptNewstop" runat="server" OnItemDataBound="rptNewstop_ItemDataBound">
                    <ItemTemplate>
                        <div class="messageLife">

                            <div class="messageLifeImg" id="showing">
                                <a href='<%#"../zixunCont-master/News_Content.aspx?news_id="+ Eval("news_id")%>'><img id="imgg" src="<%#"../../Backstage/" + Eval("news_cover") %>">
                                </a>
                            </div>
                            <div class="messageLiftText">
                                <div class="messH">
                                <h2><asp:LinkButton runat="server" Text=<%# Eval("news_title") %> PostBackUrl='<%#"~/Front-end/zixunCont-master/News_Content.aspx?news_id="+ Eval("news_id")%>'></asp:LinkButton></h2>
                                </div>
                                <div class="messageNote1">
                                    <img src="images/tou.png">
                                    <p><%# Eval("new_author") %></p>
                                    <p><%# Eval("news_time") %></p>
                                    <div class="messagespan">
                                    <span id="email"></span>
                                    <span id="star"></span>
                                    </div>

                                </div>
                                <p><asp:Label ID="lbTopNews" Text=<%# Eval("news_content") %> runat="server"></asp:Label></p>
                            </div>
                        </div>
                </ItemTemplate>
            </asp:Repeater>
		
			</div>
			<div class="messageRight">
				<ul>
                    <asp:Repeater ID="rptNews" runat="server" OnItemDataBound="rptNews_ItemDataBound">
                        <ItemTemplate>
                            <li>
                                <div class="messageRightText">
                                    <div class="label">
                                        <img src="images/lab.png">
                                        <p><asp:Label ID="lbNewsclass" Text=<%# Eval("news_class") %> runat="server"></asp:Label></p>
                                    </div>
                                    <div class ="messH">
                                <h2><asp:LinkButton runat="server" Text=<%# Eval("news_title") %> PostBackUrl='<%#"~/Front-end/zixunCont-master/News_Content.aspx?news_id="+ Eval("news_id")%>'></asp:LinkButton></h2>
                                    </div>
                                        <div class="messageRightNote">
                                        <img src="images/tou.png">
                                        <p><%# Eval("new_author") %></p>
                                        <p><%# Eval("news_time") %></p>
                                        <span id="email"></span>
                                        <span id="star"></span>

                                    </div>
                                    <p><asp:Label ID="lbNews" runat="server" Text=<%# Eval("news_content") %>></asp:Label></p>
                                </div>
                                <div class="messageRightImg">
                                     <a href='<%#"../zixunCont-master/News_Content.aspx?news_id="+ Eval("news_id")%>'><asp:Image ImageUrl=<%#"../../Backstage/" + Eval("news_cover") %> runat="server" />
                                    </a>
                                </div>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
				</ul>
			</div>
		</div>
		<div class="change">
            <asp:Label ID="lbNow" runat="server" Text="1" Visible="false"></asp:Label>
            <asp:Label ID="lbTotal" runat="server" Text="1" Visible="false"></asp:Label>
			<asp:LinkButton  ID="lbtChange" runat="server" OnClick="lbtChange_Click" Text="换一换"></asp:LinkButton>

		</div>
		</div>

		<div class="shortNews">
			<div class="newTitle">
				<img src="images/sanJiao.png">
				<h1 class="main-passage-headline clearfix section">短趣</h1>
				<a href="#bookmark">全部内容</a>
			</div>
			<div id="story">
 				    <div class="storyLeft">
                         <%--异步刷新出现问题。。。。--%>
                          <asp:ScriptManager ID="ScriptManager1" runat="server" ></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
            <ContentTemplate>   
              	<h1><asp:Label ID="lbInterestTitle" runat="server" ></asp:Label></h1>
						<div class="storyNo"><%--<p id="time">--%><asp:Label ID="lbTime" runat="server" ></asp:Label><%--</p>--%><p id="detail"><asp:LinkButton ID="lkInterest" runat="server" Text="详情>>" OnClick="lkInterest_Click"></asp:LinkButton></p></div>
						<div>
							<p>
								<asp:Label ID="lbInterestContent" runat="server" ></asp:Label>
							</p>
						</div>
            </ContentTemplate>
        </asp:UpdatePanel>
						<%--<h1><asp:Label ID="lbInterestTitle" runat="server" ></asp:Label></h1>
						<div class="storyNo"><p id="time"><asp:Label ID="lbTime" runat="server" ></asp:Label></p><p id="detail">详情>></p></div>
						<div>
							<p>
								<asp:Label ID="lbInterestContent" runat="server" ></asp:Label>
							</p>
						</div>--%>
					</div>  
                    
                                                                                                                                                                                              
			<div class="storyRight">	
			<ul>
                <asp:Repeater ID="rptInterestTitle" runat="server" OnItemCommand="rptInterestTitle_ItemCommand" >
                    <ItemTemplate>
                        <li>
                        <h1><asp:LinkButton ID="lkbtnInterestTitle" runat="server" Text='<%#Eval("interest_title")%>' CommandArgument='<%#Eval("interest_id") %>' CommandName="InterestContent"></asp:LinkButton></h1>
                       <p id="time"><%#Eval("interest_time") %></p><p id="detail">详情>></p>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
	
				<%--<li>
				    <h1>戴上眼镜</h1>
				    <p id="time">3小时</p><p id="detail">详情>></p>
			
	            </li>
	            <li>
				    <h1>戴上眼镜</h1>
				    <p id="time">3小时</p><p id="detail">详情>></p>
			
	            </li>
            </ul>
            <ul>
	            <li>
			    	<h1>戴上眼镜</h1>
				    <p id="time">3小时</p><p id="detail">详情>></p>
			
	            </li>
	            <li>
				    <h1>戴上眼镜</h1>
				    <p id="time">3小时</p><p id="detail">详情>></p>
			
	            </li>
	            <li>
				    <h1>戴上眼镜</h1>
				    <p id="time">3小时</p><p id="detail">详情>></p>
			
	            </li>--%>
               </ul>
            </div>
        </div>
    
   </div>









 


		<div class="glossip">
			<div class="gloLeft">
				<div class="hotNewsTitle">
					<img src="images/sanJiao.png">
					<h1 class="main-passage-headline clearfix section">传言</h1>
					<a href="#">全部内容</a>
				</div>
				<div class="gloLeftCont">
					<div class="gloLeftContImg">
						<img src="images/phone.png">
					</div>
					<div class="gloLeftContMes">
						<ul>
                            <asp:Repeater ID="rptRumor" runat="server" OnItemCommand="rptRumor_ItemCommand">
                                <ItemTemplate>
                                    	<li><a href="#bookmark">
								<p><%#Eval("rumor_title") %></p>
                                            
								<span id="alread"><%# Convert.ToInt32(Eval("rumor_state"))==1?"传言中":"已辟谣" %></span>
                                    <script type="text/javascript">
                                        if(<%#Convert.ToInt32( Eval("rumor_state"))%> == 0 ){
                                            document.getElementById("alread").style.borderColor = "green";
                                        }else{
                                            document.getElementById("alread").style.borderColor = "red";
                                        }
                                        
                                    </script>
							</a></li>
                                </ItemTemplate>
                            </asp:Repeater>
					        
						</ul>
						<a id="pi" href="#bookmark">我要爆料/我要辟谣</a>
					</div>
				</div>

			</div>
			<div class="gloRight">
				<div class="hotNewsTitle">
					<img src="images/sanJiao.png">
					<h1 class="main-passage-headline clearfix section">创业白板</h1>
					<a href="#">全部内容</a>
				</div>
				<div class="gloRightName">
					<ul>
						<li><a href="#bookmark">
							<img src="images/new.png">
							<p>犀牛电竞</p>
						</a></li>
						<li><a href="#bookmark">
							<img src="images/new.png">
							<p>犀牛电竞</p>
						</a></li>
						<li><a href="#bookmark">
							<img src="images/new.png">
							<p>犀牛电竞</p>
						</a></li>
						<li><a href="#bookmark">
							<img src="images/new.png">
							<p>犀牛电竞</p>
						</a></li>
					</ul>
					<a id="join" href="#bookmark">我要报名</a>
                    <div class="glospan">
					<p>创业公司立即报名提交信息的好处</p>
					<p>1.优质的展示和访谈机会</p>
					<p>2.获得投资人的关注</p>
					<P>3.虎嗅提供的创业支持服务</P>
                    </div>
				</div>
			</div>
			
		</div>


        <div class="hotNews">
            <div class="hotNewsTitle">
                <img src="images/sanJiao.png">
                <h1 class="main-passage-headline clearfix section">热文</h1>
            </div>
            <asp:Repeater ID="rptHotNews" runat="server" OnItemDataBound="rptHotNews_ItemDataBound">
                <ItemTemplate>
                    <div id="article">
                       <div id="articleImg3">
                              <a href='<%#"../zixunCont-master/News_Content.aspx?news_id="+ Eval("news_id")%>'><asp:Image ImageUrl=<%#"../../Backstage/" + Eval("news_cover") %> runat="server" ID="imgUp" /></a>
                        </div>
                        <div id="articleCont">
                            <div class="contTitle">
                                  <asp:LinkButton Text='<%# Eval("news_title")%>' runat="server" PostBackUrl='<%#"~/Front-end/zixunCont-master/News_Content.aspx?news_id="+ Eval("news_id")%>'></asp:LinkButton>
                            </div>
                            <div class="articleNotes">
                                    <span><%# Eval("new_author") %></span>&nbsp;
                                    <span><%# Eval("news_time") %></span>&nbsp;
                                    <span>收藏12 评论7</span>
                            </div>
                            <div class="contDetail">
                                    <asp:Label ID="lbHotNews" runat="server" Text='<%# Eval("news_content") %>'></asp:Label>
                            </div>
                            <div id="articleImg2">
                                <asp:Image ImageUrl='<%#"../../Backstage/" + Eval("news_cover") %>' runat="server" ID="imgDown" />
                            </div>
                        </div>
                    </div>
                    <asp:Label ID="lbItem" runat="server" Text="1" Visible="false"></asp:Label>
                </ItemTemplate>
            </asp:Repeater>
        </div>



        <div class="help">
			<div class="helpTitle">
				<img src="images/sanJiao.png">
				<h1 class="main-passage-headline clearfix section">赞助内容</h1>
			</div>
				<div class="helpContent">
					<ul>
						<li><a href="#bookmark">
							<img src="images/his.png">
							<div><h2>科技原创力</h2><p>落后美国93%：</p></div>
						</a></li>
						<li><a href="#bookmark">
							<img src="images/his.png">
							<div><h2>科技原创力</h2><p>落后美国93%：</p></div>
						</a></li>
						<li><a href="#bookmark">
							<img src="images/his.png">
							<div><h2>科技原创力</h2><p>落后美国93%：</p></div>
						</a></li>
						<li><a href="#bookmark">
							<img src="images/his.png">
							<div><h2>科技原创力</h2><p>落后美国93%：</p></div>
						</a></li>
						<li><a href="#bookmark">
							<img src="images/his.png">
							<div><h2>科技原创力</h2><p>落后美国93%：</p></div>
						</a></li>
						<li><a href="#bookmark">
							<img src="images/his.png">
							<div><h2>科技原创力</h2><p>落后美国93%：</p></div>
						</a></li>
					</ul>
				</div>
			</div>



		<div class="example">
				<div class="exampleTitle">
					<img src="images/sanJiao.png">
					<h1 class="main-passage-headline clearfix section">创新案例</h1>
					<span>会员专享</span>
				</div>
				
				<div class="exampleImg">
					<img src="images/people.png">
				</div>
				<div class="exampleCont">
					<h2><a href="#">【创新案例008】企鹅团：红酒按月订购2500万的流水怎么做出来的？</a></h2>
					<img src="images/tou.png"><p class="sec">虎嗅会员小秘书</p><p>微信号：huxiu</p>
				</div>
				<div class="exampleAdd">
                    <div>
					<img src="images/vip.png">
					<p>早知道一点，多知道一点</p>
                    </div>
					<a href="#bookmark">加入虎嗅会员</a>
					<span>全年300+篇案例分析，盘点有代表性的创新公司，还有商业成功背后的魔鬼细节</span>
				</div>
		</div>
	</div>








	<div class="foot">
			<div class="others">
				<ul>
					<li><a href="#bookmark ">关于我们</a></li>
					<li><a href="#bookmark">合作伙伴</a></li>
					<li><a href="#bookmark">常见问题解答</a></li>
					<li><a href="#bookmark">联系我们</a></li>
					<li><a href="#bookmark">加入我们</a></li>
					<li><a href="#bookmark">广告及服务</a></li>
					<li><a href="#bookmark">防网络诈骗问题</a></li>
					<li class="Link">	
						<a href="#bookmark"><img src="images/wechart.png"></a>
						<a href="#bookmark"><img src="images/qq.png"></a>
						<a  id = "emailA" href="#"><img src="images/email.png"></a>
					</li>
				</ul>
			</div>
			<div class="note">
				<p>Copyright © 虎嗅网 京IPC备12013432号-1<img src="images/police.png">京公网安备11010102001402 本站由<a href="#bookmark"><img src="images/ali.png"></a>提供计算与安全服务</p>
			</div>
	</div>	
</div>
<script type="text/javascript">
	 $(".pictures ul li").click(function(){
	     //var simg=$(this).find("img").attr("src");
	     var simg = $(this).find(".headBacImg").attr("src");
            var bimg=simg.replace(/-\d*/,'');  //根据小图找到大图的名称

            $(".pict").css("background","url("+bimg+")");//url("+bimg+"),添加 变量的方法
            $(".pict").css("background-size","100% 630px");

    
        });



 var lis = document.getElementById("story").querySelectorAll("li");
 var imgs = document.getElementById("story").querySelectorAll("div");
 for(var i = 0; i < lis.length; i++) {
  //给所有的li标签添加点击事件
  lis[i].onclick = function () {
   //将所有的图片宽度设置为0
   if(this.querySelector("div").style.display == "block"){
   		this.querySelector("div").style.display = "none";
   		this.style.height = "115px";
   }else{
   for(var i = 0; i < lis.length; i++) {
    	imgs[i].style.display = "none";
    	lis[i].style.height = "115px";
   }
   
   //将当前点击li标签中的img标签设置宽度为220px
   this.querySelector("div").style.display = "block";
   this.style.height = "377px";
  }}
 }

</script>
<!-- 导航栏 -->
	<script>
		$(function(){
			$('.header-right-float').hover(function(){
				$(this).css({'top':0+'px'}).animate({'top':-50},400);
				
			},function(){
				$(this).stop(true).animate({'top': 0}, 400); 
			})
			$('.unfold-li').hover(function(){
				$('.unfold').css({'display':'block','top':50}).animate({'top':-50,'left':0,'opacity':1}, 400);
			50},function(){
				$('.unfold').css({'display':'none'}).animate({'top':50,'opacity':0.3}, 400);
			})

		})
	</script>
	<!-- 搜索和登录 -->
	<script type="text/javascript">

		$(function(){

  			$('#loginform').submit(function(e){

    		return false;

  		});
  
  		$('#modaltrigger').leanModal({ top: 110, overlay: 0.45, closeButton: ".hidemodal" });

			});

			/*搜索*/
		$(function(){
  			$('#searchform').submit(function(e){
    		return false;
  		});
  		$('#modal').leanModal({ top: 110, overlay: 0.45, closeButton: ".hide" });
		});

	</script>
	<!-- 投稿 -->
	<script type="text/javascript">
		$(function(){

  			$('#sentform').submit(function(e){

    		return false;

  		});
  
  		$('#modalt').leanModal({ top: 110, overlay: 0.45, closeButton: ".sentmodal" });

	});
	</script>
	<script type="text/javascript">
		$(document).ready(function(){
			var navLabel = new Array('短趣','传言','创业白板','热文','赞助内容','创新案例');
			$('.content').pageScroller({ navigation: navLabel });
		});	

	</script>
	<script type="text/javascript">
		$('div.floatCtro a').click(function(){
			$('body,html').animate({scrollTop:0},1000);
			$('li.scrollNav.active').removeClass('active');
			});	

	</script>
	 <script type="text/javascript">
	 	  function disappear(){
    var a =document.getElementById("cont");
    if(a.value == ""){
      a.value ="内容";
    }
  }
   function disappearT(){
    var a =document.getElementById("tit");
    if(a.value == ""){
      a.value ="标题";
    }
  }
   function disappearC(){
    var a =document.getElementById("contect");
    if(a.value == ""){
      a.value ="联系方式";
    }
  }
   function disappearS(){
    var a =document.getElementById("sentImg");
    if(a.value == ""){
      a.value ="上传图片";
    }
  }
	 </script>
        </form>
</body>
</html>