<%@page import="javax.security.auth.callback.ConfirmationCallback"%>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
	<%@ page import="java.io.PrintWriter"%>
	<%@ page import="com.ComDAO"%>
	<%@ page import="com.Com"%>
	<%@ page import="java.util.ArrayList"%>
	<!DOCTYPE html>
	<html>
	<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- 뷰포트 -->
	<meta name="viewport" content="width=device-width" initial-scale="1">
	<!-- 스타일시트 참조  -->
	<link rel="stylesheet" href="../css/bootstrap.css">
	<title>명함 관리</title>
	<style type="text/css">
		a, a:hover {
			color: #000000;
			text-decoration: none;
		}
	</style>
	</head>
	<body>
		<%
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
					<li class="active"><a href="../Action/Cmain.jsp">목록보기</a></li>
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
							<th style="background-color: #eeeeee; text-align: center;">회사명</th>
							<th style="background-color: #eeeeee; text-align: center;">회사주소</th>
							<th style="background-color: #eeeeee; text-align: center;">회사번호</th>
							<th style="background-color: #eeeeee; text-align: center;">회사설명</th>
						</tr>
					</thead>
					<tbody>
						<%
							ComDAO comDAO = new ComDAO();
							ArrayList<Com> list = comDAO.getList(pageNumber);
							for (int i = 0; i < list.size(); i++) {
						%>
						<tr>
							<td><%=list.get(i).getComID()%></td>
							<td><a href="Cview.jsp?ID=<%=list.get(i).getComID()%>"><%=list.get(i).getCname()%></td>
							<td><%=list.get(i).getCaddress()%></td>
							<td><%=list.get(i).getCphone()%></td>
							<td><%=list.get(i).getCcontext()%></td>
							
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
				<!-- 페이지 넘기기 -->

				<input type="button" value="이전" onClick="main.jsp?pageNumber=<%=pageNumber - 1%>">

				<input type="button" value="다음" onClick="main.jsp?pageNumber=<%=pageNumber + 1%>">

				<input type="button" value="회사 등록" onClick="location.href='Cwrite.jsp';">
				
				<input type="button" value="명함 정보" onClick="location.href='main.jsp';">
				
			</div>
		</div>
	</body>
	</html>