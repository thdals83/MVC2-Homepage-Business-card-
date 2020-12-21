<%@page import="javax.security.auth.callback.ConfirmationCallback"%>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
	<%@ page import="java.io.PrintWriter"%>
	<%@ page import="bbs.BbsDAO"%>
	<%@ page import="bbs.Bbs"%>
	<%@ page import="java.util.ArrayList"%>
	<!DOCTYPE html>
	<html>
	<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- 뷰포트 -->
	<meta name="viewport" content="width=device-width" initial-scale="1">
	<!-- 스타일시트 참조  -->
	<link rel="stylesheet" href="../css/bootstrap.css">
	<title>jsp 게시판 웹사이트</title>
	<style type="text/css">
		a, a:hover {
			color: #000000;
			text-decoration: none;
		}
	</style>
	</head>
	<body>
		<%
			String userID = (String) session.getAttribute("id");
			
			int pageNumber = 1; //기본 페이지 넘버
			//페이지넘버값이 있을때
			if (request.getParameter("pageNumber") != null) {
				pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
			}
		%>


		<!-- 네비게이션  -->
		<nav class="navbar navbar-default">
			<div class="collapse navbar-collapse"
				id="#bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active"><a href="main.jsp">목록보기</a></li>
				</ul>
			</div>
		</nav>
		<!-- 게시판 -->
		<div class="container">
			<div class="row">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th style="background-color: #eeeeee; text-align: center;">번호</th>
							<th style="background-color: #eeeeee; text-align: center;">이름</th>
							<th style="background-color: #eeeeee; text-align: center;">회사명</th>
						</tr>
					</thead>
					<tbody>
						<%
							BbsDAO bbsDAO = new BbsDAO();
							ArrayList<Bbs> list = bbsDAO.getList(pageNumber, userID);
							for (int i = 0; i < list.size(); i++) {
						%>
						<tr>
							<td><%=list.get(i).getCnum()%></td>
							<td><a href="view.jsp?ID=<%=list.get(i).getCnum()%>"><%=list.get(i).getUname()%></a></td>
							<td><%=list.get(i).getCname()%></td>
							
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
				<!-- 페이지 넘기기 -->

				<input type="button" value="이전" onClick="main.jsp?pageNumber=<%=pageNumber - 1%>">

				<input type="button" value="다음" onClick="main.jsp?pageNumber=<%=pageNumber + 1%>">

				<input type="button" value="명함 등록" onClick="location.href='Write.jsp';">
				
				<input type="button" value="회사 정보" onClick="location.href='Cmain.jsp';">
				

			</div>
		</div>
	</body>
	</html>
