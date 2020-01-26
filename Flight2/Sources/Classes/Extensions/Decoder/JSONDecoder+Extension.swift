import Foundation

extension JSONDecoder {
    public static func decode<T>(_ type: T.Type, from data: Data, with dateDecodingStrategy: DateDecodingStrategy? = nil) -> T? where T : Decodable {
        do {
            let decoder = JSONDecoder()
            if let dateDecodingStrategy = dateDecodingStrategy {
                decoder.dateDecodingStrategy = dateDecodingStrategy
            }
            return try decoder.decode(type, from: data)
        } catch {}
        return nil
    }
}
