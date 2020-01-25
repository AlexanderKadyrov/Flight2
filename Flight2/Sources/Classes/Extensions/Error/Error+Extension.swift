import Foundation

extension Error {
    public static var errorBadRequest: Error {
        return NSError(domain: "flight.com", code: 400, userInfo: [NSLocalizedDescriptionKey: "Bad request"])
    }
}
