import ReactiveSwift
import Foundation
import NWClient

final class FlightService: NWService {
    
    // MARK: - Network Method
    
    public static func fetchFlightList(source: String?) -> SignalProducer<[FlightProtocol], Error> {
        return ConfigurationService.fetchConfiguration(source: source).flatMap(.latest, { configuration -> SignalProducer<[FlightProtocol], Error> in
            return SignalProducer(value: configuration)
                .combineLatest(with: NoticeService.fetchNoticeList(source: configuration.sourceNotice))
                .combineLatest(with: EventService.fetchEventList(source: configuration.sourceEvent))
                .combineLatest(with: MoveService.fetchMoveList(source: configuration.sourceMove))
                .map({ ($0.0.0.1 + $0.0.1 + $0.1) })
        })
    }
}
