<%@ page import="com.codey.bean.CarInfo" %>
<%@ page import="com.codey.dao.CarDao" %><%--
  Created by IntelliJ IDEA.
  User: Mr.Codey
  Date: 2016/1/5
  Time: 22:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    response.setCharacterEncoding("UTF-8");
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<%!
    String carname;
%>
<%
    carname = request.getParameter("carname");
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
        <div class="row">
            <div class="col-md-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>汽车浏览</h2>

                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <%
                            CarInfo ci = null;
                            CarDao cd = new CarDao();
                            ci = cd.querycarByName(carname);
                            if (ci != null)
                            {
                        %>
                        <div class="col-md-7 col-sm-7 col-xs-12">
                            <div class="product-image">
                                <img src=<%=ci.getImgpath()%> alt="..."/>
                            </div>
                            <div class="product_gallery">
                                <a>
                                    <img src="images/4.jpg" alt="..."/>
                                </a>
                                <a>
                                    <img src="images/4.jpg" alt="..."/>
                                </a>
                                <a>
                                    <img src="images/4.jpg" alt="..."/>
                                </a>
                                <a>
                                    <img src="images/4.jpg" alt="..."/>
                                </a>
                            </div>
                        </div>
                        <div class="col-md-5 col-sm-5 col-xs-12" style="border:0px solid #e5e5e5;">
                            <h3 class="prod_title">
                                <%=ci.getCarname()%>
                            </h3>

                            <p><%=ci.getCarintro()%>
                            </p>
                            <br/>
                            <br/>
                            <br/>

                            <div class="">
                                <div class="product_price">
                                    <h1 class="price"><%=ci.getCarprize()%></h1>
                                    <br>
                                </div>
                            </div>
                            <div class="">
                                <button type="button" class="btn btn-default btn-lg">立即购买
                                </button>
                                <button type="button" class="btn btn-default btn-lg">收藏
                                </button>
                            </div>
                            <div class="product_social">
                                <ul class="list-inline">
                                    <li><a href="#"><i class="fa fa-facebook-square"></i></a>
                                    </li>
                                    <li><a href="#"><i class="fa fa-twitter-square"></i></a>
                                    </li>
                                    <li><a href="#"><i class="fa fa-envelope-square"></i></a>
                                    </li>
                                    <li><a href="#"><i class="fa fa-rss-square"></i></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <%
                        } else
                        {
                        %>
                        <h3>数据加载失败！</h3>
                        <%
                            }
                        %>


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


