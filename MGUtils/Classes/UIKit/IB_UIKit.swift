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
    
    @IBInspectable public var tr:String {
        get{
            return self.text ?? "" ;
        }
        set{
            self.text = newValue.tr()
        }
    }
    
    
}

extension UIButton{
    
    @IBInspectable public var tr:String {
        get{
            return self.titleLabel?.text ?? "";
        }
        set{
            self.setTitle(newValue.tr(), for: UIControl.State.normal)
        }
    }
    
}


extension UITextField{
    
}


extension UITextView{
    
}
