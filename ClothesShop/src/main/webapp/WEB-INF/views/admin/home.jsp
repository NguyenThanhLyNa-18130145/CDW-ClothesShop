<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<title>Admin - Trang chủ - sản phẩm</title>
<body>
	<div class="container-fluid">
		<!-- DataTables Example -->
		<div class="card mb-3">
			<div class="card-header">
				<i class="fas fa-table"></i> Sản phẩm
				<button type="button" class="btn btn-outline-dark add-btn">
					<a href="<c:url value="/quan-tri/san-pham/new" />"> <i class="fa-solid fa-circle-plus"></i>&nbsp;Thêm
					</a>
				</button>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>#</th>
								<th>Loại sản phẩm</th>
								<th>Tên</th>
								<th>Kích cỡ</th>
								<th>Giá</th>
								<th>Khuyến mãi</th>
								<th>Sản phẩm nổi bật</th>
								<th>Sản phẩm mới</th>
								<th>Mô tả</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${listProduct}">
								<tr>
									<td>${item.id}</td>
									<td>${item.category.name}</td>
									<td>${item.name}</td>
									<td>${item.sizes}</td>
									<td>${item.price}</td>
									<td>${item.sale}</td>
									<td>${item.featured_products}</td>
									<td>${item.new_product}</td>
									<td>${item.decriptions}</td>
									<td><a href="<c:url value="/san-pham/delete?id=${item.id}" />"><i
											class="fa-solid fa-trash"></i></a>&emsp; <a
										href="<c:url value="quan-tri/san-pham/edit?id=${item.id}" />"><i
											class="fa-solid fa-pen-to-square"></i></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="card-footer small text-muted">Updated yesterday at
				11:59 PM</div>
		</div>
	</div>
</body>