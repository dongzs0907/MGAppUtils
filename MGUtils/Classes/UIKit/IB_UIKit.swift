//
//  IB_UIKit.swift
//  SwiftCommon
//
//  Created by 董振山 on 2018/7/10.
//  Copyright © 2018年 董振山. All rights reserved.
//

import Foundation
import UIKit
extension UILabel{
    
    @IBInspectable public var Localizable:String {
        get{
            return self.Localizable;
        }
        set{
            self.text = NSLocalizedString(newValue, comment: "")
        }
    }
    
    
}

extension UIButton{
    
    @IBInspectable public var Localizable:String {
        get{
            return self.Localizable;
        }
        set{
            self.setTitle(NSLocalizedString(newValue, comment: ""), for: UIControl.State.normal)
        }
    }
    
}


extension UITextField{
    
}


extension UITextView{
    
}
