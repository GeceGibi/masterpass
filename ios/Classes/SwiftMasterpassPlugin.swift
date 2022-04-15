import Flutter
import UIKit
import MCCMerchant

public class SwiftMasterpassPlugin: NSObject, FlutterPlugin, FlutterStreamHandler {
    
    
    private var eventSink: FlutterEventSink?
    
    /// Plugin registration
    public static func register(with registrar: FlutterPluginRegistrar) {
        
        let instance = SwiftMasterpassPlugin()
        
        let channel = FlutterMethodChannel(name: "masterpass", binaryMessenger: registrar.messenger())
        let eventChannel = FlutterEventChannel(name: "masterpass/stream", binaryMessenger: registrar.messenger())
        
        registrar.addMethodCallDelegate(instance, channel: channel)
        registrar.addApplicationDelegate(instance)
        
        eventChannel.setStreamHandler(instance)
    }
    
    public func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        eventSink = events
        return nil
    }
    
    public func onCancel(withArguments arguments: Any?) -> FlutterError? {
        eventSink = nil
        return nil
    }
    
    //    public func applicationDidBecomeActive(_ application: UIApplication) {
    //        debugPrint("applicationDidBecomeActive")
    //    }
    //
    //    public func applicationWillTerminate(_ application: UIApplication) {
    //        debugPrint("applicationWillTerminate")
    //    }
    //
    //    public func applicationWillResignActive(_ application: UIApplication) {
    //        debugPrint("applicationWillResignActive")
    //    }
    //
    //    public func applicationDidEnterBackground(_ application: UIApplication) {
    //        debugPrint("applicationDidEnterBackground")
    //    }
    //
    //    public func applicationWillEnterForeground(_ application: UIApplication) {
    //        print("applicationWillEnterForeground")
    //    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "initialize":
            initialize(arguments: call.arguments as! NSDictionary, result: result)
            
        case "checkout":
            checkout(result: result)
            
        default:
            result(FlutterMethodNotImplemented)
        }
    }
    
    private func checkout(result: @escaping FlutterResult){
        // final manager = MerchantCheckoutManager(result: result)
    }
    
    private func initialize(arguments: NSDictionary, result: @escaping FlutterResult){
        
        let configuration: MCCConfiguration = MCCConfiguration()
        /// The application locale.
        /// Note that this is used by the SDK when deciding whether to use the native checkout experience or the web checkout experience (as initially not all regions will support native checkout).
        let locale = arguments["locale"] as! String?
        
        /// Merchant name to be used in checkout UI.
        let name = arguments["name"] as! String
        
        /// Unique id for user. This will be used for express checkout pairing.
        let id = arguments["id"] as! String
        
        /// Boolean flag specifying whether the app is enabled for express checkout.
        let expressCheckoutEnabled = arguments["expressCheckoutEnabled"] as! Bool?
        
        /// The merchantCountryCode to be used for suppress 3DS during checkout.
        let merchantCountryCode = arguments["merchantCountryCode"] as! String?
        
        if (expressCheckoutEnabled != nil){
            configuration.expressCheckoutEnabled = expressCheckoutEnabled!
        }
        
        if (locale != nil){
            configuration.locale = Locale(identifier: locale!)
        }
        
        configuration.merchantCountryCode = merchantCountryCode
        configuration.merchantName = name
        configuration.merchantUserId = id
        
        MCCMerchant.initializeSDK(with: configuration) { (status:[AnyHashable : Any], error: Error?) -> Void in
            let statusDictionary = status as? [String:AnyObject]
            let statusCode: Int = (statusDictionary?[kInitializeStateKey]?.intValue)!
            
            self.eventSink?(statusCode)
            
//            switch (MCCInitializationState(rawValue: statusCode)!) {
//            case .started:
//                self.eventSink?("started")
//                break
//
//            case .completed:
//                self.eventSink?("completed")
//                break
//
//            case .fail:
//                self.eventSink?("fail")
//                break
//
//            @unknown default:
//                self.eventSink?("error")
//            }
        }
    }
}

