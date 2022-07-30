<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shop quần áo - Đăng nhập</title>
</head>
<body>

	<div class="breadcrumb-area pt-205 pb-210"
		style="background-image: url(<c:url value="/assets/user/img/bg/bgr.jpg"></c:url>)">
		<div class="container">
			<div class="breadcrumb-content text-center">
				<h2>Đăng nhập</h2>
				<ul>
					<li><a href="index.html">Trang chủ</a></li>
					<li>/</li>
					<li>Đăng nhập</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- login-area start -->
	<div class="register-area ptb-100">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12 col-12 col-lg-6 col-xl-6 ml-auto mr-auto">
					<div class="login">
						<div class="login-form-container">
							<div class="login-form">
								<form:form action="${pageContext.request.contextPath}/j_spring_security_check" method="POST"
									modelAttribute="user">
									<form:input type="email" path="email" placeholder="Email" />
									<form:input type="password" path="password"
										placeholder="Mật khẩu" />
									<div class="button-box">
										<div class="login-toggle-btn">
											<a href="<c:url value="/quen-mat-khau"></c:url>"><spring:message
													code="label.quenmk" />?</a>
										</div>
										<spring:message code="label.submit" var="labelSubmit"></spring:message>
										<button type="submit" class="default-btn floatright">${labelSubmit}</button>
									</div>
									<h1>${statusLogin}</h1>
								</form:form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>