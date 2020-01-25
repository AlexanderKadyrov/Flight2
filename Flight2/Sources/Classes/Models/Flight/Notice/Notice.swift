import Foundation

public struct Notice: Codable, FlightProtocol {
    
    // MARK: - Properties
    
    public var flightDate: Date?
    public var gate: String?
    
    public var title: String {
        return String(describing: type(of: self))
    }
    
    public var subtitle: String {
        var values = [String]()
        if let flightDate = flightDate {
            values.append(flightDate.toString(.formatterDate))
        }
        if let gate = gate, !gate.isEmpty {
            values.append(gate)
        }
        return values.joined(separator: "\n")
    }
}
