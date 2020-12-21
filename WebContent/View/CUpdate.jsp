<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ComDAO"%>
<%@ page import="com.Com"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link href="../css/Write.css" rel="stylesheet"  type="text/css"> 
</head>
<body>
<%
		int bbsID = 0;

		if(request.getParameter("ID") != null){
			bbsID = Integer.parseInt(request.getParameter("ID"));
		}
		
		ComDAO comDAO = new ComDAO();
		int result = comDAO.delete(bbsID);
%>
<form action="../Action/CwriteAction.jsp" method="post">
    <div class="page-container">
        <div class="login-form-container shadow">
            <div class="login-form-right-side">
                <div class="top-logo-wrap">
                
                </div>
                <center><h1>Buiness Card Management</h1></center>            
                <p>회사 정보를 등록하세요</p>
            </div>
            
            <div class="login-form-left-side">         
            <div class="login-top-wrap">
                    <span>회사 정보 수정</span>
                </div>
                <div class="login-input-container">
                
                 <div class="up">회사 이름</div>
                    <div class="login-input-wrap input-cname">
                        <i class="far fa-envelope"></i>
                        <input type="text" name="CName" size="40" >
                    </div>
                
                <div class="up">회사 주소</div>
                    <div class="login-input-wrap input-cname">
                        <i class="far fa-envelope"></i>
                        <input type="text" name="CAdd" size="40" >
                    </div>
                    
                 <div class="up">회사 번호</div>  
                    <div class="login-input-wrap input-cnum">
                        <i class="fas fa-key"></i>
                        <input type="text" name="CNum" size="40">                   
                    </div>
                    
                   <div class="up">회사 설명</div>  
                    <div class="login-input-wrap input-Email">
                        <i class="far fa-envelope"></i>
                        <input type="text" name="Ccon" >                   
                    </div>       
                </div>
                <div class="login-btn-wrap">
                    <button class="login-btn">수정하기</button>
                </div>
                
                <div class="login-down-wrap">
                   <a href="main.jsp">돌아가기</a>
                </div>
            </div>
        </div>
    </div>
   
</body>
</html>