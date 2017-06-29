<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="pageTitle" value="National Park Geek Top Parks"/>

<%@include file="common/header.jspf"%>

<c:forEach var="park" items="${topParksList.keySet()}">
	<c:out value="${park.parkName}" />
	<c:out value="${topParksList.get(park)}" /><br>
</c:forEach>

<%@include file="common/footer.jspf"%>