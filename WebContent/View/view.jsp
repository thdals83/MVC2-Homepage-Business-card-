<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="bbs.BbsDAO"%>
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
		//	 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		int bbsID = 0; // bbsID에 해당 게시물 번호가 저장
		if (request.getParameter("ID") != null) {
			bbsID = Integer.parseInt(request.getParameter("ID"));
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
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
			<a class="navbar-brand" href="main.jsp">명함 관리</a>
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
								style="background-color: #eeeeee; text-align: center;">명함 상세정보</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="width: 20%;">이름 직급 부서</td>
							<td colspan="2"><%= bbs.getUname() %>  <%= bbs.getUdep() %>  <%= bbs.getUpos() %></td>

						</tr>
						<tr>
							<td>회사 전화번호 메일</td>	
							<td colspan="2"><%= bbs.getCname() %>  <%= bbs.getUphone() %>  <%= bbs.getUemail() %></td>
						</tr>
					</tbody>
				</table>	
				
				<input type="button" value="목록" onClick="location.href='main.jsp'">

				<a href="Update.jsp?ID=<%=bbs.getCnum()%>">수정하기</a>
				<a href="../Action/DeleteAction.jsp?ID=<%=bbs.getCnum()%>">삭제하기</a>
				
		</div>

	</div>
</body>
</html>
