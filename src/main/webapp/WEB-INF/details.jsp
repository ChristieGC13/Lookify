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
<title>Details</title>
</head>
<body>
	<div class = "container mt-5">
		<div class="d-flex justify-content-end">
			<a href="/dashboard" class="m-3">Back to Dashboard</a>
		</div>
    		<h4 class="m-3">Title:   <c:out value="${song.title}"/> </h4>
      		<h4 class="m-4">Artist:   <c:out value="${song.artist}"/> </h4>
      		<h4 class="m-4">Rating:   <c:out value="${song.rating}"/> </h4>
      		<div class="d-flex justify-content-end">
	    		<form action="/songs/${song.id}" method="post">
	    			<input type="hidden" name="_method" value="delete">
	    			<input type="submit" value="Delete">
				</form>
      		</div>
	</div>
</body>
</html>