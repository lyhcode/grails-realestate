package realestate

class House {

    static searchable = {
        address analyzer: 'cjk'
    }

    String city
    String region
    String address
    float feet
    int price
    Date buildDate
}
