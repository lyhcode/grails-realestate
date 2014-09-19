

import geb.spock.GebReportingSpec

import spock.lang.*

import pages.*

@Stepwise
class HouseCRUDSpec extends GebReportingSpec {

    def "there are no house"() {
        when:
        to ListPage
        then:
        houseRows.size() == 0
    }

    def "add a house"() {
        when:
        newHouseButton.click()
        then:
        at CreatePage
    }

    def "enter the details"() {
        when:
        $("#enabled").click()
        address = " Zhongshan Rd."
        region = "Taiping"
        city = "Taichung"
        feet = 46
        price = 9000000
        createButton.click()
        then:
        at ShowPage
    }

    def "check the entered details"() {
        expect:
        city == "Taichung"
        region == "Taiping"
    }

    def "edit the details"() {
        when:
        editButton.click()
        then:
        at EditPage
        when:
        $("#enabled").click()
        updateButton.click()
        then:
        at ShowPage
    }

    def "check in listing"() {
        when:
        to ListPage
        then:
        houseRows.size() == 1
        def row = houseRow(0)
        row.city == "Taichung"
        row.region == "Taiping"
    }

    def "show house"() {
        when:
        houseRow(0).showLink.click()
        then:
        at ShowPage
    }

    def "delete user"() {
        given:
        def deletedId = id
        when:
        withConfirm { deleteButton.click() }
        then:
        at ListPage
        message == "House $deletedId deleted"
        houseRows.size() == 0
    }
}