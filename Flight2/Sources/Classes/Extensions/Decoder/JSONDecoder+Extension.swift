import Foundation

extension JSONDecoder {
    public static func decode<T>(_ type: T.Type, from data: Data, with dateFormat: String? = nil) -> T? where T : Decodable {
        do {
            let decoder = JSONDecoder()
            if let format = dateFormat {
                let formatter = DateFormatter()
                formatter.dateFormat = format
                decoder.dateDecodingStrategy = .formatted(formatter)
            }
            return try decoder.decode(type, from: data)
        } catch {}
        return nil
    }
}
