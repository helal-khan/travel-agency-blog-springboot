<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/layouts/Header.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="/css/authentication.css" type="text/css">
<div class="page">
	<div class="container">
		<div class="row main">
			<div class="col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3">
				<div class="user-account">
					<h2 class="center">User Login</h2>
					<c:if test="${verification}">
						<div class="alert alert-success center">
						    <strong>Congratulations: </strong>Your account has been created, log in now.
						</div>
					</c:if>
					<!-- form -->
					<form action="${pageContext.request.contextPath}/login" method="POST" id="login" name='f'>
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-12">
								<div class="form-group">
									<div class="inner-addon left-addon">
										<i class="fas fa-user-alt auth-icon"></i>
										<input type="text" name="username" id="username" class="form-control" placeholder="Username" />
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-12">
								<div class="form-group">
									<div class="inner-addon left-addon">
										<i class="fas fa-key auth-icon"></i> 
										<input type="password" name="password" id="password" class="form-control" placeholder="Password" />
									</div>
								</div>
							</div>
						</div>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<div class="row center">
							<div class="col-xs-12 col-sm-6 col-md-6">
								<div class="form-group">
									<div class="checkbox">
										<label for="logged" class="">
											<input type="checkbox" name="remember-me" id="logged"> Keep me logged in 
										</label>
									</div>
								</div>
							</div>
							<div class="col-xs-12 col-sm-5 col-md-5 col-md-offset-1">
								<div class="form-group">
									<p class=""><a href="#">Forgot password</a></p>
								</div>
							</div>
						</div>
						<!-- Login error message -->
						<c:if test="${param.error != null}">
							<div class="row center">
								<div class="col-xs-12 col-sm-12 col-md-12">
									<div class="form-group">
										<span class="error">The username or password you entered is incorrect !</span>
									</div>
								</div>
							</div>
						</c:if>
						<div class="row center">
							<div class="col-xs-12 col-sm-12 col-md-12">
								<div class="form-group">
									<button type="submit" class="btn btn-primary btn-block">Login</button>
								</div>
							</div>
						</div>
						<div class="row center">
							<div class="col-xs-12 col-sm-12 col-md-12">
								<div class="form-group">
									<p class="goLogin">Do not have an account? 
										<a href="${pageContext.request.contextPath}/registration">Create an account</a>
									</p>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
			<!-- user-login -->
		</div>
	</div>
</div>
<%@include file="/WEB-INF/jsp/layouts/Footer.jsp"%>