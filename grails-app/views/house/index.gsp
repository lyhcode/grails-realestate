
<%@ page import="realestate.House" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'house.label', default: 'House')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-house" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-house" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="address" title="${message(code: 'house.address.label', default: 'Address')}" />
					
						<g:sortableColumn property="buildDate" title="${message(code: 'house.buildDate.label', default: 'Build Date')}" />
					
						<g:sortableColumn property="city" title="${message(code: 'house.city.label', default: 'City')}" />
					
						<g:sortableColumn property="feet" title="${message(code: 'house.feet.label', default: 'Feet')}" />
					
						<g:sortableColumn property="price" title="${message(code: 'house.price.label', default: 'Price')}" />
					
						<g:sortableColumn property="region" title="${message(code: 'house.region.label', default: 'Region')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${houseInstanceList}" status="i" var="houseInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${houseInstance.id}">${fieldValue(bean: houseInstance, field: "address")}</g:link></td>
					
						<td><g:formatDate date="${houseInstance.buildDate}" /></td>
					
						<td>${fieldValue(bean: houseInstance, field: "city")}</td>
					
						<td>${fieldValue(bean: houseInstance, field: "feet")}</td>
					
						<td>${fieldValue(bean: houseInstance, field: "price")}</td>
					
						<td>${fieldValue(bean: houseInstance, field: "region")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${houseInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
