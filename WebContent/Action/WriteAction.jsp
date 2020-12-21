<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "bbs.BbsDAO"%>
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
	
	String id = (String)session.getAttribute("id");
	String uname = request.getParameter("UName");
	String name = request.getParameter("CName");
	String num = request.getParameter("CNum");
	String dep = request.getParameter("Department");
	String pos = request.getParameter("Position");
	String email = request.getParameter("Email");
	
	
	if(name == null || num == null || dep == null || pos == null)
	{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	else
	{
		BbsDAO bbsDAO = new BbsDAO();
		int result = bbsDAO.write(id, name, uname, num, pos, dep, email);
		
		if(result == -1)
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('명함작성이 실패했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('명함작성이 완료되었습니다.')");
			script.println("location.href = '../View/main.jsp'");
			script.println("</script>");
		}
	}

%>
</body>
</html>