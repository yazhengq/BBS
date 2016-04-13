<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>

<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>


<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	String str = "";
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost/bbs?useSSL=false&user=root&password=root";
	Connection conn = DriverManager.getConnection(url);
	
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("select * from article ");
	while(rs.next()){
	 	str += "<tr><td>" + rs.getInt("id") + "</td><td>" 
				+ rs.getString("title") + "</td><tr>";
		
	}
	out.println(str);
	rs.close();
	stmt.close();
	conn.close();
	
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'ShowArticleTree.jsp' starting page</title>

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
<table border="1">
	<%=str %>
</table>
</body>

</html>
