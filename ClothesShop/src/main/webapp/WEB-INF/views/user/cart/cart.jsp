<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><spring:message code="label.giohang" /></title>
</head>
<body>
	<style type="text/css">
table {
	counter-reset: rowNumber -1;
}

table tr {
	counter-increment: rowNumber;
}

table tr td:first-child::before {
	content: counter(rowNumber);
	min-width: 1em;
	margin-right: 0.5em;
}
</style>
	<div style="height: 105px"></div>
	<div class="breadcrumb-area pt-205 pb-210"
		style="background-image: url(<c:url value="/assets/user/img/bg/bgr.jpg"></c:url>)">
		<div class="container">
			<div class="breadcrumb-content text-center">
				<h2 style="color: black;">
					<spring:message code="label.giohang1" />
				</h2>
				<ul>
					<li><a href="index.html" style="color: black;"><spring:message
								code="label.trangchu" /></a></li>
					<li style="color: black;">/</li>
					<li style="color: black;"><spring:message
							code="label.giohang1" /></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- shopping-cart-area start -->
	<div class="cart-main-area pt-95 pb-100">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<h1 class="cart-heading">
						<spring:message code="label.giohang1" />
					</h1>
					<form action="#">
						<div class="table-content table-responsive">
							<table>
								<thead>
									<tr>
										<th><spring:message code="label.stt" /></th>
										<th><spring:message code="label.ha" /></th>
										<th><spring:message code="label.sanpham" /></th>
										<th><spring:message code="label.size" /></th>
										<th><spring:message code="label.mau" /></th>
										<th><spring:message code="label.gia" /></th>
										<th><spring:message code="label.soluong" /></th>
										<th><spring:message code="label.tongtien" /></th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="cart" items="${ Cart }">
										<tr>
											<td class="product-remove"></td>
											<td class="product-thumbnail"><c:forEach var="color"
													items="${ cart.value.product.colors }" varStatus="index">
													<c:if test="${ cart.value.color == color.color_code}">
														<c:forEach var="img" items="${ color.image }"
															varStatus="index">
															<c:if test="${index.first}">
																<a href="#"> <img style="width: 80px;"
																	src="<c:url value="/assets/user/img/product/${cart.value.product.id}/${img}"/>"
																	alt="">
																</a>
															</c:if>
														</c:forEach>
													</c:if>
												</c:forEach></td>
											<td class="product-name"><a
												href="<c:url value='/chi-tiet-san-pham/${cart.key}'></c:url>">${ cart.value.product.name }
											</a></td>
											<td class="product-name">${ cart.value.size }</td>
											<td class="product-remove">
												<div
													style="width: 30px; height: 30px; margin-left: 37px;border: 2px solid black; background: ${ cart.value.color }; -moz-border-radius: 60px; -webkit-border-radius: 60px; border-radius: 60px;"></div>
											</td>
											<td class="product-price-cart"><c:if
													test="${cart.value.product.sale !=0 }">
													<span style="text-decoration: line-through;"><fmt:formatNumber
															type="number" groupingUsed="true"
															value="${ cart.value.product.price }" /> ???</span>
													<span class="amount"> <fmt:formatNumber
															type="number" groupingUsed="true"
															value="${ cart.value.product.price * (100-cart.value.product.sale)/100}" />
														???
													</span>
												</c:if> <c:if test="${cart.value.product.sale ==0 }">
													<span class="amount"> <fmt:formatNumber
															type="number" groupingUsed="true"
															value="${ cart.value.product.price }" /> ???
													</span>
												</c:if></td>
											<td class="product-quantity"><input type="number"
												min="0" max="1000" placeholder="1"
												id="quantity-cart-${ cart.key }" size="16" type="text"
												value="${ cart.value.quantity }"></td>
											<td class="product-subtotal"><fmt:formatNumber
													type="number" groupingUsed="true"
													value="${ cart.value.totalPrice }" /> ???</td>
											<td class="product-remove"
												style="display: block; padding-top: 59px;"><a
												href="<c:url value="/DeleteCart/${ cart.key }"/>"><i
													class="fa-solid fa-trash" style="font-size: 20px"></i></a>
												<button type="button" data-id="${ cart.key }"
													class="edit-quatity-cart"
													style="border: none; background-color: white;'">
													<span><i class="fa-solid fa-pen-to-square"
														style="font-size: 20px"></i></span>
												</button></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="row">
							<div class="col-md-7 ml-auto">
								<div class="coupon-all">
									<p style="font-size: 18px;">
										<spring:message code="label.t1" /> <a
											href="<c:url value="/san-pham"></c:url>"
											style="font-weight: bold; font-size: 18px;"><spring:message code="label.t2" /></a>
									</p>
								</div>
							</div>
							<div class="col-md-5 ml-auto">
								<div class="cart-page-total">
									<c:if test="${ Cart.size()>0}">
										<h2><spring:message code="label.tong" /></h2>
										<ul>
											<li><spring:message code="label.tongtt" />:<span><fmt:formatNumber
														type="number" groupingUsed="true"
														value="${ TotalPriceCart }" /> ???</span></li>
										</ul>
										<a href="<c:url value="/thanh-toan"/>"><spring:message code="label.muahang" /></a>
									</c:if>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>