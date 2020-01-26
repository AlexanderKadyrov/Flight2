import ReactiveSwift
import TabloidView
import Foundation

fileprivate let source = "https://github.com/AlexanderKadyrov/JSONs/blob/master/Flight/seeder_configuration.json"

final class FlightListViewModel {
    
    // MARK: - Properties
    
    public var actionFetchFlightList = Action<(), [FlightProtocol], Error> { input in
        return FlightService.fetchFlightList(source: source)
    }
    
    public let tabloidViewModel = TabloidViewModel(tabloidStyle: .plain,
                                                   separatorStyle: .none,
                                                   cellIdentifiers: ["FlightListTableViewCell"])
}
