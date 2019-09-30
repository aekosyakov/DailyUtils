import UIKit

public
extension UIView {

    func addSubviews(_ subviews: UIView...) {
        addSubviews(subviews)
    }

    func addSubviews(_ subviews: [UIView]) {
        subviews.forEach {
            addSubview($0)
        }
    }

}

public
extension UIView {

    func shakeAnimation() {
        layer.removeAllAnimations()

        let shakeAnimation  = CAKeyframeAnimation(keyPath:"transform")
        shakeAnimation.values =
            [
                NSValue(caTransform3D: CATransform3DMakeRotation(0.03, 0, 0, 1)),
                NSValue(caTransform3D: CATransform3DMakeRotation(-0.03, 0, 0, 1)),
            ]
        shakeAnimation.autoreverses = true
        shakeAnimation.duration  = 0.2
        shakeAnimation.repeatCount = .infinity

        layer.add(shakeAnimation, forKey: "transform")
    }

}

public
extension String {

    var image: UIImage? {
        return UIImage(named: self)
    }

}

public
extension NSObjectProtocol {

    func with(_ closure: (Self) -> Void) -> Self {
        closure(self)
        return self
    }

}

public
extension UIColor {

    convenience
    init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }

}

public
extension String {
    
    func localized(with locale: String?) -> String {
        guard let locale = locale else {
            return self
        }
        return appendingFormat("_%@", locale)
    }
    
}

public
extension Dictionary where Key == String {
    
    func string(for key: String, locale: String?) -> String? {
        let localizedKey = key.localized(with: locale)
        if let value = self[localizedKey] as? String {
            return value
        }
        if let value = self[key] as? String{
            return value;
        }
        return "n/a"
    }
    
}

public
extension NSRange {

    func contains(index: Int) -> Bool {
        return index > location && index < location + length
    }

}

public
extension UILabel {

    func indexOfCharInAttributedText(at point: CGPoint) -> Int? {
        guard let attributedText = attributedText else {
            return nil
        }
        let textStorage = NSTextStorage(attributedString: attributedText)
        let layoutManager = NSLayoutManager()
        textStorage.addLayoutManager(layoutManager)
        let textContainer = NSTextContainer(size: bounds.size)
        textContainer.lineFragmentPadding = 0
        textContainer.maximumNumberOfLines = numberOfLines
        textContainer.lineBreakMode = lineBreakMode
        layoutManager.addTextContainer(textContainer)
        return layoutManager.characterIndex(for: point, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
    }

}




