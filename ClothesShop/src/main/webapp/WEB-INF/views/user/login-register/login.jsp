<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<title><spring:message code="label.titleHome5" /></title>
<body>

	<div style="height: 105px"></div>
	<div
		class="breadcrumb-area pt-205 breadcrumb-padding pb-210 background-banner"
		style="background-image: url(<c:url value='/assets/user/img/bg/bgr.jpg'></c:url>);">
		<div class="container-fluid">
			<div class="breadcrumb-content text-center">
				<h2 style="color: black;">
					<spring:message code="label.shopquanao" />
				</h2>
				<ul>
					<li><a href="<c:url value='/trang-chu'/>"
						style="color: black;"><spring:message code="label.trangchu" /></a></li>
					<li style="color: black;">/</li>
					<li style="color: black;"><spring:message
							code="label.dangnhap" /></li>
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
								<form:form id="loginForm"
									action="${pageContext.request.contextPath}/j_spring_security_check"
									method="POST" modelAttribute="user">
									<div class="form-row">
										<div class="form-group col-md-12">
											<form:input type="email" path="email" placeholder="Email"
												class="form-control" />
											<span class="form-message"></span>
										</div>
										<div class="form-group col-md-12">
											<form:input type="password" path="password"
												placeholder="Mật khẩu" class="form-control" />
											<span class="form-message"></span>
										</div>
										<div class="button-box">
											<%-- <c:if test="${pageContext.request.userPrincipal.name == null}">
												<span style="color: red;">Tài khoản không tồn tại</span>
												<div style="height: 10px"></div>
											</c:if> --%>
											<div class="">
												<a href="<c:url value="/quen-mat-khau"></c:url>"><spring:message
														code="label.quenmk" />?</a>
											</div>
											<spring:message code="label.submit" var="labelSubmit"></spring:message>
											<button type="submit" class="default-btn floatright">${labelSubmit}</button>
										</div>
									</div>
								</form:form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		document.addEventListener('DOMContentLoaded',
				function() {
					Validator({
						form : '#loginForm',
						formGroupSelector : '.form-group',
						errorSelector : '.form-message',
						rules : [
								Validator.isRequired('#email'),
								Validator.isEmail('#email',
										'Vui lòng nhập đúng mail!'),
								Validator.isRequired('#password'),
								Validator.minLength('#password', 4,
										'Mật khẩu phải nhiểu hơn 4 kí tự') ]
					});

				});
	</script>
</body>