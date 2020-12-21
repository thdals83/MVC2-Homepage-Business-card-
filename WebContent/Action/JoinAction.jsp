<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "user.UserDAO"%>
<%@page import = "java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입액션</title>
</head>
<body>
<%

	
	request.setCharacterEncoding("UTF-8");	
	String Id = request.getParameter("UserID");
	String Password = request.getParameter("UserPass");
	String Email = request.getParameter("UserEmail");
	String Tel = request.getParameter("UserTel");
	
	if(Id == null || Password == null || Email == null || Tel == null)
	{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}else{
		UserDAO userDAO = new UserDAO();
		int result = userDAO.join(Id, Password, Email, Tel);
		
		if(result == -1)
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디 입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('회원가입이 완료되었습니다.')");
			script.println("location.href = '../View/LoginMain.jsp'");
			script.println("</script>");
		}
	}

%>
</body>
</html>