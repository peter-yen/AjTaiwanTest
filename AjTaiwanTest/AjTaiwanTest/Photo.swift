import Foundation

class Photo: Decodable {
    
    let farm: Int
    let secret: String
    let id: String
    let server: String
    let title: String
    var imageURL: URL {
        return URL(string: "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret)_m.jpg")!
    }
    
    init(dictionary: [String: Any]) {
        self.farm = dictionary["farm"] as! Int
        self.secret = dictionary["secret"] as! String
        self.id = dictionary["id"] as! String
        self.server = dictionary["server"] as! String
        self.title = dictionary["title"] as! String
        
    }
}
