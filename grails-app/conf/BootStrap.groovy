import realestate.Role
import realestate.User
import realestate.UserRole

class BootStrap {

    def init = { servletContext ->

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

    }
    def destroy = {
    }
}
