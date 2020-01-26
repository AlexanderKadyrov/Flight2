import UIKit

extension UIColor {
    
    public static let colorBrilliantAzure = color(hex: "33A1FD")
    
    public static let colorRefreshControl: UIColor = {
        let hex = color(hex: "31393C")
        if #available(iOS 13.0, *) {
            guard let color = UIColor(named: "color_refresh_control") else { return hex }
            return color
        }
        return hex
    }()
    
    public static let colorBackground: UIColor = {
        if #available(iOS 13.0, *) {
            guard let color = UIColor(named: "color_background") else { return .white }
            return color
        }
        return .white
    }()
    
    public static let colorLabelText: UIColor = {
        let hex = color(hex: "31393C")
        if #available(iOS 13.0, *) {
            guard let color = UIColor(named: "color_label_title") else { return hex }
            return color
        }
        return hex
    }()
}

fileprivate extension UIColor {
    static func color(hex: String) -> UIColor {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }
        if (cString.count) != 6 {
            return UIColor.gray
        }
        var rgbValue: UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
