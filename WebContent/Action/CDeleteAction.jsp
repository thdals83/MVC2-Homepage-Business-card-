<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ComDAO"%>
<%@ page import="com.Com"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
		int bbsID = 0;

		if(request.getParameter("ID") != null){
			bbsID = Integer.parseInt(request.getParameter("ID"));
		}
		
		ComDAO comDAO = new ComDAO();
		int result = comDAO.delete(bbsID);
		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('회사 삭제에 실패했습니다')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('회사정보가 삭제되었습니다.')");
			script.println("location.href='../View/Cmain.jsp'");
			script.println("</script>");
		}

%>

</body>
</html>