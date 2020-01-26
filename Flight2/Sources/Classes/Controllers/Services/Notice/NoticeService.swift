import ReactiveSwift
import Foundation
import NWClient

final class NoticeService: NWService {
    
    // MARK: - Network Method
    
    public static func fetchNoticeList(source: String?) -> SignalProducer<[Notice], Error> {
        let request = NWRequest(source: source)
        return make(request: request).flatMap(.latest, { data -> SignalProducer<[Notice], Error> in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.yyyy"
            if let list = JSONDecoder.decode([Notice].self, from: data, with: .formatted(dateFormatter)) {
                return SignalProducer(value: list)
            }
            return SignalProducer(error: NSError.errorBadRequest)
        })
    }
}
