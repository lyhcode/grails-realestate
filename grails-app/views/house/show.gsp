
<%@ page import="realestate.House" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'house.label', default: 'House')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-house" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-house" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list house">
			
				<g:if test="${houseInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="house.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${houseInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${houseInstance?.buildDate}">
				<li class="fieldcontain">
					<span id="buildDate-label" class="property-label"><g:message code="house.buildDate.label" default="Build Date" /></span>
					
						<span class="property-value" aria-labelledby="buildDate-label"><g:formatDate date="${houseInstance?.buildDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${houseInstance?.city}">
				<li class="fieldcontain">
					<span id="city-label" class="property-label"><g:message code="house.city.label" default="City" /></span>
					
						<span class="property-value" aria-labelledby="city-label"><g:fieldValue bean="${houseInstance}" field="city"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${houseInstance?.feet}">
				<li class="fieldcontain">
					<span id="feet-label" class="property-label"><g:message code="house.feet.label" default="Feet" /></span>
					
						<span class="property-value" aria-labelledby="feet-label"><g:fieldValue bean="${houseInstance}" field="feet"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${houseInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label"><g:message code="house.price.label" default="Price" /></span>
					
						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${houseInstance}" field="price"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${houseInstance?.region}">
				<li class="fieldcontain">
					<span id="region-label" class="property-label"><g:message code="house.region.label" default="Region" /></span>
					
						<span class="property-value" aria-labelledby="region-label"><g:fieldValue bean="${houseInstance}" field="region"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:houseInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${houseInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
