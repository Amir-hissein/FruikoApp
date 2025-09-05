import Foundation

@available(iOS 16, *)
struct Country: Codable, Hashable {
    var name: String
    var dialCode: String
    var isocode: String
    
    var flag: String {
        isocode.unicodeScalars.reduce(into: "") { result, scalar in
            if let scalar = UnicodeScalar(127397 + scalar.value) {
                result.unicodeScalars.append(scalar)
            }
        }
    }
    
    static let list: [Country] = {
        guard let url = Bundle.main.url(forResource: "countries", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              var countries = try? JSONDecoder().decode([Country].self, from: data)
        else {
            return []
        }
        if let userRegionCode = Locale.current.region?.identifier,
           let index = countries.firstIndex(where: { $0.isocode == userRegionCode }) {
            let userCountry = countries.remove(at: index)
            countries.insert(userCountry, at: 0)
        }
        
        return countries
    }()
}
