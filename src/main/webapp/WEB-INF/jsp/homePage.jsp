<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="pageTitle" value="National Park Geek Home Page"/>

<c:forEach var="park" items="${parksList}">

	<c:url var="imgUrl" value="/img/parks/${park.parkCode}.jpg" />
	<c:url var="detailsUrl" value="/details/${park.parkCode}" />
	<div class="media">
		<div class="media-left">
			<img src="${imgUrl}" />
		</div>
		<div class="media-body">
		<h3><c:out value="${park.parkName}" /></h3>
		<p><c:out value="${park.parkDescription}" /></p>
		<a href="${detailsUrl}"><div class="btn btn-success">Park Details</div></a>
		</div>
	</div>
</c:forEach>

<%@include file="common/header.jspf"%>

<%@include file="common/footer.jspf"%>