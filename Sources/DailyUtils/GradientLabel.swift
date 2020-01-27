import UIKit

public
class GradientLabel: UILabel {

    var gradientColors: [CGColor] = []

    override public
    func drawText(in rect: CGRect) {
        if let gradientColor = drawGradient(colors: gradientColors, in: rect) {
            self.textColor = gradientColor
        }
        super.drawText(in: rect)
    }

    private
    func drawGradient(colors: [CGColor], in rect: CGRect) -> UIColor? {
        let currentContext = UIGraphicsGetCurrentContext()
        currentContext?.saveGState()
        defer { currentContext?.restoreGState() }

        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        guard let gradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(),
                                        colors: colors as CFArray,
                                        locations: nil) else { return nil }

        let context = UIGraphicsGetCurrentContext()
        context?.drawLinearGradient(gradient,
                                    start: CGPoint.zero,
                                    end: CGPoint(x: rect.size.width, y: 0),
                                    options: [])
        let gradientImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        guard let image = gradientImage else { return nil }
        return UIColor(patternImage: image)
    }

}
