import UIKit

final class FlightRouter {
    
    // MARK: - Enums
    
    public enum FlightSegue {
        case notice(FlightProtocol)
        case event(FlightProtocol)
        case move(FlightProtocol)
    }
    
    // MARK: - Perform
    
    public func perform(_ segue: FlightSegue, from source: UIViewController) {
        switch segue {
        case .notice(value):
            break
        case .event(value):
            break
        case .move(value):
            break
        }
    }
}
