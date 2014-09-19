package pages

import geb.Module

class ListPage extends ScaffoldPage {
	static url = "house/index"
	
	static at = {
		title ==~ /House List/
	}
	
	static content = {
		newHouseButton(to: CreatePage) { $("a", text: "New House") }
		houseTable { $("div.content table", 0) }
		houseRow { module HouseRow, houseRows[it] }
		houseRows(required: false) { houseTable.find("tbody").find("tr") }
	}
}

class HouseRow extends Module {
	static content = {
		cell { $("td", it) }
		cellText { cell(it).text() }
        cellHrefText{ cell(it).find('a').text() }
		city { cellText(2) }
		region { cellText(5) }
		showLink(to: ShowPage) { cell(0).find("a") }
	}
}