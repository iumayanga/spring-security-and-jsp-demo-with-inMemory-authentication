<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>
	<title>Login Page</title>
	
	<link rel="stylesheet" type="text/css" href="css/demo.css">
</head>

<body>
	<h3>Login Page</h3>
	
	<form:form action="${pageContext.request.contextPath}/authenticateTheUser" method="POST">
		
		<!-- Check for login error -->
		<c:if test="${param.error != null}">
			<i class="failed">Sorry! You entered invalid username/ password.</i>
		</c:if>
		
		<p>Username: <input type="text" name="username"></p>
		<p>Password: <input type="password" name="password"></p>
		<input type="submit" value="Login">
		
	</form:form>
</body>

</html>

<!--
	Spring MVC form tag 
	form:form adds security token(CSRF Token) in form submission
	(If don't use form:form we have to manually add that token)
		<form action="..." method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		</form>
	(If don't add the token it throws exception)
	
	
	
	Tokens are generated by spring security filters
	At the starting of user-session(time between login & logout) these tokens are send to the browser,
	Browser send request with this token & session cookie
	within that session; requests are validated using that token & session cookie(before processing the requests)
		
	
	
	Help to protect from CSRF(Cross-Site-Request-Forgery)
	In this attacker-web-site tricks us to execute actions in our web-application(currently logged-in)
	EX:
		-when logged-into a banking application,
		tricks us to send money to another person.
		-when logged-into an e-commerce application,
		tricks us to purchase unwanted items.
-->