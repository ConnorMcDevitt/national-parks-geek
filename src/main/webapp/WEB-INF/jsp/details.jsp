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
<div class="weather">
<c:set var="weather" value="${weatherList[0]}" />
<c:url var="weatherImg" value="/img/weather/${weather.forecast}.png" />
<c:choose>
	<c:when test="${isCelsius}">
		<c:set var="highTemp" value="${(weather.high - 32) / 1.8}" />
		<c:set var="lowTemp" value="${(weather.low - 32) / 1.8}" />
		<c:set var="tempScale" value="°C" />
	</c:when>
	<c:otherwise>
		<c:set var="highTemp" value="${weather.high}" />
		<c:set var="lowTemp" value="${weather.low}" />
		<c:set var="tempScale" value="°F" />

	</c:otherwise>
</c:choose>
<c:choose>
	<c:when test="${weather.forecast == 'snow'}">
		<c:set var="weatherMessage" value="Be sure to pack snow shoes!" />
	</c:when>
	<c:when test="${weather.forecast == 'rain'}">
		<c:set var="weatherMessage" value="Be sure to pack rain gear and wear waterproof shoes!" />
	</c:when>
	<c:when test="${weather.forecast == 'thunderstorms'}">
		<c:set var="weatherMessage" value="Be sure to seek shelter and avoid hiking on exposed ridges!" />
	</c:when>
	<c:when test="${weather.forecast == 'sunny'}">
		<c:set var="weatherMessage" value="Be sure to bring sunblock!" />
	</c:when>
	<c:otherwise>
		<c:set var="weatherMessage" value="" />
	</c:otherwise>
</c:choose>
<c:choose>
	<c:when test="${weather.high > 75}">
		<c:set var="tempMessage" value="Bring an extra gallon of water." />
	</c:when>
	<c:when test="${weather.low < 20}">
		<c:set var="tempMessage" value="Be aware of dangerous, frigid temperatures." />
	</c:when>
	<c:when test="${(weather.high - weather.low) > 20}">
		<c:set var="tempMessage" value="Wear breathable layers." />
	</c:when>
	<c:when test="${weather.high > 75 && (weather.high - weather.low) > 20}">
		<c:set var="tempMessage" value="Bring an extra gallon of water and wear breathable layers." />
	</c:when>
	<c:when test="${weather.low < 20 && (weather.high - weather.low) > 20}">
		<c:set var="tempMessage" value="Be aware of dangerous, frigid temperatures and wear breathable layers." />
	</c:when>
	<c:when test="${weather.low < 20 && weather.high > 75}">
		<c:set var="tempMessage" value="The weather sucks, prepare for anything." />
	</c:when>
	<c:otherwise>
		<c:set var="tempMessage" value="" />
	</c:otherwise>
</c:choose>
<c:url var="actionUrl" value="/details/${park.parkCode}"/>
<div class="tempScale">
<c:choose>	
	<c:when test="${isCelsius}">
		<c:set var="isSelected" value="selected" />
	</c:when>
	<c:otherwise>
		<c:set var="isSelected" value="" />
	</c:otherwise>
</c:choose>
<form method="POST" action="${actionUrl}">
	<select name="isCelsius">
		<option value="false" selected>Fahrenheit</option>
		<option value="true" ${isSelected}>Celsius</option>
	</select>
	<input type="submit" name="submit" class="btn btn-success" value="Go"/>
</form>
</div>
<div class="today">
	<h3>Today</h3>
	<img src="${weatherImg}" />
	<h7>High: <fmt:formatNumber maxFractionDigits="0" value="${highTemp}" /><c:out value="${tempScale}" /></h7> | <h7>Low: <fmt:formatNumber maxFractionDigits="0" value="${lowTemp}" /><c:out value="${tempScale}" /></h7>
	<p><c:out value="${weatherMessage}" /> <c:out value="${tempMessage}" /></p>
</div>
<c:forEach varStatus="loop" var="weather" items="${weatherList}" begin="1">
	<c:set var="weather" value="${weatherList[loop.index]}" />
		<c:choose>
		<c:when test="${isCelsius}">
			<c:set var="highTemp" value="${(weather.high - 32) / 1.8}" />
			<c:set var="lowTemp" value="${(weather.low - 32) / 1.8}" />
			<c:set var="tempScale" value="°C" />
		</c:when>
		<c:otherwise>
			<c:set var="highTemp" value="${weather.high}" />
			<c:set var="lowTemp" value="${weather.low}" />
			<c:set var="tempScale" value="°F" />
		</c:otherwise>
	</c:choose>
	<c:url var="weatherImg" value="/img/weather/${weather.forecast}.png" />
	<div class="forecast">
		<img src="${weatherImg}" />
		<h7>High: <fmt:formatNumber maxFractionDigits="0" value="${highTemp}" /><c:out value="${tempScale}" /></h7><br>
		<h7>Low: <fmt:formatNumber maxFractionDigits="0" value="${lowTemp}" /><c:out value="${tempScale}" /></h7>
	</div>
</c:forEach>
</div>

<%@include file="common/footer.jspf"%>