import Foundation

extension Date {
    
    public static func with(value: String, format: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        guard let date = dateFormatter.date(from: value) else {
            fatalError("error date converting")
        }
        return date
    }
    
    public func toString(_ formatter: DateFormatter) -> String {
        return formatter.string(from: self)
    }
}
