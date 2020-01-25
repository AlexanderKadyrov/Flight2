import Foundation

final class Move: Codable, FlightProtocol {
    
    // MARK: - Enums
    
    private enum CodingKeys: String, CodingKey {
        case estimateTime
        case fromPlace
        case toPlace
    }
    
    // MARK: - Properties
    
    public var estimateTime: TimeInterval?
    public var fromPlace: String?
    public var toPlace: String?
    
    // MARK: - Initialization
    
    public required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.fromPlace = try values.decodeIfPresent(String.self, forKey: .fromPlace)
        self.toPlace = try values.decodeIfPresent(String.self, forKey: .toPlace)
        
        if let intEstimateTime = try values.decodeIfPresent(Int.self, forKey: .estimateTime) {
            self.estimateTime = TimeInterval(intEstimateTime)
        }
    }
    
    // MARK: - Encode
    
    public func encode(to encoder: Encoder) throws {}
    
    // MARK: - FlightProtocol
    
    public var title: String {
        return String(describing: type(of: self))
    }
    
    public var subtitle: String {
        var values = [String]()
        
        if let fromPlace = fromPlace, !fromPlace.isEmpty {
            values.append(fromPlace)
        }
        
        if let toPlace = toPlace, !toPlace.isEmpty {
            values.append(toPlace)
        }
        
        if let estimateTime = estimateTime {
            values.append(estimateTime.toString)
        }
        
        return values.joined(separator: "\n")
    }
}
