<%@ page import="com.codey.dao.OrderFormDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.codey.bean.OrderForm" %><%--
  Created by IntelliJ IDEA.
  User: Mr.Codey
  Date: 2016/1/5
  Time: 11:52
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

    <link href="../css/bootstrap.min.css" rel="stylesheet">

    <link href="../fonts/css/font-awesome.min.css" rel="stylesheet">
    <link href="../css/animate.min.css" rel="stylesheet">

    <!-- Custom styling plus plugins -->
    <link href="../css/custom.css" rel="stylesheet">
    <link href="../css/icheck/flat/green.css" rel="stylesheet">
    <link href="../css/mine.css">
    <script src="../js/jquery.min.js"></script>
</head>
<body>
<jsp:include page="common.jsp"/>
<div class="right_col main_container" role="main">
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3>
                    订单管理
                </h3>
            </div>
        </div>
        <div class="row">

            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>订单管理模块
                        </h2>

                        <div class="clearfix"></div>
                    </div>

                    <div class="x_content">
                        <table class="table table-striped responsive-utilities jambo_table bulk_action">
                            <thead>
                            <tr class="headings">
                                <th>
                                    <input type="checkbox" id="check-all" class="flat">
                                </th>
                                <th class="column-title">订单用户</th>
                                <th class="column-title">订单时间</th>
                                <th class="column-title">商品名称</th>
                                <th class="column-title">商品数量</th>
                                <th class="column-title">是否支付</th>
                                <th class="column-title">总金额</th>
                                <th class="column-title no-link last"><span
                                        class="nobr">操作</span>
                                </th>
                                <th class="bulk-actions" colspan="7">
                                    <a class="antoo" style="color:#fff; font-weight:500;">Bulk
                                        Actions ( <span class="action-cnt"> </span> ) <i
                                                class="fa fa-chevron-down"></i></a>
                                </th>
                            </tr>
                            </thead>

                            <tbody>
                            <%
                                OrderFormDao ofd=new OrderFormDao();
                                ArrayList<OrderForm> mList=null;
                                mList=ofd.queryOrderForm();
                                for (OrderForm orderForm : mList)
                                {
                             %>
                            <tr class="even pointer">
                                <td class="a-center "><input type="checkbox" class="flat"
                                                             name="table_records"></td>
                                <td class=" "><%=orderForm.getUsername()%></td>
                                <td class=" "><%=orderForm.getOrdertime()%></td>
                                <td class=" "><%=orderForm.getCarname()%><i class="success fa fa-long-arrow-up"></i>
                                </td>
                                <td class=" "><%=orderForm.getNum()%></td>
                                <td class=" ">
                                    <%=orderForm.pay(orderForm.ispay())%>
                                </td>
                                <td class="a-right a-right ">￥<%=orderForm.getNum()*orderForm.getUnitprice()%></td>
                                <td class=" last">
                                    <a href=<%="../admin/deleteorderform?username="+orderForm.getUsername()+"&carname="+orderForm.getCarname()%>>
                                    <button type="button"
                                            class="btn btn-round btn-danger">删除
                                    </button>
                                        </a>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                            </tbody>

                        </table>
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
</div>
<!-- Datatables -->
<script src="../js/datatables/js/jquery.dataTables.js"></script>
<script src="../js/datatables/tools/js/dataTables.tableTools.js"></script>
<script>
    $(document).ready(function () {
        $('input.tableflat').iCheck({
            checkboxClass: 'icheckbox_flat-green',
            radioClass: 'iradio_flat-green'
        });
    });

    var asInitVals = new Array();
    $(document).ready(function () {
        var oTable = $('#example').dataTable({
            "oLanguage": {
                "sSearch": "Search all columns:"
            },
            "aoColumnDefs": [
                {
                    'bSortable': false,
                    'aTargets': [0]
                } //disables sorting for column one
            ],
            'iDisplayLength': 12,
            "sPaginationType": "full_numbers",
            "dom": 'T<"clear">lfrtip',
            "tableTools": {
                "sSwfPath": "<?php echo base_url('assets2/js/Datatables/tools/swf/copy_csv_xls_pdf.swf'); ?>"
            }
        });
        $("tfoot input").keyup(function () {
            /* Filter on the column based on the index of this element's parent <th> */
            oTable.fnFilter(this.value, $("tfoot th").index($(this).parent()));
        });
        $("tfoot input").each(function (i) {
            asInitVals[i] = this.value;
        });
        $("tfoot input").focus(function () {
            if (this.className == "search_init") {
                this.className = "";
                this.value = "";
            }
        });
        $("tfoot input").blur(function (i) {
            if (this.value == "") {
                this.className = "search_init";
                this.value = asInitVals[$("tfoot input").index(this)];
            }
        });
    });
</script>
</body>
</html>




