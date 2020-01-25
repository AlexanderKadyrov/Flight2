import Foundation

final class Configuration: Codable {
    
    // MARK: - Enums
    
    private enum CodingKeys: String, CodingKey {
        case sourceNotice = "source_notice"
        case sourceEvent = "source_event"
        case sourceMove = "source_move"
    }
    
    // MARK: - Properties
    
    public var sourceNotice: String?
    public var sourceEvent: String?
    public var sourceMove: String?
    
    // MARK: - Initialization
    
    public required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.sourceNotice = try values.decodeIfPresent(String.self, forKey: .sourceNotice)
        self.sourceEvent = try values.decodeIfPresent(String.self, forKey: .sourceEvent)
        self.sourceMove = try values.decodeIfPresent(String.self, forKey: .sourceMove)
    }
    
    // MARK: - Encode
    
    public func encode(to encoder: Encoder) throws {}
}
