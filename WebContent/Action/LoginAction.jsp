<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "user.UserDAO"%>
<%@page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("UserID1");
		String password = request.getParameter("UserPass1"); 

		UserDAO userDAO = new UserDAO(); //인스턴스생성

		int result = userDAO.login(id, password);
		//로그인 성공
		if(result == 1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 성공')");
			script.println("location.href = '../View/main.jsp'");
			script.println("</script>");
			session.setAttribute("id",id);
		}
		//로그인 실패
		else if(result == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		//아이디 없음
		else if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 아이디 입니다.')");
		script.println("history.back()");
		script.println("</script>");
		}
		//DB오류
		else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('DB오류가 발생했습니다.')");
		script.println("history.back()");
		script.println("</script>");
		}
		
		
	%>
</body>
</html>