//
//  DeviceUtils.swift
//  Trimmer
//
//  Created by 董振山 on 2023/7/7.
//  Copyright © 2023 trimmer. All rights reserved.
//

import UIKit

public class DeviceUtils:NSObject {
    public static let shared = DeviceUtils()
    /// 获取设备宽
    public var screenWidth:CGFloat {
        return UIScreen.main.bounds.width;
    };
    
    /// 获取设备高
    public var screenHeight:CGFloat{
        return UIScreen.main.bounds.height;
    };
    
    /// 状态栏高度
    public var statusBarHeight:CGFloat{
        if #available(iOS 13.0, *) {
            return keyWindow.windowScene!.statusBarManager!.statusBarFrame.height
        } else {
           return UIApplication.shared.statusBarFrame.height
        };
    }
    
    /// 导航栏高度 44
    public var navBarHeight:CGFloat {
        return isIpad ? 50 : 44
    };

    /// tabbar 高度
    public var tabBarHeight:CGFloat{
        return isIpad ? (isIpadPro ? 65 : 50) : (isIphoneX ? 83 : 49);
    }

    /// 底部安全区高度
    public var bottomSafeAreaHeight:CGFloat{
        return isIphoneX ? 34 : 0;
    }
    
    
    /// 是否是iPad
    public var isIpad:Bool{
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? true : false;
    }
    /// 是否是iPad Pro
    public var isIpadPro:Bool{
        return statusBarHeight <= 20 ? false : true
    }
    /// 是否是iPhoneX系列换手机
    public var isIphoneX:Bool{
        return statusBarHeight > 20 && isIpad == false ? true : false;
    }
    
    /// 获取window
    public let keyWindow:UIWindow = {
        var window:UIWindow!
//        if #available(iOS 13.0, *) {
//            window = UIApplication.shared.windows.filter({ $0.isKeyWindow }).last!
//        }else{
//            window = UIApplication.shared.keyWindow!;
//        }
        window = UIApplication.shared.delegate?.window!
        return window
    }()
    
    /// appstore 版本号
    public var appStoreVersion:String = ""
    
    /// 本地版本号
    public var localVersion:String = ""
    
    fileprivate var appId:String = "";
    
    private override init() {
        super.init()

    }
    
    /// 检查版本号是否超前
    /// - Parameters:
    ///   - appId: app id
    ///   - onResult: 返回是否超前
    public func checkVersion(appId: String, onResult: @escaping ((_ isPreRelease: Bool) -> ())) {
        self.getItunesAppVersion { versionStr in
            if let versionStr = versionStr {
                let itunesVersion = self.formatVersionString(version: versionStr)
                let localVersion = self.formatVersionString(version: self.getLocalAppVersion())
                onResult(itunesVersion < localVersion)
            }
        }
    }

    
    
    func getLocalAppVersion() -> String {
        self.localVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String;
        return self.localVersion;
    }
    
    func getItunesAppVersion(completion: @escaping (String?) -> Void) {
        let url = URL(string: "http://itunes.apple.com/lookup?id=\(appId)")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                print("请求失败:", error?.localizedDescription ?? "Unknown error")
                completion(nil)
                return
            }
            
            if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
               let results = json["results"] as? [[String: Any]],
               let version = results.first?["version"] as? String {
                self.appStoreVersion = version;
                completion(version)
            } else {
                print("无法解析响应数据")
                completion(nil)
            }
        }
        
        task.resume()
    }

    
    func formatVersionString(version: String) -> Int {
        let digitsOnly = version.replacingOccurrences(of: ".", with: "")
        
        var formattedVersion = digitsOnly
        
        while formattedVersion.count < 4 {
            formattedVersion += "0"
        }
        
        return formattedVersion.int()
    }
    
    
}
