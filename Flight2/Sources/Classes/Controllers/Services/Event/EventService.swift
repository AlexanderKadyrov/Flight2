import ReactiveSwift
import Foundation
import NWClient

final class EventService: NWService {
    
    // MARK: - Network Method
    
    public static func fetchEventList(source: String) -> SignalProducer<[Event], Error> {
        let request = NWRequest(source: source)
        return make(request: request).flatMap(.latest, { data -> SignalProducer<[Event], Error> in
            if let list = JSONDecoder.decode([Event].self, from: data) {
                return SignalProducer(value: list)
            }
            return SignalProducer(error: NSError.errorBadRequest)
        })
    }
}
