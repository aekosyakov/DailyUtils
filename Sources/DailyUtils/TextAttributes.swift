//
//  TextAttributes.swift
//

import UIKit

struct TextAttributes {

    var dictionary: [NSAttributedString.Key: Any] = [:]

}

extension TextAttributes {

    var font: UIFont? {
        get { return dictionary[NSAttributedString.Key.font] as? UIFont }
        set { dictionary[NSAttributedString.Key.font] = newValue }
    }

    var paragraphStyle: NSParagraphStyle? {
        get { return dictionary[NSAttributedString.Key.paragraphStyle] as? NSParagraphStyle }
        set { dictionary[NSAttributedString.Key.paragraphStyle] = newValue?.copy() }
    }

    var foregroundColor: UIColor? {
        get { return dictionary[NSAttributedString.Key.foregroundColor] as? UIColor }
        set { dictionary[NSAttributedString.Key.foregroundColor] = newValue }
    }

    var kern: CGFloat? {
        get { return dictionary[NSAttributedString.Key.kern] as? CGFloat }
        set { dictionary[NSAttributedString.Key.kern] = newValue }
    }

}

extension TextAttributes {

    init(
        alignment: NSTextAlignment = .center,
        font: UIFont? = nil,
        foregroundColor: UIColor? = .white,
        kern: CGFloat? = nil,
        lineHeight: CGFloat? = nil
    ) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = alignment
        if let font = font, let lineHeight = lineHeight {
            paragraphStyle.lineHeightMultiple = lineHeight / font.lineHeight
        }
        self.font = font
        self.paragraphStyle = paragraphStyle
        self.foregroundColor = foregroundColor
        self.kern = kern
    }

}

extension String {

    func attributed(_ attributes: TextAttributes) -> NSAttributedString {
        return attributed(attributes.dictionary)
    }

    func attributed(_ attributes: [NSAttributedString.Key: Any]? = nil) -> NSAttributedString {
        return NSAttributedString(string: self, attributes: attributes)
    }

}


