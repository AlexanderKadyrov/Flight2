import ReactiveSwift
import Foundation
import NWClient

final class ConfigurationService: NWService {
    
    // MARK: - Network Method
    
    public static func fetchConfiguration(source: String?) -> SignalProducer<Configuration, Error> {
        let request = NWRequest(source: source)
        return make(request: request).flatMap(.latest, { data -> SignalProducer<Configuration, Error> in
            if let value = JSONDecoder.decode(Configuration.self, from: data) {
                return SignalProducer(value: value)
            }
            return SignalProducer(error: NSError.errorBadRequest)
        })
    }
}
