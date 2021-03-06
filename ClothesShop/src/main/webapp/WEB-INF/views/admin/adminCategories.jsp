<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<title>Admin - Loại sản phẩm</title>
<body>
	<div class="container-fluid">
		<div class="card mb-3">
			<div class="card-header">
				<i class="fas fa-table"></i> Loại sản phẩm
				<button type="button" class="btn btn-outline-dark add-btn">
					<a href="<c:url value="/quan-tri/loai-sp/new" />"> <i
						class="fa-solid fa-circle-plus"></i>&nbsp;Thêm
					</a>
				</button>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th style="text-align: center;">STT</th>
								<th style="text-align: center;">Tên loại</th>
								<th style="text-align: center;">Mô tả</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${listCategory}" varStatus="loop">
								<tr>
									<td style="text-align: center;">${loop.index+1}</td>
									<td style="text-align: center;">${item.name}</td>
									<td style="text-align: center;">${item.decriptions}</td>
									<td style="text-align: center;"><a
										href="<c:url value="/loai-sp/delete?id=${item.id}" />"><i
											class="fa-solid fa-trash"></i></a>&emsp; <a
										href="<c:url value="/quan-tri/loai-sp/edit?id=${item.id}" />"><i
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