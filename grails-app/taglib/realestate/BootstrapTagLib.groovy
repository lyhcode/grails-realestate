package realestate

class BootstrapTagLib {

    static namespace = "bs3"

    def alert = { attrs, body ->
        out << "<div class=\"alert alert-${attrs.type?:'success'}\">"
        out << body()
        out << "</div>"
    }
}
