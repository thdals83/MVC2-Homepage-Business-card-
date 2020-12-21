<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Enrollment</title>
    <link href="../css/Write.css" rel="stylesheet"  type="text/css"> 
</head>
<body>
<%
		int bbsID = 0;

		if(request.getParameter("ID") != null){
			bbsID = Integer.parseInt(request.getParameter("ID"));
		}
		
		BbsDAO bbsDAO = new BbsDAO();
		int result = bbsDAO.delete(bbsID);

%>
<form action="../Action/WriteAction.jsp" method="post">
    <div class="page-container">
        <div class="login-form-container shadow">
            <div class="login-form-right-side">
                <div class="top-logo-wrap">
                
                </div>
                <center><h1>Buiness Card Management</h1></center>            
                <p>수정할 명함을 등록하세요</p>
            </div>
            
            <div class="login-form-left-side">         
            <div class="login-top-wrap">
                    <span>명함 등록</span>
                </div>
                <div class="login-input-container">
                
                 <div class="up"> 이름</div>
                    <div class="login-input-wrap input-cname">
                        <i class="far fa-envelope"></i>
                        <input type="text" name="UName" size="40" >
                    </div>
                
                <div class="up"> 회사이름</div>
                    <div class="login-input-wrap input-cname">
                        <i class="far fa-envelope"></i>
                        <input type="text" name="CName" size="40" >
                    </div>
                    
                 <div class="up"> 전화번호</div>  
                    <div class="login-input-wrap input-cnum">
                        <i class="fas fa-key"></i>
                        <input type="text" name="CNum" size="40">                   
                    </div>
                    
                   <div class="up"> 메일주소</div>  
                    <div class="login-input-wrap input-Email">
                        <i class="far fa-envelope"></i>
                        <input type="text" name="Email" >                   
                    </div> 
                    
                  <div class="up"> 부서</div>  
                    <div class="login-input-wrap input-Position">
                        <i class="fas fa-key"></i>
                        <input type="text" name="Position" >                   
                    </div>
                  
                  <div class="up"> 직급</div>  
                    <div class="login-input-wrap input-Department">
                        <i class="far fa-envelope"></i>
                        <input type="text" name="Department" >                   
                    </div>          
                </div>
                <div class="login-btn-wrap">
                    <button class="login-btn">확인</button>
                </div>
                
                <div class="login-down-wrap">
                   <a href="main.jsp">돌아가기</a>
                </div>
            </div>
        </div>
    </div>
   
</body>
</html>