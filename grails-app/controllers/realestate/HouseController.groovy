package realestate

import grails.converters.JSON

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class HouseController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond House.list(params), model:[houseInstanceCount: House.count()]
    }

    def show(House houseInstance) {
        respond houseInstance
    }

    def create() {
        respond new House(params)
    }

    @Transactional
    def save(House houseInstance) {
        if (houseInstance == null) {
            notFound()
            return
        }

        if (houseInstance.hasErrors()) {
            respond houseInstance.errors, view:'create'
            return
        }

        houseInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'house.label', default: 'House'), houseInstance.id])
                redirect houseInstance
            }
            '*' { respond houseInstance, [status: CREATED] }
        }
    }

    def edit(House houseInstance) {
        respond houseInstance
    }

    @Transactional
    def update(House houseInstance) {
        if (houseInstance == null) {
            notFound()
            return
        }

        if (houseInstance.hasErrors()) {
            respond houseInstance.errors, view:'edit'
            return
        }

        houseInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'House.label', default: 'House'), houseInstance.id])
                redirect houseInstance
            }
            '*'{ respond houseInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(House houseInstance) {

        if (houseInstance == null) {
            notFound()
            return
        }

        houseInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'House.label', default: 'House'), houseInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'house.label', default: 'House'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    def search() {
        render House.search(params.q) as JSON
    }
}
