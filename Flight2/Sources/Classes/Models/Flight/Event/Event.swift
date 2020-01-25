import Foundation

fileprivate let dateFormatEvent = "dd-MM-yyyy HH:mm:ss"

final class Event: Codable {
    
    // MARK: - Enums
    
    private enum CodingKeys: String, CodingKey {
        case startTime
        case endTime
        case airline
        case name
    }
    
    public enum Airline: String, Codable {
        case uralairlines
        case transaero
        case aeroflot
        case redwings
        case nordstar
        case pegasfly
        case openair
        case kolavia
        case pobeda
        case utair
        case s7
    }
    
    // MARK: - Properties
    
    public var airline: Airline
    public var startTime: Date
    public var endTime: Date
    public var name: String
    
    // MARK: - Initialization
    
    public required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        let stringStartTime = try values.decode(String.self, forKey: .startTime)
        self.startTime = Date.with(value: stringStartTime, format: dateFormatEvent)
        
        let stringEndTime = try values.decode(String.self, forKey: .endTime)
        self.endTime = Date.with(value: stringEndTime, format: dateFormatEvent)
        
        self.airline = try values.decode(Airline.self, forKey: .airline)
        
        self.name = try values.decode(String.self, forKey: .name)
    }
    
    // MARK: - Encode
    
    public func encode(to encoder: Encoder) throws {}
}
