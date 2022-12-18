import Foundation

public struct SomeModel: Codable {
    
    public let id: String

    public init(id: String) {
        self.id = id
    }
}
