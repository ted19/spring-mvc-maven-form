<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<jsp:include page="fragments/header.jsp" />
<body>
	<div class="container">
        <c:if test="${not empty msg}">
            <div class="alert alert-${alert} alert-dismissible fade show" role="alert">
                ${msg}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>
		<h1>All Users</h1>
		<table class="table table-striped table-dark">
			<thead>
				<tr>
					<th>#</th>
					<th>Name</th>
					<th>Email</th>
					<th>Framework</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="user" items="${users}">
			    <tr>
					<td>${user.id}</td>
					<td>${user.name}</td>
					<td>${user.email}</td>
					<td>
	                    <c:forEach var="framework" items="${user.framework}" varStatus="loop">
						    ${framework}
	    				    <c:if test="${not loop.last}">,</c:if>
					    </c:forEach>
	                </td>
					<td>
					  <spring:url value="/users/${user.id}" var="userUrl" />
					  <spring:url value="/users/${user.id}/update" var="updateUrl" />
					  <spring:url value="/users/${user.id}/delete" var="deleteUrl" />
					  <button class="btn btn-info btn-sm" onclick="location.href='${userUrl}'">View</button>
					  <button class="btn btn-primary btn-sm" onclick="location.href='${updateUrl}'">Update</button>
					  <button class="btn btn-danger btn-sm" onclick="this.disabled=true;post(this, '${deleteUrl}')">Delete</button>
	                </td>
			    </tr>
			</c:forEach>
			</tbody>
		</table>
        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
            <a class="btn btn-success" href="/users/add" role="button">Add User</a>
		</div>
	</div>
	<jsp:include page="fragments/footer.jsp" />
</body>
</html>