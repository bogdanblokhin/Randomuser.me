import Foundation

public final class Registered: Codable, Equatable, Identifiable {
    public let date: String?
    public let age: Int?
    public let id: UUID

    init(date: String?, age: Int?) {
        self.date = date ?? ""
        self.age = age ?? 0
        self.id = .init()
    }
    
    public static func ==(lhs: Registered, rhs: Registered) -> Bool {
        return lhs.id == rhs.id && lhs.date == rhs.date && lhs.age == rhs.age
    }
    
    private enum CodingKeys: String, CodingKey {
        case date = "date"
        case age = "age"
    }

    required public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        date = try values.decode(String.self, forKey: .date)
        age = try values.decode(Int.self, forKey: .age)
        id = UUID()
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(date, forKey: .date)
        try container.encode(age, forKey: .age)
    }
}
