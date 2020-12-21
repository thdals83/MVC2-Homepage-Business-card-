<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="bbs.BbsDAO"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	
	int bbsID = Integer.parseInt(request.getParameter("ID"));

	String uname = request.getParameter("UName2");
	String cname = request.getParameter("CName2");
	String num = request.getParameter("CNum2");
	String email = request.getParameter("Email2");
	String dep = request.getParameter("Department2");
	String pos = request.getParameter("Position2");
	
	
	if(uname == null || cname == null || num == null || email == null || dep == null || pos == null)
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
		int result = bbsDAO.update(bbsID, cname, uname, num, dep, pos, email);
		
		if(result == -1)
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('명함수정이 실패했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('명함수정이 완료되었습니다.')");
			script.println("location.href = '../View/main.jsp'");
			script.println("</script>");
		}
	}
	 %>
</body>
</html>