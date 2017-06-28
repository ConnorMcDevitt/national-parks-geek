<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="pageTitle" value="National Park Geek Home Page"/>

<c:forEach var="park" items="${parksList}">
	<c:url var="imgUrl" value="/img/${park.parkcode}.jpg" />
	<div>
		<img src="${imgUrl}" />
		<h3>${park.parkName}</h3>
		<p>${park.parkDescription}</p>
	</div>
</c:forEach>

<%@include file="common/header.jspf"%>

<%@include file="common/footer.jspf"%>