<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Login</title>
    <link href="../css/LoginMain.css" rel="stylesheet"  type="text/css"> 
</head>
<body>


<form action="../Action/LoginAction.jsp" method="post">
    <div class="page-container">
        <div class="login-form-container shadow">
            <div class="login-form-right-side">
                <div class="top-logo-wrap">
                                   
                </div>
                <center><h1>Buiness Card Management</h1></center>            
                <p>로그인을 해 당신이 가지고 있는 명함을 관리하세요!</p>
            </div>
            
            <div class="login-form-left-side">
                <div class="login-top-wrap">
                    <span>계정이 없는경우</span>
                   <a href="MemberJoin.jsp">Create Account</a>
                </div>
                
                <div class="login-input-container">
                    <div class="login-input-wrap input-id">
                        <i class="far fa-envelope"></i>
                        <label>ID</label>
                        <input type="text" placeholder="ID" name="UserID1" required >
                    </div>
                    
                    <div class="login-input-wrap input-password">
                        <i class="fas fa-key"></i>
                        <label>PW</label>
                        <input type="password" placeholder="password" name="UserPass1" required>
                    </div>
                    
                </div>
                <div class="login-btn-wrap">
                    <button class="login-btn">Login</button>
                </div>
            </div>
        </div>
    </div>
    