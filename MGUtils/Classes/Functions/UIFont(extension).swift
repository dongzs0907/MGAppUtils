//
//  UIFont(extension).swift
//  Swift-Common
//
//  Created by 董振山 on 2018/4/17.
//  Copyright © 2018年 董振山. All rights reserved.
//

import Foundation
enum CustomFontStyle:String {
    case regular = "Montserrat-Regular"
    case medium = "Montserrat-Medium"
    case bold = "Montserrat-Bold"
    case black = "Montserrat-Black"
}
extension UIFont{
    /// 自定义字体
    convenience init(_ style: CustomFontStyle,_ size:CGFloat){
        self.init(name: style.rawValue, size: size)!;
    }
    //NotoSansSC-Black
    // PassionOne-Black
    class func PassionOne_Bold(fontSize:CGFloat) -> UIFont{
        let fontStyleStr = NSLocalizedString("app_font", comment: "")
//        for familyname in UIFont.familyNames {
//            for fontName in UIFont.fontNames(forFamilyName: familyname) {
//                print(fontName)
//            }
//        }
        return UIFont.init(name: fontStyleStr, size: fontSize)!;
    }
    
    
}
