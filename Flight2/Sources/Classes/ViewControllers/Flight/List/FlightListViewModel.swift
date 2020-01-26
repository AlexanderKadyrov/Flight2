import ReactiveSwift
import ReactiveCocoa
import TabloidView
import Foundation

fileprivate let source = "https://raw.githubusercontent.com/AlexanderKadyrov/JSONs/master/Flight/seeder_configuration.json"

final class FlightListViewModel {
    
    // MARK: - Properties
    
    public var actionFetchFlightList = Action<(), [FlightProtocol], Error> { input in
        return FlightService.fetchFlightList(source: source)
    }
    
    public let tabloidViewModel = TabloidViewModel(tabloidStyle: .plain,
                                                   separatorStyle: .none,
                                                   cellIdentifiers: ["FlightListTabloidCellView"])
    
    // MARK: - Initialization
    
    public init() {
        tabloidViewModel.elements <~ actionFetchFlightList.values.map({ [$0.map({ FlightListTabloidCellViewModel(model: $0) })]})
    }
}
