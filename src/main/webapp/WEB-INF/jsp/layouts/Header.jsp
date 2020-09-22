<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>ABC Travel Agency | ${pageTitle}</title>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="author" content="Theme Region">
		<link rel="icon" href="/img/globe.png">
		<!-- CSS Library-->
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
		<link rel="stylesheet" href="/css/lib/font-awesome.min.css" type="text/css"/>
		<link rel="stylesheet" href="/css/lib/datepicker3.css" type="text/css"/>
		<link rel="stylesheet" href="/css/lib/bootstrap.min.css">
		<link rel="stylesheet" href="/css/lib/icofont.css">
		<link rel="stylesheet" href="/css/lib/slidr.css">
		<link rel="stylesheet" href="/css/lib/main.css" type="text/css">		
		<link rel="stylesheet" href="/css/lib/preset1.css" id="preset">
		<link rel="stylesheet" href="/css/lib/responsive.css">
		<link rel="stylesheet" href="/css/lib/toastr.css">
		<link rel="stylesheet" href="/css/lib/select2.min.css" type="text/css" />
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<!-- CSS Custom-->
		<link rel="stylesheet" href="css/style.css" type="text/css">
		
		<link rel="stylesheet" href="http://emis.icddrb.org:8080/emis-monitoringtools/resources/notiflix/notiflix-1.9.1.min.css" type="text/css">
		
		
		<style type="text/css">
			label.error {
				color:red;
				font-weight: bold;
			}
			.user-icon{
				font-size: 17px!important;
			}
			.head-text{
				margin-top: 10px;
				font-weight: bold;
			}
			.write-post-btn{
				border-color: #37BC9B;
			    background-color: #37BC9B;
			    color: #FFFFFF;
			}
			.dropdown-menu{
				padding: 11px 12px;
				margin: 12px 0 20px!important;
			}
		</style>
		
		<!-- font -->
<!-- 		<link href='https://fonts.googleapis.com/css?family=Ubuntu:400,500,700,300' rel='stylesheet' type='text/css'> -->
<!-- 		<link href='https://fonts.googleapis.com/css?family=Signika+Negative:400,300,600,700' rel='stylesheet' type='text/css'> -->
		
		<!-- icons -->
<!-- 		<link rel="icon" href="images/ico/favicon.ico"> -->
<!-- 		<link rel="apple-touch-icon" sizes="144x144" -->
<!-- 			href="https://demo.themeregion.com/jobs-updated/images/ico/apple-touch-icon-144-precomposed.png"> -->
<!-- 		<link rel="apple-touch-icon" sizes="114x114" -->
<!-- 			href="https://demo.themeregion.com/jobs-updated/images/ico/apple-touch-icon-114-precomposed.png"> -->
<!-- 		<link rel="apple-touch-icon" sizes="72x72" -->
<!-- 			href="https://demo.themeregion.com/jobs-updated/images/ico/apple-touch-icon-72-precomposed.png"> -->
<!-- 		<link rel="apple-touch-icon" sizes="57x57" -->
<!-- 			href="https://demo.themeregion.com/jobs-updated/images/ico/apple-touch-icon-57-precomposed.png"> -->
	</head>
<body>
	<!-- header -->
	<input type="hidden" value="${pageContext.request.contextPath}" id="context-path"  />
	<header id="header" class="clearfix">
		<!-- navbar -->
		<nav class="navbar navbar-default">
			<div class="container">
				<!-- navbar-header -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#navbar-collapse">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="${pageContext.request.contextPath}">
						<img class="img-responsive" width="40px" height="40px" src="img/globe.png" alt="Logo">
						</a>
						<a class="navbar-brand head-text" href="${pageContext.request.contextPath}/home">ABC Travel Agency</a>
				</div>
				<!-- /navbar-header -->

				<div class="navbar-left">
					<div class="collapse navbar-collapse" id="navbar-collapse">
						<ul class="nav navbar-nav">
							<li class="active"><a href="${pageContext.request.contextPath}/home">Home</a></li>
							<li><button onclick="window.location.href = '${pageContext.request.contextPath}/profile';" class="btn btn-primary btn-post btn-xs"><i class="fa fa-paper-plane" aria-hidden="true"></i>&nbsp;Create post</button></li>
						</ul>
					</div>
				</div>
				<!-- navbar-left -->

				<!-- nav-right -->
				<div class="nav-right">
					<sec:authorize access="!isAuthenticated()">
						<ul class="sign-in" style="display: inline;">
							<li class="bold"><i class="fas fa-sign-in-alt user-icon"></i><a href="${pageContext.request.contextPath}/login"> Login</a>&nbsp;&nbsp;&nbsp;</li>
							<li class="bold"><i class="fas fa-user-plus user-icon"></i> <a href="${pageContext.request.contextPath}/registration"> Register</a></li>
							<li style="display: none;"></li>
						</ul>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<ul class="sign-in" style="display: inline;">
							<li class="dropdown">
							  <img src="https://ui-avatars.com/api/?name=${user.firstName}+${user.lastName}&rounded=true&size=30">
							  <a href="#" class="dropdown-toggle" data-toggle="dropdown">${user.firstName} ${user.lastName}<span class="caret"></span></a>				
							  <ul class="dropdown-menu">
				                <li>
				                	<a href="${pageContext.request.contextPath}/profile"><i  class="fa fa-user" aria-hidden="true"></i> Profile</a>
			                	</li>
				                <li>
				                	<a href="javascript:$.logout()"><i class="fa fa-sign-out" aria-hidden="true"></i> Log Out</a>
				                </li>
				              </ul>                
				            </li>
						</ul>
					</sec:authorize>
				</div>
				<!-- nav-right -->
			</div>
			<!-- container -->
		</nav>
		<!-- navbar -->
	</header>
	<!-- header -->
    <c:url var="logoutUrl" value="/logout" /> 
    <form action="${logoutUrl}" method="post" id="logoutForm">
	    <input type="hidden" name="${_csrf.parameterName}"     value="${_csrf.token}" />
	</form>