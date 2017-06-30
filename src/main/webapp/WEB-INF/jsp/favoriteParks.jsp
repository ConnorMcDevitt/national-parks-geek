<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="pageTitle" value="National Park Geek Top Parks"/>

<%@include file="common/header.jspf"%>
<h3 class="center">Top Parks</h3>
<div class="compression centerauto">
<table class="table table-hover">
<thead>
<tr>
<th>#</th>
<th>Park</th>
<th>Votes</th>
</tr>
</thead>
<c:forEach var = "park" items = "${topParksList.keySet()}" varStatus = "loop">
<tr>
<th><c:out value="${loop.count}"/></th>
	<td><a href="<c:url value="/details/${park.parkCode}"/>"><c:out value="${park.parkName}" /></a></td>
	<td><c:out value="${topParksList.get(park)}" /></td>
	</tr>
</c:forEach>
</table>
</div>
<%@include file="common/footer.jspf"%>