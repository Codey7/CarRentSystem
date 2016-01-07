<%@page import="com.codey.dao.UserDao"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.codey.control.CheckCookies" %>
<%
	request.setCharacterEncoding("UTF-8");
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";


	//跳转到此页面的时候检查是否有cookies
	CheckCookies.getInstance().deleteCookie(request,response);
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>网上汽车租赁系统</title>

<!-- Bootstrap core CSS -->

<link href="css/bootstrap.min.css" rel="stylesheet">

<link href="fonts/css/font-awesome.min.css" rel="stylesheet">
<link href="css/animate.min.css" rel="stylesheet">

<!-- Custom styling plus plugins -->
<link href="css/custom.css" rel="stylesheet">
<link href="css/icheck/flat/green.css" rel="stylesheet">
<link href="css/mine.css" rel="stylesheet">

<script src="js/jquery.min.js"></script>

<!--[if lt IE 9]>
        <script src="../assets/js/ie8-responsive-file-warning.js"></script>
        <![endif]-->

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

	<script type="text/javascript">
		function checkForm(form) {
			console.log("##");
			console.log(form);
			if (form.username.value.length<5||form.username.value.length>10) {
				window.alert("用户名长度在5~10之间");
				return false;
			}
			if (form.password.value.length < 5) {
				window.alert("密码长度在5位以上！");
				return false;
			}
			}
	</script>
</head>
<body style="background:#F7F7F7;">

<%! 
	String username;
	String password;
 %>
<%
if(request.getParameter("action")!=null&&request.getParameter("action").equals("login"))
{
	 username = request.getParameter("username");
	 password = request.getParameter("password");
	if (username != null && password != null) {
		UserDao ud=new UserDao();
		if(ud.loginUser(username, password)!=null)
		{
%>
<script language="javascript">
	alert("登录成功");
	window.location = "index.jsp";
</script>
<%
	Cookie[] cookies=request.getCookies();
	if(cookies==null)
	{
		Cookie cookie=null;
		if (username.equals("admin")&&password.equals("admin"))
		{
			cookie = new Cookie("roleCookie", "2");//cookie为1说明为普通用户登录，为2为管理员登录
		}
		else
		{
			cookie = new Cookie("roleCookie", "1");
		}
		cookie.setMaxAge(24*60*60);
		response.addCookie(cookie);
	}
	else
	{
		Cookie cookie1=null;
		if (username.equals("admin")&&password.equals("admin"))
		{
			cookie1 = new Cookie("roleCookie", "2");//cookie为1说明为普通用户登录，为2 为管理员登录
		}
		else
		{
			cookie1 = new Cookie("roleCookie", "1");
		}
		cookie1.setMaxAge(24*60*60);
		response.addCookie(cookie1);
/*		 for (int i = 0; i < cookies.length; i++) {
			Cookie cookie = cookies[i];
			if (cookie.getName().equals("roleCookie")) {
				System.out.println("roleCookie" + cookie.getValue()+cookie.getPath());
			}
		}*/
	}
	} else {
%>
<script language="javascript">
	alert("用户名或密码不存在！");
	window.close();
</script>
<%
	}
	}
	}
%>


<%
if(request.getParameter("action")!=null&&request.getParameter("action").equals("signup"))
{
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	if (username != null && password != null) {
		UserDao ud=new UserDao();
		if(ud.signIn(username, password,"普通用户"))
		{
%>
<script language="javascript">
	alert("注册成功");
	window.location = "index.jsp";
</script>
<%
	} else {
%>
<script language="javascript">
	alert("用户名或密码已存在！");
</script>
<%
	}
	}
	}
%>


	<div class="">
		<a class="hiddenanchor" id="toregister"></a> <a class="hiddenanchor"
			id="tologin"></a>

		<div id="wrapper">
			<div id="login" class="animate form">
				<section class="login_content">
					<form name="login" method="post" action="login.jsp?action=login" onsubmit="return checkForm(this)">
						<h1>网上汽车租赁系统</h1>
						<div>
							<input name="username" type="text" class="form-control"
								placeholder="用户名" required="true" />
						</div>
						<div>
							<input name="password" type="password" class="form-control"
								placeholder="密码" required="true" />
						</div>
						<div>
							<button class="btn btn-default submit">登录</button> <a class="reset_pass"
								type="reset" href="#">忘记密码？</a>
						</div>
						<div class="clearfix"></div>
						<div class="separator">

							<p class="change_link">
								第一次访问？ <a href="#toregister" class="to_register"> 注册账户 </a>
							</p>
							<div class="clearfix"></div>
							<br />
							<div>
								<h1>
									<i class="fa fa-paw" style="font-size: 26px;"></i> 汽车租赁系统
								</h1>

								<p>2015 All Rights Reserved. Mr.Codey 13108407</p>
							</div>
						</div>
					</form>
					<!-- form -->
				</section>
				<!-- content -->
			</div>
			<div id="register" class="animate form">
				<section class="login_content">
					<form name="signup" method="post" action="login.jsp?action=signup" onsubmit="return checkForm(this)">
						<h1>创建账户</h1>
						<div>
							<input name="username" type="text" class="form-control" placeholder="用户名"
								required="true" />
						</div>
						<div>
							<input name="password" type="password" class="form-control"
								placeholder="密码" required="true" />
						</div>
						<div>
							<button class="btn btn-default submit">提交</button>
						</div>
						<div class="clearfix"></div>
						<div class="separator">

							<p class="change_link">
								已有账号? <a href="#tologin" class="to_register">
									登录</a>
							</p>
							<div class="clearfix"></div>
							<br />
							<div>
								<h1>
									<i class="fa fa-paw" style="font-size: 26px;"></i> 网上汽车租赁系统
								</h1>

								<p>2015 All Rights Reserved. Mr.Codey 13108407</p>
							</div>
						</div>
					</form>
					<!-- form -->
				</section>
				<!-- content -->
			</div>
		</div>
	</div>

						
</body>

</html>