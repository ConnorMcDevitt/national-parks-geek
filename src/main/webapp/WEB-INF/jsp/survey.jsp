<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="pageTitle" value="${park.name} Survey" />

<%@include file="common/header.jspf"%>

<div class="survey">
	<c:url var="actionUrl" value="/survey" />
	<form:form method="POST" action="${actionUrl}" modelAttribute="survey">
		<label for="parkCode">Select Favorite Park</label>
		<select name="parkCode">
			<c:forEach var="park" items="${parksList}">
				<option value="${park.parkCode}">${park.parkName}</option>
			</c:forEach>
		</select>
		<br>
		<br>
		<label for="emailAddress">Email Address</label>
		<form:input path="emailAddress" placeholder="example@example.com" />
		<form:errors path="emailAddress" class="cssError"/>
		<br>
		<br>
		<label for="state">State of Residence</label>
		<select name="state">
			<option value="AL">Alabama</option>
			<option value="AK">Alaska</option>
			<option value="AZ">Arizona</option>
			<option value="AR">Arkansas</option>
			<option value="CA">California</option>
			<option value="CO">Colorado</option>
			<option value="CT">Connecticut</option>
			<option value="DE">Delaware</option>
			<option value="DC">District Of Columbia</option>
			<option value="FL">Florida</option>
			<option value="GA">Georgia</option>
			<option value="HI">Hawaii</option>
			<option value="ID">Idaho</option>
			<option value="IL">Illinois</option>
			<option value="IN">Indiana</option>
			<option value="IA">Iowa</option>
			<option value="KS">Kansas</option>
			<option value="KY">Kentucky</option>
			<option value="LA">Louisiana</option>
			<option value="ME">Maine</option>
			<option value="MD">Maryland</option>
			<option value="MA">Massachusetts</option>
			<option value="MI">Michigan</option>
			<option value="MN">Minnesota</option>
			<option value="MS">Mississippi</option>
			<option value="MO">Missouri</option>
			<option value="MT">Montana</option>
			<option value="NE">Nebraska</option>
			<option value="NV">Nevada</option>
			<option value="NH">New Hampshire</option>
			<option value="NJ">New Jersey</option>
			<option value="NM">New Mexico</option>
			<option value="NY">New York</option>
			<option value="NC">North Carolina</option>
			<option value="ND">North Dakota</option>
			<option value="OH">Ohio</option>
			<option value="OK">Oklahoma</option>
			<option value="OR">Oregon</option>
			<option value="PA">Pennsylvania</option>
			<option value="RI">Rhode Island</option>
			<option value="SC">South Carolina</option>
			<option value="SD">South Dakota</option>
			<option value="TN">Tennessee</option>
			<option value="TX">Texas</option>
			<option value="UT">Utah</option>
			<option value="VT">Vermont</option>
			<option value="VA">Virginia</option>
			<option value="WA">Washington</option>
			<option value="WV">West Virginia</option>
			<option value="WI">Wisconsin</option>
			<option value="WY">Wyoming</option>
		</select>
		<br>
		<br>
		<label for="activityLevel">Activity Level</label>
		<div class="option"><input type="radio" name="activityLevel" value="inactive" checked> Inactive</div>
		<div class="option"><input type="radio" name="activityLevel" value="sedentary"> Sedentary</div>
		<div class="option"><input type="radio" name="activityLevel" value="active"> Active</div>
		<div class="option"><input type="radio" name="activityLevel" value="xactive"> Extremely Active</div>
		<br>
		<br>
		
		<input type="submit" name="submit" class="btn btn-success" value="Submit Survey"/>
	</form:form>
</div>

<%@include file="common/footer.jspf"%>