import UIKit

final class FlightListRouter {
    
    // MARK: - Enums
    
    public enum FlightListSegue {
        case notice(FlightProtocol)
        case event(FlightProtocol)
        case move(FlightProtocol)
    }
    
    // MARK: - Perform
    
    public func perform(_ segue: FlightListSegue, from source: UIViewController) {
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
