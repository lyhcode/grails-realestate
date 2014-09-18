package realestate

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
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
