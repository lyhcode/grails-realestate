<%@ page import="realestate.House" %>



<div class="fieldcontain ${hasErrors(bean: houseInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="house.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address" required="" value="${houseInstance?.address}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: houseInstance, field: 'buildDate', 'error')} required">
	<label for="buildDate">
		<g:message code="house.buildDate.label" default="Build Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="buildDate" precision="day"  value="${houseInstance?.buildDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: houseInstance, field: 'city', 'error')} required">
	<label for="city">
		<g:message code="house.city.label" default="City" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="city" required="" value="${houseInstance?.city}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: houseInstance, field: 'feet', 'error')} required">
	<label for="feet">
		<g:message code="house.feet.label" default="Feet" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="feet" value="${fieldValue(bean: houseInstance, field: 'feet')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: houseInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="house.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="price" type="number" value="${houseInstance.price}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: houseInstance, field: 'region', 'error')} required">
	<label for="region">
		<g:message code="house.region.label" default="Region" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="region" required="" value="${houseInstance?.region}"/>

</div>

