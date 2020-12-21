<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="com.Com"%>
<%@ page import="com.ComDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width" initial-scale="1">
<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="../css/bootstrap.css">
<title>명함 관리</title>
</head>
<body>
	<%
		int comID = 0; // comID에 해당 게시물 번호가 저장
		if (request.getParameter("ID") != null) {
			comID = Integer.parseInt(request.getParameter("ID"));
		}
		Com com = new ComDAO().getCom(comID);
		
		out.println(comID);
	%>
	<!-- 네비게이션  -->
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="bs-example-navbar-collapse-1"
				aria-expaned="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">회사 관리</a>
		</div>
		<div class="collapse navbar-collapse"
			id="#bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
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
							<th colspan="3"
								style="background-color: #eeeeee; text-align: center;">회사 상세정보</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="width: 20%;">회사명 회사주소 회사번호</td>
							<td colspan="2"><%= com.getCname() %>  <%= com.getCaddress() %>  <%= com.getCphone() %></td>

						</tr>
						<tr>
							<td>회사 설명</td>	
							<td colspan="2"><%= com.getCcontext() %></td>
						</tr>
					</tbody>
				</table>	
				
				<input type="button" value="목록" onClick="location.href='main.jsp'">

				<a href="CUpdate.jsp?ID=<%=com.getComID()%>">수정하기</a>
				<a href="../Action/CDeleteAction.jsp?ID=<%=com.getComID()%>">삭제하기</a>
				
		</div>

	</div>
</body>
</html>
