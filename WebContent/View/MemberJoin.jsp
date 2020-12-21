<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Login</title>
    <link href="../css/MemberJoin.css" rel="stylesheet"  type="text/css"> 
</head>
<body>
<form action="../Action/JoinAction.jsp" method="post">
    <div class="page-container">
        <div class="login-form-container shadow">
            <div class="login-form-right-side">
                <div class="top-logo-wrap">
                
                </div>
                <center><h1>Buiness Card Management</h1></center>            
                <p>계정을 생성해 당신이 가지고 있는 명함을 관리하세요!</p>
            </div>
            
            <div class="login-form-left-side">         
            <div class="login-top-wrap">
                    <span>회원가입</span>
                </div>
                <div class="login-input-container">
                
                <div class="up"> 아이디</div>
                    <div class="login-input-wrap input-id">
                        <i class="far fa-envelope"></i>
                        <input type="text" name="UserID" size="40" placeholder="영어로만 입력하세요" >
                    </div>
                    
                 <div class="up"> 비밀번호</div>  
                    <div class="login-input-wrap input-password">
                        <i class="fas fa-key"></i>
                        <input type="password" name="UserPass" size="40"placeholder="비밀번호는 숫자와 영어만 넣어주세요">                   
                    </div>
                    
                  <div class="up"> 비밀번호 확인</div>  
                    <div class="login-input-wrap input-password2">
                        <i class="fas fa-key"></i>
                        <input type="password" name="UserPass2" >                   
                    </div>
                  
                  <div class="up"> 이메일</div>  
                    <div class="login-input-wrap input-password">
                        <i class="far fa-envelope"></i>
                        <input type="email" name="UserEmail" >                   
                    </div>
                    
                    <div class="up"> 전화번호</div>  
                    <div class="login-input-wrap input-password">
                        <i class="far fa-envelope"></i>
                        <input type="tel" name="UserTel" >                      
                    </div>
                                   
                </div>
                <div class="login-btn-wrap">
                    <button class="login-btn">확인</button>
                </div>
                
                <div class="login-down-wrap">
                    <span>계정이 생각나신 경우 </span>
                   <a href="LoginMain.jsp">메인 화면</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>