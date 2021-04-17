<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript" src="js/app.js"></script>
<link rel="stylesheet" href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Add Song</title>
</head>
<body>
	<div class = "container mt-5">
		<div class="d-flex justify-content-end">
			<a href="/dashboard" class="m-3">Back to Dashboard</a>
		</div>
    		<form:form action="/songs/new" method="post" modelAttribute="newSong">
    		<input type="hidden" name="_method" value="put">
	      		<p>
	      			<form:label path="title" class="form-label">Title:</form:label>
		      		<form:errors path="title" class="text-danger" />
		      		<form:input path="title" class="form-control"/>
	      		</p>
	      		<p>
	      			<form:label path="artist" class="form-label">Artist:</form:label>
		      		<form:errors path="artist" class="text-danger" />
		      		<form:input path="artist" class="form-control"/>
	      		</p>
	      		<p>
	      			<form:label path="rating" class="form-label">Rating (1 - 10):</form:label>
		      		<form:errors path="rating" class="text-danger" />
		      		<select name="rating">
					    <c:forEach var="rating" items="rating">
					        <option value="1">1</option>
					        <option value="2">2</option>
					        <option value="3">3</option>
					        <option value="4">4</option>
					        <option value="5">5</option>
					        <option value="6">6</option>
					        <option value="7">7</option>
					        <option value="8">8</option>
					        <option value="9">9</option>
					        <option value="10">10</option>
					    </c:forEach>
					</select>
	      		</p>
	      		<div class="d-flex justify-content-end">
		    		<input type="submit" value="Add Song" class="btn btn-sm btn-primary mt-3" />
	      		</div>
    		</form:form>
	</div>
</body>
</html>