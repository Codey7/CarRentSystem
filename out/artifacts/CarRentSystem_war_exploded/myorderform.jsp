<%--
  Created by IntelliJ IDEA.
  User: Mr.Codey
  Date: 2016/1/5
  Time: 10:49
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
                    我的订单
                </h3>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>所有订单</h2>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">

                        <section class="content invoice">
                            <div class="row">
                                <div class="col-xs-12 table">
                                    <table class="table table-striped">
                                        <thead>
                                        <tr>
                                            <th>商品预览</th>
                                            <th style="width: 8%">商品名称 </th>
                                            <th>单价</th>
                                            <th style="width: 59%">简介</th>
                                            <th>总计</th>
                                        </tr>
                                        </thead>
                                        <tbody class="order_tab">
                                        <tr>
                                            <td>
                                                <img style="width: 80%; display: block;" src="images/4.jpg"
                                                     alt="image"/>
                                            </td>
                                            <td>兰博基尼</td>
                                            <td>&#165;888.00</td>
                                            <td>1
                                            </td>
                                            <td>&#165;888.00</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <img style="width: 80%; display: block;" src="images/4.jpg"
                                                     alt="image"/>
                                            </td>
                                            <td>兰博基尼</td>
                                            <td>&#165;888.00</td>
                                            <td>1
                                            </td>
                                            <td>&#165;888.00</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <img style="width: 80%; display: block;" src="images/4.jpg"
                                                     alt="image"/>
                                            </td>
                                            <td>兰博基尼</td>
                                            <td>&#165;888.00</td>
                                            <td>1
                                            </td>
                                            <td>&#165;888.00</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <img style="width: 80%; display: block;" src="images/4.jpg"
                                                     alt="image"/>
                                            </td>
                                            <td>兰博基尼</td>
                                            <td>&#165;888.00</td>
                                            <td>1
                                            </td>
                                            <td>&#165;888.00</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.col -->
                            </div>
                            <div class="row no-print">
                                <div class="col-xs-12">
                                    <button class="btn btn-default" onclick="window.print();"><i class="fa fa-print"></i>打印</button>
                                    <button class="btn btn-success pull-right"><i class="fa fa-credit-card"></i>提交</button>

                                </div>
                            </div>
                        </section>
                    </div>
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


