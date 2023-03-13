<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<jsp:include page="fragments/header.jsp" />

<div class="container">

	<c:choose>
		<c:when test="${userForm['new']}">
			<h1>Add User</h1>
		</c:when>
		<c:otherwise>
			<h1>Update User</h1>
		</c:otherwise>
	</c:choose>

	<form:form method="post" modelAttribute="userForm" action="/users">
		<div class="p-2 mb-2 border border-dark border-1 rounded">
		<form:hidden path="id" />

		<c:if test="${'0' eq userForm['new']}">
        <spring:bind path="id">
            <div class="mb-3 row">
                <label for="name" class="col-sm-2 col-form-label fw-bold">ID</label>
                <div class="col-sm-10">
                	<fieldset disabled>
                    <form:input path="id" type="text" id="id"
                        class="form-control"/>
                    </fieldset>
                </div>
            </div>
        </spring:bind>
       	</c:if>
        	
        <spring:bind path="name">
            <div class="mb-3 row">
                <label for="name" class="col-sm-2 col-form-label fw-bold">Name</label>
                <div class="col-sm-10">
                    <form:input path="name" type="text" id="name"
                        class="form-control ${status.error ? 'is-invalid' : ''}"
                        aria-describedby="validationNameFeedback" />
                    <form:errors path="name" id="validationNameFeedback" class="invalid-feedback" />
                </div>
            </div>
        </spring:bind>

        <spring:bind path="email">
            <div class="mb-3 row">
                <label for="email" class="col-sm-2 col-form-label fw-bold">Email</label>
                <div class="col-sm-10">
                    <form:input path="email" type="text" id="email"
                        class="form-control ${status.error ? 'is-invalid' : ''}"
                        aria-describedby="validationEmailFeedback" />
                    <form:errors path="email" id="validationEmailFeedback" class="invalid-feedback" />
                </div>
            </div>
        </spring:bind>

        <spring:bind path="password">
            <div class="mb-3 row">
                <label for="password" class="col-sm-2 col-form-label fw-bold">Password</label>
                <div class="col-sm-10">
                    <form:password path="password" id="password"
                        class="form-control ${status.error ? 'is-invalid' : ''}"
                        aria-describedby="validationPasswordFeedback" />
                    <form:errors path="password" id="validationPasswordFeedback" class="invalid-feedback" />
                </div>
            </div>
        </spring:bind>

        <spring:bind path="confirmPassword">
            <div class="mb-3 row">
                <label for="confirmPassword" class="col-sm-2 col-form-label fw-bold">Confirm Password</label>
                <div class="col-sm-10">
                    <form:password path="confirmPassword" id="confirmPassword"
                        class="form-control ${status.error ? 'is-invalid' : ''}"
                        aria-describedby="validationConfirmPasswordFeedback" />
                    <form:errors path="confirmPassword" id="validationConfirmPasswordFeedback" class="invalid-feedback" />
                </div>
            </div>
        </spring:bind>

        <spring:bind path="address">
            <div class="mb-3 row">
                <label for="address" class="col-sm-2 col-form-label fw-bold">Address</label>
                <div class="col-sm-10">
                    <form:textarea path="address" rows="5" id="address"
                        class="form-control ${status.error ? 'is-invalid' : ''}"
                        aria-describedby="validationAddressFeedback" />
                    <form:errors path="address" id="validationAddressFeedback" class="invalid-feedback" />
                </div>
            </div>
        </spring:bind>

        <spring:bind path="framework">
            <div class="mb-3 row">
                <label for="framework" class="col-sm-2 col-form-label fw-bold">Frameworks</label>
                <div class="col-sm-10">
                    <form:checkboxes path="framework" class="form-check-input ${status.error ? 'is-invalid' : ''}"
                        items="${frameworkList}" element="div class='form-check form-check-inline'"
                        aria-describedby="validationFrameworkFeedback" />
                    <form:errors path="framework" id="validationFrameworkFeedback"
                        class="invalid-feedback-force-display" element="div" />
                </div>
			</div>
		</spring:bind>

		<spring:bind path="sex">
		    <div class="mb-3 row">
                <label for="sex" class="col-sm-2 col-form-label fw-bold">Sex</label>
                <div class="col-sm-10">
                    <div class="form-check form-check-inline">
                      <form:radiobutton path="sex" value="M" id="sexM"
                        class="form-check-input ${status.error ? 'is-invalid' : ''}"
                        aria-describedby="validationSexFeedback" />
                      <label class="form-check-label" for="sexM">Male</label>
                    </div>
                    <div class="form-check form-check-inline">
                      <form:radiobutton path="sex" value="F" id="sexF"
                        class="form-check-input ${status.error ? 'is-invalid' : ''}"
                        aria-describedby="validationSexFeedback" />
                      <label class="form-check-label" for="sexF">Female</label>
                    </div>
                    <form:errors path="sex" id="validationSexFeedback"
                        class="invalid-feedback-force-display" element="div" />
                </div>
            </div>
		</spring:bind>

        <spring:bind path="number">
		  <div class="mb-3 row">
			<label for="number" class="col-sm-2 col-form-label fw-bold">Number</label>
			<div class="col-sm-10">
				<form:radiobuttons path="number" items="${numberList}"
				      class="form-check-input ${status.error ? 'is-invalid' : ''}"
                      element="div class='form-check form-check-inline'"
                      aria-describedby="validationNumberFeedback" />
				<form:errors path="number" id="validationNumberFeedback"
				    class="invalid-feedback-force-display" element="div" />
			</div>
		  </div>
		</spring:bind>

        <spring:bind path="country">
		  <div class="mb-3 row">
			<label for="country" class="col-sm-2 col-form-label fw-bold">Country</label>
			<div class="col-sm-10">
				<form:select path="country" id="country" class="form-select ${status.error ? 'is-invalid' : ''}"
				    aria-describedby="validationCountryFeedback" >
					<form:option value="NONE" label="-- Select --" />
					<form:options items="${countryList}" />
				</form:select>
				<form:errors path="country" id="validationCountryFeedback" class="invalid-feedback" />
			</div>
		  </div>
		</spring:bind>

        <spring:bind path="skill">
		  <div class="mb-3 row">
			<label for="skill" class="col-sm-2 col-form-label fw-bold">Skills</label>
			<div class="col-sm-10">
				<form:select path="skill" items="${javaSkillList}" multiple="true" size="5"
				    aria-describedby="validationSkillFeedback"
				    class="form-select ${status.error ? 'is-invalid' : ''}" />
				<form:errors path="skill" id="validationSkillFeedback" class="invalid-feedback" />
			</div>
		  </div>
		</spring:bind>

        <spring:bind path="acceptTOS">
            <div class="mb-3 row">
                <div class="col-12">
                    <div class="form-check">
                        <form:checkbox path="acceptTOS" id="acceptTOS"
                            class="form-check-input ${status.error ? 'is-invalid' : ''}"
                            aria-describedby="validationAcceptTosFeedback" />
                        <label for="acceptTOS" class="form-check-label">Agree to terms and conditions</label>
                        <form:errors path="acceptTOS" id="validationAcceptTosFeedback" class="invalid-feedback" />
                    </div>
                </div>
            </div>
        </spring:bind>
	</div>
		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			<c:choose>
			  <c:when test="${userForm['new']}">
			     <button type="submit" class="btn btn-success">Add</button>
			  </c:when>
			  <c:otherwise>
			     <button type="submit" class="btn btn-success">Update</button>
			  </c:otherwise>
			</c:choose>
			<a class="btn btn-dark" href="/" role="button">Back To Home</a>
		</div>

	</form:form>
</div>

<jsp:include page="fragments/footer.jsp" />

</body>
</html>