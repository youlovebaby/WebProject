<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'content.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <div id="content_4_1" class="item_content">
				<div>添加题型</div>
				<div>

					<div>
						题型名： <input type="text" />
					</div>

					<div>
						标题描述： <input type="text" />
					</div>

					<div>
						是否为客观题:<input type="radio" value="是" />是<input type="radio"
							value="否" />否
					</div>

					<div>
						<input type="button" value="提交" />
					</div>

				</div>
		</div>
  </body>
</html>
