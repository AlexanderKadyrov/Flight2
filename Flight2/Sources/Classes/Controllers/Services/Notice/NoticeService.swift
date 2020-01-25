import ReactiveSwift
import Foundation
import NWClient

final class NoticeService: NWService {
    public static func fetchNoticeList(source: String) -> SignalProducer<[Notice], Error> {
        let request = NWRequest(source: source)
        return make(request: request).flatMap(.latest, { data -> SignalProducer<[Notice], Error> in
            if let list = JSONDecoder.decode([Notice].self, from: data) {
                return SignalProducer(value: list)
            }
            return SignalProducer(error: NSError.errorBadRequest)
        })
    }
}
