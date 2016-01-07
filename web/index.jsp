<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="com.codey.bean.News" %>
<%@ page import="com.codey.dao.NewsDao" %>
<%
    response.setCharacterEncoding("UTF-8");
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
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
        <div id="carousel-example-generic" class="carousel slide container" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class=""></li>
                <li data-target="#carousel-example-generic" data-slide-to="1" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2" class=""></li>
            </ol>
            <div class="carousel-inner" role="listbox">
                <%
                    ArrayList<News> mList = null;
                    NewsDao nd = new NewsDao();
                    mList = nd.queryBannerNews();
                    for (News news : mList)
                    {
                        System.out.println(news.getTitle());
                %>
                <div class="item" id="active">
                    <img data-src="holder.js/900x500/auto/#777:#555/text:First slide"
                         alt="First slide [900x500]"
                         src= <%= news.getUrl()%>
                         data-holder-rendered="true">

                    <div class="carousel-caption">
                        <div class="jumbotron">
                            <div class="container">
                                <h1><%=news.getTitle()%></h1>

                                <p>
                                    <%=news.getContent()%>
                                    </p>

                                <p><a class="btn btn-primary btn-lg" href="#" role="button">了解更多</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>

                <%--<div class="item">
                    <img data-src="holder.js/900x500/auto/#777:#555/text:First slide"
                         alt="First slide [900x500]"
                         src="images/baoma5xi.jpg"
                         data-holder-rendered="true">

                    <div class="carousel-caption">
                        <div class="jumbotron">
                            <div class="container">
                                <h1>宝马5系(进口)</h1>

                                <p>
                                    日前，有海外媒体报道称，宝马新一代5系将会在2016年10月份开幕的巴黎车展期间正式亮相，然后在2017年于欧洲市场率先上市。此外，新5系的旅行版以及GT车型则会在2017年的日内瓦车展或法兰克富车展上发布。</p>

                                <p><a class="btn btn-primary btn-lg" href="#" role="button">了解更多</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="item active">
                    <img data-src="holder.js/900x500/auto/#666:#444/text:Second slide"
                         alt="Second slide [900x500]"
                         src="images/panamera.jpg"
                         data-holder-rendered="true">

                    <div class="carousel-caption">
                        <div class="jumbotron">
                            <div class="container">
                                <h1>Panmera</h1>

                                <p>
                                    此前，我们曾多次曝光了保时捷全新Panamera海外以及国内的路试谍照。
                                    日前，保时捷股份公司CEO马蒂亚斯·穆伦向海外媒体透露，
                                    全新Panamera将于2016年3月开幕的日内瓦车展首发亮相，随后会在2016年下半年正式上市。</p>

                                <p><a class="btn btn-primary btn-lg" href="#" role="button">了解更多</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <img data-src="holder.js/900x500/auto/#555:#333/text:Third slide"
                         alt="Third slide [900x500]"
                         src="images/lanbo.jpg"
                         data-holder-rendered="true">

                    <div class="carousel-caption">
                        <div class="jumbotron">
                            <div class="container">
                                <h1>Huracan</h1>

                                <p>日前，兰博基尼CEO Stephan Winkelmann在接受采访时表示，
                                    兰博基尼Huracan车型可能不止包含有五款不同版本，
                                    未来可能推出更高性能版本。</p>

                                <p><a class="btn btn-primary btn-lg" href="#" role="button">了解更多</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>--%>
            </div>
            <a class="left carousel-control" href="#carousel-example-generic" role="button"
               data-slide="prev">
                <!--<img class="navigate" src="img/ic_navigate_before_white_48dp.png" alt="Previous">-->
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button"
               data-slide="next">
                <!--<img class="navigate" src="img/ic_navigate_next_white_48dp.png" alt="Next">-->
            </a>
        </div>
        <div class="cont-info">
            <ul>
                <%
                    NewsDao nd1 = new NewsDao();
                    mList = nd1.queryNews();
                    for (News news : mList)
                    {
                       // System.out.println(news.getTitle());
                %>
                <li>
                    <div class="row">
                        <div class="col-md-2">
                    <div class="newpic">
                        <img  class="img-responsive" src=<%= news.getUrl()%> alt="专访兰博基尼CEO">
                    </div>
                        </div>
                        <div class="col-md-10">
                    <h3 class="new-title">
                        <a href="#"><%=news.getTitle()%></a>
                        <span><%=news.getPublishtime()%></span>
                    </h3>

                    <p class="info-tx">
                        <%=news.getContent()%>
                        <a class="readall-tx" href="#">阅读全文&gt;&gt;</a>
                    </p>
                        </div>
                    </div>
                </li>
                <%
                    }
                %>

            </ul>
        </div>
        <%--<div class="page-title">
            <div class="title_left">
                <h3>Plain Page</h3>
            </div>

            <div class="title_right">
                <div
                    class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                    <div class="input-group">
                        <input type="text" class="form-control"
                            placeholder="Search for..."> <span
                            class="input-group-btn">
                            <button class="btn btn-default" type="button">Go!</button>
                        </span>
                    </div>
                </div>
            </div>
        </div>--%>
        <%--<div class="clearfix"></div>

        <div class="row">

            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel" style="height:600px;">
                    <div class="x_title">
                        <h2>Plain Page</h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i
                                    class="fa fa-chevron-up"></i></a></li>
                            <li class="dropdown"><a href="#" class="dropdown-toggle"
                                data-toggle="dropdown" role="button" aria-expanded="false"><i
                                    class="fa fa-wrench"></i></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="#">Settings 1</a></li>
                                    <li><a href="#">Settings 2</a></li>
                                </ul></li>
                            <li><a class="close-link"><i class="fa fa-close"></i></a></li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>--%>
    </div>
    <footer style="margin-left: 1px">
        <div class="">
            <p class="pull-right">
                Mr.Codey 13108407 <a>白树明</a>. | <span
                    class="lead"> <i class="fa fa-paw"></i> 网上汽车租赁系统
                </span>
            </p>
        </div>
        <div class="clearfix"></div>
    </footer>
</div>
<script type="text/javascript">
    /*$(document).ready(function()
     {
     $("#active").addClass(active);
     });*/
    var active =document.getElementById("active");
    active.className=active.className+" active";
</script>
</body>
</html>
