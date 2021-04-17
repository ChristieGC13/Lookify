<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript" src="js/app.js"></script>
<link rel="stylesheet" href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<meta charset="UTF-8">
<title>Search</title>
</head>
<body>	
	<div class = "container d-flex justify-content-around flex-column">
		<nav class="navbar navbar-light bg-light justify-content-between">
	  		<p>Songs by artist: <c:out value="${song.artist}"/></p>
	  		<div class="d-flex">
	  		<form class="form-inline mr-3">
	    		<input class="form-control mr-sm-2" type="search" placeholder= "${song.artist}" aria-label="Search">
	    		<button class="btn btn-outline-success my-2 my-sm-0" type="submit">New Search</button>
	  		</form>
			<a href="/dashboard" class="ml-1">Dashboard</a>
	  		</div>
		</nav>
		<table class=" mt-5 table table-striped">
			<thead>
				<tr>
					<td>Name</td>
					<td>Rating</td>
					<td>Action</td>
				</tr>
			</thead>
  			<c:forEach items="${allSongs}" var="song">
				<tr>
					<td>${song.title}</td>
					<td>${song.rating}</td>
					<td> 
						<form action="/songs/${song.id}" method="post">
			    			<input type="hidden" name="_method" value="delete">
			    			<input type="submit" value="Delete">
						</form>
					</td>
				</tr>
  			</c:forEach>
		</table>
	</div>
</body>
</html>