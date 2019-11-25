<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/layouts/Header.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/css/authentication.css" type="text/css">
<div class="page">
	<div class="container">
		<div class="row main">
			<!-- user-login -->
			<div class="col-sm-8 col-sm-offset-2 col-md-8 col-md-offset-2">
				<div class="user-account">
					<h2 class="center">Create An Account</h2>
					<!-- Registration success message -->
					<c:if test="${reg}">
						<div class="alert alert-success center">
						    <strong>Congratulation: </strong>Your registration successful, Please login now
						</div>
					</c:if>
					<c:if test="${reg==false}">
						<div class="alert alert-danger center">
						    <strong>Sorry: </strong>Something went wrong, try later
						</div>
					</c:if>
					<input type="hidden" value="${pageContext.request.contextPath}/checkUsername" name="url-check-username">
					<input type="hidden" value="${pageContext.request.contextPath}/checkEmail" name="url-check-email">
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane active" id="find-job">
							<form:form action="${pageContext.request.contextPath}/registration" method="POST" id="userRegistration" modelAttribute="user">
								<div class="row">
									<div class="col-xs-12 col-sm-6 col-md-6">
										<div class="form-group">
											<div class="inner-addon left-addon">
										      <i class="fas fa-user-alt auth-icon"></i>
										      <form:input type="text" path="firstName" name="firstName" id="firstName" class="form-control" placeholder="Firstname" />
										      <form:errors path="firstName" cssClass="error" />
										    </div>
										</div>
									</div>
									<div class="col-xs-12 col-sm-6 col-md-6">
										<div class="form-group">
											<div class="inner-addon left-addon">
										      <i class="fas fa-user-alt auth-icon"></i>
										      <form:input type="text" path="lastName" name="lastName" id="lastName" class="form-control" placeholder="Lastname" />
										      <form:errors path="lastName" cssClass="error" />
										    </div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-xs-12 col-sm-12 col-md-12">
										<div class="form-group">
											<div class="inner-addon left-addon">
										      <i class="fas fa-user-circle auth-icon"></i>
										      <form:input type="text" path="username" name="username" id="username" class="form-control" placeholder="Username" />
										      <form:errors path="username" cssClass="error" />
										    </div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-xs-12 col-sm-6 col-md-6">
										<div class="form-group">
											<div class="inner-addon left-addon">
										      <i class="fas fa-key auth-icon"></i>
										      <form:input type="password" path="password" name="password" id="password" class="form-control" placeholder="Password" />
										      <form:errors path="password" cssClass="error" />
										    </div>
										</div>
									</div>
									<div class="col-xs-12 col-sm-6 col-md-6">
										<div class="form-group">
											<div class="inner-addon left-addon">
										      <i class="fas fa-key auth-icon"></i>
										      <input type="password" name="confirmPassword" id="confirmPassword" class="form-control" placeholder="confirm password" />
										    </div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-xs-12 col-sm-6 col-md-6">
										<div class="form-group">
											<div class="inner-addon left-addon">
										      <i class="fas fa-envelope auth-icon"></i>
										      <form:input type="text" path="email" name="email" id="email" class="form-control" placeholder="email" />
										      <form:errors path="email" cssClass="error" />
										    </div>
										</div>
									</div>
									<div class="col-xs-12 col-sm-6 col-md-6">
										<div class="form-group">
											<div class="inner-addon left-addon">
										      <i class="fas fa-phone auth-icon"></i>
										      <form:input type="text" path="phone" name="phone" id="phone" class="form-control" placeholder="Phone" />
										      <form:errors path="phone" cssClass="error" />
										    </div>
										</div>
									</div>
								</div>
								<div class="row center">
									<div class="col-xs-12 col-sm-6 col-md-6">
										<div class="form-group">
										<p class="goLogin">Have an account ? <a href="${pageContext.request.contextPath}/login">Login</a></p>
										</div>
									</div>
									<div class="col-xs-12 col-sm-6 col-md-6">
										<div class="form-group">
											<button type="submit" class="btn btn-primary btn-block">Registration</button>
										</div>
									</div>
								</div>
							</form:form>
						</div>
					</div>
				</div>
			</div>
			<!-- user-login -->
		</div>
	</div>
</div>
<%@include file="/WEB-INF/jsp/layouts/Footer.jsp"%>