<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="pageTitle" value="${park.parkName} Details"/>

<%@include file="common/header.jspf"%>

<c:url var="imgUrl" value="/img/parks/${park.parkCode}.jpg" />
<div>
	<img src="${imgUrl}" />
</div>
<div>
	<h3 class="inline"><c:out value="${park.parkName}" /></h3>	<h5 class="inline"><i><c:out value="${park.state}" /></i></h5>
	<p><c:out value="${park.parkDescription}" /></p>
</div>
<div class="media">
<div class="table-width media-left">
	<table class="table table-hover">
		<tr>
			<th>Acreage</th>
			<td><fmt:formatNumber type="number" value="${park.acreage}" /> acres</td>
		</tr>
		<tr>
			<th>Elevation in Feet</th>
			<td><fmt:formatNumber type="number" value="${park.elevationInFeet}" /> ft.</td>
		</tr>
		<tr>
			<th>Miles of Trail</th>
			<td><fmt:formatNumber type="number" value="${park.milesOfTrail}" /> mi.</td>
		</tr>
		<tr>
			<th>Number of Campsites</th>
			<td><fmt:formatNumber type="number" value="${park.numberOfCampsites}" /></td>
		</tr>
		<tr>
			<th>Climate</th>
			<td><c:out value="${park.climate}" /></td>
		</tr>
		<tr>
			<th>Year Founded</th>
			<td><c:out value="${park.yearFounded}"/></td>
		</tr>
		<tr>
			<th>Annual Visitor Count</th>
			<td><fmt:formatNumber type="number" value="${park.annualVisitorCount}" /></td>
		</tr>
		<tr>
			<th>Number of Animal Species</th>
			<td><fmt:formatNumber type="number" value="${park.numberOfAnimalSpecies}" /></td>
		</tr>
		<tr>
			<th>Entry Fee</th>
			<td><fmt:formatNumber type="currency" value="${park.entryFee}" /></td>
		</tr>
	</table>
</div>
<div class="media-body quote">
	<br><br><br><br><h3 id="quote-font">"<c:out value="${park.inspirationalQuote}" />"</h3> <h6> - <c:out value="${park.inspirationalQuoteSource}" /></h6></p>
</div>
</div>
<c:set var="weather" value="${weatherList[0]}" />
<c:url var="weatherImg" value="/img/weather/${weather.forecast}.png" />
<div>
	<h3>Today</h3>
	<img src="${weatherImg}" />
</div>
<c:forEach varStatus="loop" var="weather" items="${weatherList}" begin="1">
	<c:set var="weather" value="${weatherList[loop.index]}" />
	<c:url var="weatherImg" value="/img/weather/${weather.forecast}.png" />
	<div>
		<img src="${weatherImg}" />
	</div>
</c:forEach>

<%@include file="common/footer.jspf"%>