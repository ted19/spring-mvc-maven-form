<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<jsp:include page="fragments/header.jsp" />

<div class="container">

	<c:if test="${not empty msg}">
		<div class="alert alert-${alert} alert-dismissible fade show" role="alert">
			${msg}
			<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
	</c:if>

	<h1>User View</h1>

	<div class="p-2 mb-2 border border-dark border-1 rounded">
	    <div class="row">
	        <label for="staticID" class="col-sm-2 col-form-label fw-bold">ID</label>
	        <div class="col-sm-10">
	          <input type="text" readonly class="form-control-plaintext" id="staticID" value="${user.id}">
	        </div>
	    </div>
 		<hr class="my-2">
	    <div class="row">
	        <label for="staticName" class="col-sm-2 col-form-label fw-bold">Name</label>
	        <div class="col-sm-10">
	          <input type="text" readonly class="form-control-plaintext" id="staticName" value="${user.name}">
	        </div>
	    </div>
	 	<hr class="my-2">
	    <div class="row">
	        <label for="staticEmail" class="col-sm-2 col-form-label fw-bold">Email</label>
	        <div class="col-sm-10">
	          <input type="text" readonly class="form-control-plaintext" id="staticName" value="${user.email}">
	        </div>
	    </div>
	 	<hr class="my-2">	
	    <div class="row">
	        <label for="staticAddress" class="col-sm-2 col-form-label fw-bold">Address</label>
	        <div class="col-sm-10">
	          <input type="text" readonly class="form-control-plaintext" id="staticAddress" value="${user.address}">
	        </div>
	    </div>
	 	<hr class="my-2">
	    <div class="row">
	        <label for="staticFramework" class="col-sm-2 col-form-label fw-bold">Frameworks</label>
	        <div class="col-sm-10">
	          <input type="text" readonly class="form-control-plaintext" id="staticFramework" value="${user.framework}">
	        </div>
	    </div>
		<hr class="my-2">
	    <div class="row">
	        <label for="staticSex" class="col-sm-2 col-form-label fw-bold">Sex</label>
	        <div class="col-sm-10">
	          <input type="text" readonly class="form-control-plaintext" id="staticSex" value="${user.sex}">
	        </div>
	    </div>
		<hr class="my-2">
	    <div class="row">
	        <label for="staticNumber" class="col-sm-2 col-form-label fw-bold">Number</label>
	        <div class="col-sm-10">
	          <input type="text" readonly class="form-control-plaintext" id="staticNumber" value="${user.number}">
	        </div>
	    </div>
		<hr class="my-2">
	    <div class="row">
	        <label for="staticCountry" class="col-sm-2 col-form-label fw-bold">Country</label>
	        <div class="col-sm-10">
	          <input type="text" readonly class="form-control-plaintext" id="staticCountry" value="${user.country}">
	        </div>
	    </div>
		<hr class="my-2">
	    <div class="row">
	        <label for="staticSkill" class="col-sm-2 col-form-label fw-bold">Skill</label>
	        <div class="col-sm-10">
	          <input type="text" readonly class="form-control-plaintext" id="staticSkill" value="${user.skill}">
	        </div>
	    </div>
	</div>
    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
        <a class="btn btn-dark" href="/" role="button">Back To Home</a>
    </div>

</div>

<jsp:include page="fragments/footer.jsp" />

</body>
</html>