//
//  StringExt.swift
//  OmniMd
//
//  Created by Viral Narshana on 1/19/17.
//  Copyright © 2017 ISM. All rights reserved.
//

import Foundation

extension String {
    public static func isNilOrEmptyPreSpace(_ string: String?) -> String {
        switch string?.trimmingCharacters(in: CharacterSet.whitespaces) {
        case .some(let nonNilString):
            return " " + nonNilString
        default:
            return ""
        }
    }
    public static func isNilOrEmpty(_ string: String?) -> String {
        switch string?.trimmingCharacters(in: CharacterSet.whitespaces) {
        case .some(let nonNilString):
            return nonNilString
        default:
            return ""
        }
    }
    func heightWithConstrainedWidth(_ width: CGFloat, font: UIFont) -> CGSize {
        let constraintRect = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        
        let option = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        
        let boundingBox = self.boundingRect(with: constraintRect, options: option, attributes: [NSFontAttributeName: font], context: nil).size
        print("ex width \(boundingBox.width)")
        print("ex height \(boundingBox.height)")
        return boundingBox
    }
}
