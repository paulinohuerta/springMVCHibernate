<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
	<title><spring:message code="page.personform.title"/></title>
	<style type="text/css">
		.tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}
		.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
		.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
		.tg .tg-4eph{background-color:#f9f9f9}
	</style>
</head>
<body>
<h1>
    <spring:message code="page.person.head"/>
</h1>

<c:url var="addAction" value="/person/add" ></c:url>

<form:form action="${addAction}" commandName="person">
  <fieldset>
       <legend><spring:message code="form.name"/></legend>
       <table>
	<c:if test="${!empty person.name}">
	<tr>
		<td>
			<form:label path="id">
				<spring:message text="ID"/>
			</form:label>
		</td>
		<td>
			<form:input path="id" readonly="true" size="8"  disabled="true" />
			<form:hidden path="id" />
		</td> 
	</tr>
	</c:if>
	<tr>
		<td>
                        <label for="name"><spring:message code="label.personName" text="default text" />:</label>
                        <form:input id="name" path="name" cssErrorClass="error"/>
                        <form:errors path="name" cssClass="error"/>
		</td>
	</tr>
	<tr>
		<td colspan="2">
                 <label for="country"><spring:message code="label.pais" text="default text" />: </label>
                 <form:input id="country" path="country" cssErrorClass="error"/>
                 <form:errors path="country" cssClass="error"/>
                 <p>
		 <input id="reset" type="reset" tabindex="4" 
                    value="<spring:message code="button.reset"/>"/>
	
                 <c:if test="${!empty person.name}">
				<input id="submitE" type="submit" tabindex="5"
				 value="<spring:message code="button.edit"/>" />
		 </c:if>
		 <c:if test="${empty person.name}">
				<input id="submitA" type="submit" tabindex="5"
				value="<spring:message code="button.add"/>" />
		 </c:if>
                 </p>
		</td>
	</tr>
</table>	
</fieldset>
</form:form>
<br>
<h3>Persons List</h3>
<c:if test="${!empty listPersons}">
	<table class="tg">
	<tr>
		<th width="80">Person ID</th>
		<th width="120">Person Name</th>
		<th width="120">Person Country</th>
		<th width="60">Edit</th>
		<th width="60">Delete</th>
	</tr>
	<c:forEach items="${listPersons}" var="person">
		<tr>
			<td>${person.id}</td>
			<td>${person.name}</td>
			<td>${person.country}</td>
			<td><a href="<c:url value='/edit/${person.id}' />" >Edit</a></td>
			<td><a href="<c:url value='/remove/${person.id}' />" >Delete</a></td>
		</tr>
	</c:forEach>
	</table>
</c:if>
</body>
</html>
