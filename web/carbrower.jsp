<%@ page import="java.util.ArrayList" %>
<%@ page import="com.codey.bean.CarInfo" %>
<%@ page import="com.codey.dao.CarDao" %>
<%--
  Created by IntelliJ IDEA.
  User: Mr.Codey
  Date: 2016/1/5
  Time: 9:29
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
        <div class="row">
            <div class="col-md-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>汽车浏览</h2>

                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">

                        <div class="row">

                            <p>所有汽车</p>
                            <%
                                ArrayList<CarInfo> mList = null;
                                CarDao cd = new CarDao();
                                mList = cd.querycarInfo();
                                for (int i = 0; i < 6; i++)
                                {
                                    for (CarInfo carInfo : mList)
                                    {

                            %>
                            <div class="col-md-55">
                                <div class="thumbnail">
                                    <div class="image view view-first">
                                        <img style="width: 100%; display: block;"
                                             src=<%=carInfo.getImgpath()%>
                                                     alt="image"/>

                                        <div class="mask">
                                            <p><%=carInfo.getCarname()%>
                                            </p>

                                            <div class="tools tools-bottom">
                                                <a href=<%="cardetails.jsp?carname="+carInfo.getCarname()%> >查看详情</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="caption">
                                        <a href="cardetails.jsp">
                                        <button class="btn btn-primary" value="预定">预订</button>
                                            </a>
                                        <span>&#165;<%=carInfo.getCarprize()%>/天</span>
                                    </div>
                                </div>
                            </div>
                            <%
                                    }
                                }
                            %>


                            <%--                            <div class="col-md-55">
                                                            <div class="thumbnail">
                                                                <div class="image view view-first">
                                                                    <img style="width: 100%; display: block;" src="images/4.jpg"
                                                                         alt="image"/>

                                                                    <div class="mask">
                                                                        <p>兰博基尼</p>

                                                                        <div class="tools tools-bottom">
                                                                            <a href="#">查看详情</a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="caption">
                                                                    <button class="btn btn-primary" value="预定">预订</button>
                                                                    <span>&#165;888.00/天</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-55">
                                                            <div class="thumbnail">
                                                                <div class="image view view-first">
                                                                    <img style="width: 100%; display: block;" src="images/4.jpg"
                                                                         alt="image"/>

                                                                    <div class="mask">
                                                                        <p>兰博基尼</p>

                                                                        <div class="tools tools-bottom">
                                                                            <a href="#">查看详情</a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="caption">
                                                                    <button class="btn btn-primary" value="预定">预订</button>
                                                                    <span>&#165;888.00/天</span>
                                                                </div>
                                                            </div>
                                                        </div>--%>
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

