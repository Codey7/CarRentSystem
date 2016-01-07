<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="com.codey.control.CheckCookies" %>
<%
    request.setCharacterEncoding("UTF-8");
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Gentallela Alela! | </title>

    <!-- Bootstrap core CSS -->

    <link href="css/bootstrap.min.css" rel="stylesheet">

    <link href="fonts/css/font-awesome.min.css" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">

    <!-- Custom styling plus plugins -->
    <link href="css/custom.css" rel="stylesheet">
    <link href="css/icheck/flat/green.css" rel="stylesheet">
    <link rel="stylesheet" href="css/mine.css">
    <script src="js/jquery.min.js"></script>

    <!--[if lt IE 9]>
    <script src="../assets/js/ie8-responsive-file-warning.js"></script>
    <![endif]-->

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<%--    <script>
       var admin= document.getElementsByClassName("admin");
        admin.style.visibility="hidden";
        var loginbtn=document.getElementsByClassName("loginbtn");
       loginbtn.style.visibility="hidden";
    </script>--%>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".admin").hide();
            $(".loginbtn").hide();
        });
    </script>

    <%
        int a = CheckCookies.getInstance().checkCookies(request);
        if (a == 0)
        {

    %>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".carrent").click(function () {
                window.alert("请先登录！");
            });

        });
    </script>
    <%
    } else if (a == 2)
    {
    %>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".carrent").hide();
            $(".adminin").hide();
            $(".admin").show();
            $(".notloginbtn").hide();
            $(".loginbtn").hide();
        });
    </script>
    <%
    } else
    {
    %>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".admin").hide();
            $(".adminin").show();
            $(".notloginbtn").hide();
            $(".loginbtn").show();
        });
    </script>
    <%
        }
    %>

</head>


<body class="nav-md">

<div class="container body">


    <div class="main_container">

        <div class="col-md-3 left_col">
            <div class="left_col scroll-view">

                <div class="navbar nav_title" style="border: 0;">
                    <a href="index.jsp" class="site_title"><i class="fa fa-paw"></i>
                        <span>汽车租赁</span></a>
                </div>
                <div class="clearfix"></div>

                <!-- menu prile quick info -->
                <div class="profile">
                    <div class="profile_pic">
                        <img src="images/img.jpg" alt="..." class="img-circle profile_img">
                    </div>
                    <div class="profile_info">
                        <span>Welcome,</span>

                        <h2>Mr.Codey</h2>
                    </div>
                </div>
                <!-- /menu prile quick info -->

                <br/>

                <!-- sidebar menu -->
                <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">

                    <div class="menu_section">
                        <h3>General</h3>
                        <ul class="nav side-menu">
                            <li><a><i class="fa fa-home"></i> 首页 <span
                                    class="fa fa-chevron-down"></span></a>
                                <ul class="nav child_menu" style="display: none">
                                    <li><a href="index.jsp">新闻资讯</a>
                                    </li>
                                    <li><a href="carbrower.jsp">汽车浏览</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="carrent"><i class="fa fa-paypal"></i> 车辆租赁 <span
                                    class="fa fa-chevron-down"></span></a>
                                <ul class="nav child_menu" style="display: none">
                                    <li><a href="myorderform.jsp">我的订单</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="carrent"><i class="fa fa-user"></i> 个人管理 <span
                                    class="fa fa-chevron-down"></span></a>
                                <ul class="nav child_menu" style="display: none">
                                    <li><a href="mine.jsp">我的信息</a>
                                    </li>
                                    <li><a href="message.jsp">我的留言</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="menu_section">
                        <h3>管理员</h3>
                        <ul class="nav side-menu">
                            <li  class="adminin"><a href="login.jsp">管理员入口>> </a></li>
                            <li><a class="admin"><i class="fa fa-database"></i> 信息管理 <span
                                    class="fa fa-chevron-down"></span></a>
                                <ul class="nav child_menu" style="display: none">
                                    <li><a href="admin/userinfo.jsp">用户信息</a>
                                    </li>
                                    <li><a href="admin/newsinfo.jsp">新闻信息</a>
                                    </li>


                                    <li><a href="admin/leaveinfo.jsp">留言信息</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="admin"><i class="fa fa-calculator"></i> 销售信息 <span
                                    class="fa fa-chevron-down"></span></a>
                                <ul class="nav child_menu" style="display: none">
                                    <li><a href="admin/orderinfo.jsp">订单信息</a>
                                    </li>
                                    <li><a href="admin/carinfo.jsp">车辆信息</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>

                </div>
                <!-- /sidebar menu -->

                <!-- /menu footer buttons -->
                <div class="sidebar-footer hidden-small">
                    <a data-toggle="tooltip" data-placement="top" title="Settings">
                        <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
                    </a>
                    <a  data-toggle="tooltip" data-placement="top" title="FullScreen">
                        <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
                    </a>

                    <a href="logout" data-toggle="tooltip" data-placement="top" title="注销">
                        <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
                    </a>
                </div>
                <!-- /menu footer buttons -->
            </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav">

            <div class="nav_menu">
                <nav class="" role="navigation">
                    <div class="nav toggle">
                        <a id="menu_toggle"><i class="fa fa-bars"></i></a>
                    </div>

                    <ul class="nav navbar-nav navbar-right">
                        <li style="margin-top: 10px" class="notloginbtn">
                            <button class="btn btn-success">登录</button>
                            <button class="btn btn-success">注册</button>
                        </li>
                        <li class="loginbtn">
                            <a href="javascript:;" class="user-profile dropdown-toggle"
                               data-toggle="dropdown" aria-expanded="false">
                                <img src="images/img.jpg" alt="">Mr.Codey
                                <span class=" fa fa-angle-down"></span>
                            </a>
                            <ul class="dropdown-menu dropdown-usermenu animated fadeInDown pull-right">
                                <li><a href="javascript:;"> 设置</a>
                                </li>
                                <li>
                                    <a href="javascript:;">帮助</a>
                                </li>
                                <li><a href="logout"><i class="fa fa-sign-out pull-right"></i>
                                    注销</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>

        </div>
        <!-- /top navigation -->

        <!-- page content
        <div class="right_col" role="main">
            <div class="">
                <div class="page-title">
                    <div class="title_left">
                        <h3>Plain Page</h3>
                    </div>

                    <div class="title_right">
                        <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Search for...">
                                <span class="input-group-btn">
                        <button class="btn btn-default" type="button">Go!</button>
                    </span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>

                <div class="row">

                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel" style="height:600px;">
                            <div class="x_title">
                                <h2>Plain Page</h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                    </li>
                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                        <ul class="dropdown-menu" role="menu">
                                            <li><a href="#">Settings 1</a>
                                            </li>
                                            <li><a href="#">Settings 2</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li><a class="close-link"><i class="fa fa-close"></i></a>
                                    </li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            -->

        <!-- footer content -->
        <!-- <footer>
            <div class="">
                <p class="pull-right">Gentelella Alela! a Bootstrap 3 template by <a>Kimlabs</a>. |
                    <span class="lead"> <i class="fa fa-paw"></i> Gentelella Alela!</span>
                </p>
            </div>
            <div class="clearfix"></div>
        </footer> -->
        <!-- /footer content -->

    </div>
    <!-- /page content -->
</div>

</div>

<div id="custom_notifications" class="custom-notifications dsp_none">
    <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group">
    </ul>
    <div class="clearfix"></div>
    <div id="notif-group" class="tabbed_notifications"></div>
</div>

<script src="js/bootstrap.min.js"></script>

<!-- chart js -->
<script src="js/chartjs/chart.min.js"></script>
<!-- bootstrap progress js -->
<script src="js/progressbar/bootstrap-progressbar.min.js"></script>
<script src="js/nicescroll/jquery.nicescroll.min.js"></script>
<!-- icheck -->
<script src="js/icheck/icheck.min.js"></script>

<script src="js/custom.js"></script>

<!-- moris js -->
<script src="js/moris/raphael-min.js"></script>
<script src="js/moris/morris.js"></script>
<script src="js/moris/example.js"></script>

</body>

</html>