<%--
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

                        <div class="col-md-7 col-sm-7 col-xs-12">
                            <div class="product-image">
                                <img src="images/4.jpg" alt="..."/>
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

                            <h3 class="prod_title">LOWA Men’s Renegade GTX Mid Hiking Boots
                                Review</h3>

                            <p>Raw denim you probably haven't heard of them jean shorts Austin.
                                Nesciunt tofu stumptown aliqua butcher retro keffiyeh dreamcatcher
                                synth. Cosby sweater eu banh mi, qui irure terr.</p>
                            <br/>
                            <br/>
                            <br/>

                            <div class="">
                                <div class="product_price">
                                    <h1 class="price">Ksh80.00</h1>
                                    <span class="price-tax">Ex Tax: Ksh80.00</span>
                                    <br>
                                </div>
                            </div>

                            <div class="">
                                <button type="button" class="btn btn-default btn-lg">Add to Cart
                                </button>
                                <button type="button" class="btn btn-default btn-lg">Add to
                                    Wishlist
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


