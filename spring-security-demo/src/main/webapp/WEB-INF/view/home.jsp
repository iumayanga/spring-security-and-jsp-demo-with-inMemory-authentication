<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<html>

<head>
	<title>Home Page</title>
</head>

<body>
	<h1>Home Page</h1>
	<hr>
	
	<p>Hello!</p>
	<hr>
	
	<!-- Username & Role -->
	<p>
		User: <security:authentication property="principal.username"/>
		<br><br>
		Role (s): <security:authentication property="principal.authorities"/>
	</p>
	<hr>
	
	
	
	<!-- 
		<p>
			<a href="${pageContext.request.contextPath}/leaders">Meeting</a>
			(Managers)
		</p>
		<p>
			<a href="${pageContext.request.contextPath}/systems">Meeting</a>
			(Admins)
		</p>
	-->
	<security:authorize access="hasRole('MANAGER')">
		<p>
			<a href="${pageContext.request.contextPath}/leaders">Meeting</a>
			(Managers)
		</p>
	</security:authorize>
	<security:authorize access="hasRole('ADMIN')">
		<p>
			<a href="${pageContext.request.contextPath}/systems">Meeting</a>
			(Admins)
		</p>
	</security:authorize>
	
	
	
	<hr>
	
	<form:form action="${pageContext.request.contextPath}/logout" method="POST">
		<input type="submit" value="Logout">
	</form:form>
</body>

</html>

<!-- Spring Security JSP Tag Library -->