//
//  UIColor(extension).swift
//  Swift-Common
//
//  Created by 董振山 on 2018/4/17.
//  Copyright © 2018年 董振山. All rights reserved.
//

import Foundation
extension UIColor{
    // 16进制转RGB
      convenience init(_ hex: String) {
          // 处理输入字符串
          var cString = hex.uppercased().trimmingCharacters(in: .whitespacesAndNewlines)
          
          // 验证字符串长度
          let length = cString.count
          if length < 6 || length > 7 || (length == 7 && !cString.hasPrefix("#")) {
              // 返回 blackColor
              self.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
              return
          }
          
          if cString.hasPrefix("#") {
              cString.removeFirst()
          }
          
          // 截取颜色值
          let rString = cString.prefix(2)
          let gString = cString.dropFirst(2).prefix(2)
          let bString = cString.dropFirst(4).prefix(2)
          
          // 转换为数值
          let r = UInt8(rString, radix: 16) ?? 0
          let g = UInt8(gString, radix: 16) ?? 0
          let b = UInt8(bString, radix: 16) ?? 0
          
          // 根据颜色值创建 UIColor
          self.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: 1.0)
      }
    
    
    /** RGB值 */
    convenience init(r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat){
        self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
    }
    
    
}
