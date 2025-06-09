<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!-- 充值 -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>充值</title>
		<link rel="stylesheet" href="../../../front/layui/css/layui.css">
		<!-- 样式 -->
		<link rel="stylesheet" href="../../../front/css/style.css" />
		<!-- 主题（主要颜色设置） -->
		<link rel="stylesheet" href="../../../front/css/theme.css" />
		<!-- 通用的css -->
		<link rel="stylesheet" href="../../../front/css/common.css" />
		<style type="text/css">
			.pay-type-list {
				display: flex;
				align-items: center;
				flex-wrap: wrap;
			}

			.pay-type-item {
				background: #FFFFFF;
				border: 3px dotted #EEEEEE;
				margin: 20px;
				padding: 20px;
				width: 200px;
			}
		</style>
	</head>
	<body style="background: #EEEEEE;">

		<div id="app">

			<form class="layui-form" lay-filter="myForm">
				<div class="pay-type-list">
					<div class="pay-type-item">
						<input type="radio" name="type" value="微信支付" checked>
						<img  src="../../../front/img/weixin.png" alt>
						<span>微信支付</span>
					</div>
					<div class="pay-type-item">
						<input type="radio" name="type" value="支付宝支付">
						<img src="../../../front/img/zhifubao.png" alt>
						<span>支付宝支付</span>
					</div>
					<div class="pay-type-item">
						<input type="radio" name="type" value="建设银行">
						<img style="width: 120px;height: 60px;" src="../../../front/img/jianshe.png" alt>
					</div>
					<div class="pay-type-item">
						<input type="radio" name="type" value="农业银行">
						<img style="width: 120px;height: 60px;" src="../../../front/img/nongye.png" alt>
					</div>
					<div class="pay-type-item">
						<input type="radio" name="type" value="中国银行">
						<img style="width: 120px;height: 60px;" src="../../../front/img/zhongguo.png" alt>
					</div>
					<div class="pay-type-item">
						<input type="radio" name="type" value="交通银行">
						<img style="width: 120px;height: 60px;" src="../../../front/img/jiaotong.png" alt>
					</div>
				</div>
				<button style="margin-left: 20px;width:860px;height: 40px;line-height: 40px;" class="layui-btn btn-submit btn-theme"
				 lay-submit lay-filter="*">确认支付</button>
			</form>

		</div>
        <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js">
        </script>
        <%--<script src="../../../resources/js/jquery.min.js"></script>--%>
        <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js"></script>
		<!-- layui -->
		<script src="../../../front/layui/layui.js"></script>

		<script>

			layui.use(['layer', 'element', 'http', 'jquery', 'form'], function() {
				var http = layui.http;
				var form = layui.form;

				// 查询用户信息
				http.request(`yonghu/session`, 'get', {}, function(data) {
                    http.requestJson(`yonghu/huiyuan`, 'post', data.data, function(data) {
						alert("升级成功")
                    });
				});



                // 表单效验规则
                form.verify({
                    // 正整数效验规则
                    integer: [
                        /^[1-9][0-9]*$/
                        ,'必须是正整数'
                    ]
                    // 小数效验规则
                    ,double: [
                        /^[1-9][0-9]{0,5}(\.[0-9]{1,2})?$/
                        ,'最大整数位为6为,小数最大两位'
                    ]
                });

			});
		</script>
	</body>
</html>
