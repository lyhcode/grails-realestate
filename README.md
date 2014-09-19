% Groovy on Grails
% lyhcode
% TWJUG Sep 20, 2014

### Hello, World.

<!-- [http://goo.gl/y5hZvo](http://goo.gl/y5hZvo) -->

&nbsp;

[Open Slides](https://rawgit.com/lyhcode/grails-realestate/master/slides.html)

&nbsp;

https://github.com/lyhcode/grails-realestate

<style tyle="text/css">
pre.sourceCode {
background: black;
padding: .5em;
}
.reveal h1 {
/*background: -webkit-linear-gradient(#eee, #333);
-webkit-background-clip: text;
-webkit-text-fill-color: transparent;*/
}
.reveal h1, .reveal h2, .reveal h3 {
text-transform: none;
}
code > span.fu { color: #BBBBBB; }
code > span.st { color: #5AABC5; }
</style>

# lyhcode.info

---

<img src="http://lyhcode.info/images/lyhcode.png" alt="lyhcode" />

* 資深程序猿
* Love Groovy, hate Java.
* vCard: <font color="cyan">`lyhcode.info`</font>

## Groovy Tutorial

CodeData

http://www.codedata.com.tw/tag/groovy/

## Projects

* PLWeb
* ContPub
* CodeCanaan
* E7READ

# Groovy for Web Development

## Groovylets

* Java Servlets in Groovy
* http://groovy.codehaus.org/Groovlets

```java
html.html {
    head {
        title("Groovy Servlet")
    }
    body {
        ul {
            ['Java', 'Groovy', 'Scala'].each {
                li("Hello, ${request.remoteHost}")
            }
        }
    }
}
```

## GSP

* Groovy Servlet Pages
* http://groovy.codehaus.org/GSP

```jsp
<html>
<head>
    <title>GSP</title>
</head>
<body>
    <ul>
    <% ['Java', 'Groovy', 'Scala'].each { %>
        <li>Hello, ${it}</li>
    <% } %>
    </ul>
</body>
</html>
```

# Grails

## Grails

### an Open Source,
### full stack,
### web application framework for the JVM.

----

![](http://upload.wikimedia.org/wikipedia/de/5/56/Grails_logo_2009_2010.jpg)

----

### Modern Web Development

in

Groovy programming language

for

Java developers

----

> Don't Reinvent the Wheel

----

### Spring
### Hibernate

&nbsp;

(Grails 2.4.3)

----

### GORM

<small>Model</small>

&nbsp;

### SiteMesh

<small>View Decorator</small>

## Based on Groovy

![](http://groovy.codehaus.org/images/groovy-logo-medium.png)

----

### Groovy DSL

<small>`http://localhost:8080/user/forgetPassword/103`</small>

```java
class UserController {
    def forgetPassword(User user) {
        sendMail {
            to user.email
            subject "Forget Your Password?"
            body "Your password is ${user.password}"
        }
        respond user
    }
}
```

----

![Spring IO Platform](http://spring.io/img/platform-stack.png)

# Install

## GVM

使用 GVM 管理開發環境

### the Groovy enVironment Manager

<small>`http://gvmtool.net`</small>

```bash
# Install GVM
curl -s get.gvmtool.net | bash

# Install Grails
gvm install grails
```

# Getting Started

## Create-App

```bash
grails create-app realestate
```

## What's Inside

* <font color="yellow">`grails-app`</font>
* <font color="yellow">`web-app`</font>
* `wrapper`
* `src`
* <font color="yellow">`test`</font>
* `scripts`
* `lib`
* `application.properties`

## Run-App

```bash
grails run-app
```

## Done

&nbsp;

`Server running. Browse to`

`http://localhost:8080/realestate`

# Domain Class

----

### Domain Class = Model = Entity

## Define an entity

```json
房屋 {
    縣市;
    鄉鎮區;
    地址;
    坪數;
    售價;
    完成日期;
}
```

## Create-Domain-Class

```bash
grails create-domain-class house
```

## What's Inside

Domain Class

<small>`grails-app/domain/realestate/House.groovy`</small>

Unit Test

<small>`test/unit/realestate/HouseSpec.groovy`</small>

## The House Class

```java
class House {
    String city
    String region
    String address
    float feet
    int price
    Date buildDate
}
```

## Unit Test

```java
@TestFor(House)
class HouseSpec extends Specification {
    void "create a house"() {
        given:
        def house = new House(
                city: 'Taichung',
                region: 'Taiping',
                address: 'Yu Cai Rd. No. 440',
                feet: 45,
                price: 960,
                buildDate: new Date()
        )
        
        when:
        house.save(flush: true)
        
        then:
        House.countByCity('Taichung') > 0
    }
}
```

## Test-App

```bash
grails test-app
```

## Test Report

Browse to

<small>`target/test-reports/html/index.html`</small>

## Shell

```bash
grails shell
```

# Scaffolding

## Generate-All

```bash
$ grails generate-all realestate.House
```

## That's all?

## Run-App

### again

```bash
$ grails run-app
```

## CRUD

Browse to

<small>`http://localhost:8080/realestate/house`</small>

## What's Inside

* Controller
* Controller Test
* View

## URL Mappings

<small>`grails-app/conf/UrlMappings.groovy`</small>

```java
class UrlMappings {
	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
	}
}
```

## XML and JSON

<small>`http://localhost:8080/realestate/house/index.json`</small>

<small>`http://localhost:8080/realestate/house/index.xml`</small>

<small>`http://localhost:8080/realestate/house/show/1.json`</small>

<small>`http://localhost:8080/realestate/house/show/1.xml`</small>

# Spring Security

----

### Spring Security is...

a framework that

focuses on providing both authentication and authorization

to Java applications.

----

### Grails

### +

### Spring Security

----

### Spring Security Core Plugin

```java
plugins {
    // Spring Security Core Plugin
    compile ":spring-security-core:2.0-SNAPSHOT"
}
```

## s2-quickstart

```bash
grails s2-quickstart realestate User Role
```

## Config.groovy

```java
// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'realestate.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'realestate.UserRole'
grails.plugin.springsecurity.authority.className = 'realestate.Role'
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	'/**':                            ['permitAll'],
	'/index':                         ['permitAll'],
	'/index.gsp':                     ['permitAll'],
	'/assets/**':                     ['permitAll'],
	'/**/js/**':                      ['permitAll'],
	'/**/css/**':                     ['permitAll'],
	'/**/images/**':                  ['permitAll'],
	'/**/favicon.ico':                ['permitAll']
]
```

## User and Role

```java
def roleUser = new Role(authority: 'ROLE_USER')
def roleAdmin = new Role(authority: 'ROLE_ADMIN')

roleUser.save flush: true
roleAdmin.save flush: true

def admin = new User(
        username: 'admin',
        password: 'admin',
        enabled: true,
        accountExpired: false,
        accountLocked: false,
        passwordExpired: false
)

admin.save flush: true

UserRole.create(admin, roleUser, true)
UserRole.create(admin, roleAdmin, true)
```

## BootStrap

<small>`grails-app/conf/BootStrap.groovy`</small>

```java
class BootStrap {
    def init = { servletContext ->
        //...
    }
    def destroy = {
    }
}
```

## Fix Bug

<small>`grails-app/conf/DataSource.groovy`</small>

```java
dialect = realestate.ImprovedH2Dialect
```

<small>`src/groovy/realestate/ImprovedH2Dialect.groovy`</small>

```java
public class ImprovedH2Dialect extends H2Dialect {
    @Override
    public String getDropSequenceString(String sequenceName) {
        return "drop sequence if exists " + sequenceName;
    }
    @Override
    public boolean dropConstraints() {
        return false;
    }
}
```

## Spring Security Tags

* `<sec:ifLoggedIn>...</sec:ifLoggedIn>`
* `<sec:username />`

<small>`grails-app/views/index.gsp`</small>

```html
<sec:ifLoggedIn>
    <g:link uri="/j_spring_security_logout">Logout</g:link>
    <h1>Hello, <sec:username />. Welcome to Grails</h1>
</sec:ifLoggedIn>
<sec:ifNotLoggedIn>
    <g:link controller="login" action="auth">Login</g:link>
    <h1>Welcome to Grails</h1>
</sec:ifNotLoggedIn>
```

# OAuth

## OAuth Plugin

<small>`grails-app/conf/BuildConfig.groovy`</small>

```java
    dependencies {
        // OAuth required scribe framework
        runtime "org.scribe:scribe:1.3.5"
    }
    plugins {
        // Spring Security Core Plugin
        compile ":spring-security-core:2.0-SNAPSHOT"

        // Spring Security OAuth2
        compile (":oauth:2.5") { exclude "scribe" }
        compile ":spring-security-oauth:2.1.0-RC4"
        compile ":spring-security-oauth-facebook:0.2"
    }
```

<!-- 版本很重要！版本很重要！版本很重要！ -->

## s2-init-oauth

```bash
grails s2-init-oauth realestate OAuthID
```

Add relationship to User domain class.

```java
static hasMany = [oAuthIDs: OAuthID]
```

----

### OAuth Provider: Facebook

<small>`grails-app/conf/Config.groovy`</small>

```java
// OAuth Facebook
oauth {
    providers {
        facebook {
            key = '363532783795859'
            secret = '----App Secret----'
        }
    }
}
```

<small>`~/.grails/realestate-config.groovy`</small>

```java
oauth.providers.facebook.secret = '....'
```

## Server URL

```java
grails.serverURL = "http://dev.teamcollab.org:8080/realestate"
```

## Facebook Connect

<small>`grails-app/views/index.gsp`</small>

```html
<oauth:connect provider="facebook">Sign-in with Facebook</oauth:connect>
```

<!-- https://developers.facebook.com/apps/363532783795859/settings/ -->

# Layout

## Twitter Bootstrap

```java
plugins {
    // Twitter Bootstrap
    runtime ":twitter-bootstrap:3.2.0.2"
}
```

## Assets Pipeline

```java
plugins {
    compile ":asset-pipeline:1.9.6"

    // Uncomment these to enable additional asset-pipeline capabilities
    //compile ":sass-asset-pipeline:1.9.0"
    //compile ":less-asset-pipeline:1.10.0"
    //compile ":coffee-asset-pipeline:1.8.0"
    //compile ":handlebars-asset-pipeline:1.3.0.3"
}
```

## Require Bootstrap

<small>`grails-app/assets/javascripts/application.js`</small>

```javascript
//= require bootstrap
```

<small>`grails-app/assets/stylesheets/application.css`</small>

```css
/*
*= require bootstrap
*/
```

## SiteMesh

Apply a "layout" for views.

```html
<html>
<head>
    <meta name="layout" content="main" />
    <title>Page Title</title>
```

----

### SiteMesh Layout

```html
<!DOCTYPE html>
<html>
<head>
    <title><g:layoutTitle default="Untitled" /></title>
    <g:layoutHead/>
</head>
<body>
    <g:layoutBody/>
</body>
</html>
```

## TagLib

```java
class BootstrapTagLib {

    static namespace = "bs3"

    def alert = { attrs, body ->
        out << "<div class=\"alert alert-${attrs.type?:'success'}\">"
        out << body()
        out << "</div>"
    }
}
```

```html
<bs3:alert><b>Well done!</b> You successfully ...</bs3:alert>
```

# Elasticsearch

## Install Plugin

```java
plugins {
    // Elasticsearch
    compile ":elasticsearch:0.0.3.3"
}
```

## Configuration

```java
elasticSearch {
    datastoreImpl = "hibernateDatastore"
    date.formats = [
            "yyyy-MM-dd'T'HH:mm:ss'Z'"
    ]
    client.hosts = [
            [host: 'localhost', port: 9300]
    ]
    defaultExcludedProperties = ["password"]
    disableAutoIndex = false
    bulkIndexOnStartup = true
    maxBulkRequest = 500
    searchableProperty.name = 'searchable'
}
```

----

```java
environments {
    development {
        elasticSearch.client.mode = 'local'
    }
    test {
        elasticSearch {
            client.mode = 'local'
            index.store.type = 'memory'
        }
    }
    production {
        elasticSearch.client.mode = 'node'
        //elasticSearch.client.mode = 'local'
    }
}
```

## Searchable

```java
class House {
    static searchable = true

    //...
}
```

## Searching

```java
def search() {
    render House.search(params.q) as JSON
}
```

`/house/search?q=KEYWORDS`

# Web Test

----

### Geb

### Selenium WebDriver

### +

### Spock



## Install Plugin

```java
dependencies {
    test "org.seleniumhq.selenium:selenium-firefox-driver:2.42.2"
    test "org.gebish:geb-spock:0.9.3"
}
```

```java
plugins {
    test ":geb:0.9.3"
}
```

## Functional Test

```bash
grails test-app functional:spock
```

# Deployment

## War Package

```bash
grails war
```

## Deploy to AWS

### Elastic Beanstalk

# Real World Projects

GR8 CRM http://gr8crm.github.io/

# The End