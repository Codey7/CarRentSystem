<%--
  Created by IntelliJ IDEA.
  User: Mr.Codey
  Date: 2016/1/5
  Time: 11:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  response.setCharacterEncoding("UTF-8");
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://"
          + request.getServerName() + ":" + request.getServerPort()
          + path + "/";
	/* Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) {
			Cookie cookie = cookies[i];
			if (cookie.getName().equals("roleCookie")) {
				System.out.println("roleCookie" + cookie.getValue()+cookie.getPath());
			}
		}
	}
	else
	{
	System.out.println("roleCookieweikong");
	} */
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
  <link href="css/mine.css">


  <script src="js/jquery.min.js"></script>
</head>
<body>
<jsp:include page="common.jsp"/>
<div class="right_col main_container" role="main">
  <div class="">
    <div class="page-title">
      <div class="title_left">
        <h3>
          个人信息
        </h3>
      </div>
    </div>
      <div class="contain" style="margin-left: 2em">
          <div class="row">
              <div class="col-sm-4">
                  <img src="images/picture.jpg" alt="花灯之乡" class="img-responsive" id="head_img">
                  <div class="form-group">
                      <label for="InputFile">上传头像</label>
                      <input type="file" id="InputFile" accept="image/*" onchange="setImg()" >
                      <p class="help-block">上传属于你自己的头像。</p>
                  </div>
              </div>
              <div class="col-sm-8">
                  <h2>账户设置</h2>
                  <h3>个人信息</h3>
                  <form class="form-horizontal">
                      <div class="form-group label_text">
                          <label for="email" class="col-sm-2 control-label">Email:</label>
                          <div class="col-sm-10">
                              <input type="email" name="email" id="email" class="form-control" placeholder="Email" required="required">
                          </div>
                          <label for="name" class="col-sm-2 control-label">姓名：</label>
                          <div class="col-sm-10">
                              <input type="text" name="name" id="name" class="form-control" placeholder="姓名" required="required">
                          </div>
                          <label for="pwd" class="col-sm-2 control-label">新密码：</label>
                          <div class="col-sm-10">
                              <input type="password" name="pwd" id="pwd" class="form-control" placeholder="密码" required="required">
                          </div>
                          <input type="button" name="保存" value="保存" class="save btn btn-primary">
                      </div>
                  </form>
                  <h2>Others</h2>
                  <p>
                      Beauty is often judged by our looks. Are you skinny? Is your skin spot free and perfectly smooth? Is your hair luscious like the L’Oreal commercials? All these factors come into play when people define beauty, but that is not what beauty is about. Don’t believe all the media you read, it will mislead you and never lead you to happiness.

                      What defines beauty is your personality and your attitude. Someone could be perfectly beautiful, yet they are the most shallow and mean person you could ever meet.

                      Here are the true traits of why you’re a beautiful girl.
                  </p>
              </div>
          </div>
      </div>
  </div>
</div>
<%--<footer style="margin-left: 1px">
    <div class="">
        <p class="pull-right">
            Mr.Codey 13108407 <a>白树明</a>. | <span
                class="lead"> <i class="fa fa-paw"></i> Gentelella Alela!
            </span>
        </p>
    </div>
    <div class="clearfix"></div>
</footer>--%>
</div>
</body>
</html>



