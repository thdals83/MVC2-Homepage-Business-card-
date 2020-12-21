<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "com.ComDAO"%>
<%@page import = "java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>명함작성액션</title>
</head>
<body>


<%
	request.setCharacterEncoding("UTF-8");
	
	String name = request.getParameter("CName");
	String add = request.getParameter("CAdd");
	String num = request.getParameter("CNum");
	String con = request.getParameter("Ccon");
	
	if(name == null || add == null || num == null || con == null)
	{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	else
	{
		ComDAO comDAO = new ComDAO();
		int result = comDAO.write(name, add, num, con);
		
		if(result == -1)
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('회사작성이 실패했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('회사작성이 완료되었습니다.')");
			script.println("location.href = '../View/Cmain.jsp'");
			script.println("</script>");
		}
	}

%>
</body>
</html>