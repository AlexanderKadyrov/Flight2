import ReactiveSwift
import Foundation
import NWClient

final class MoveService: NWService {
    
    // MARK: - Network Method
    
    public static func fetchMoveList(source: String?) -> SignalProducer<[Move], Error> {
        let request = NWRequest(source: source)
        return make(request: request).flatMap(.latest, { data -> SignalProducer<[Move], Error> in
            if let list = JSONDecoder.decode([Move].self, from: data) {
                return SignalProducer(value: list)
            }
            return SignalProducer(error: NSError.errorBadRequest)
        })
    }
}
