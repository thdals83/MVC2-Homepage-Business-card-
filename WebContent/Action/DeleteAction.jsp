<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
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
		
		BbsDAO bbsDAO = new BbsDAO();
		int result = bbsDAO.delete(bbsID);
		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('명함 삭제에 실패했습니다')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('명함이 삭제되었습니다.')");
			script.println("location.href='../View/main.jsp'");
			script.println("</script>");
		}

%>

</body>
</html>