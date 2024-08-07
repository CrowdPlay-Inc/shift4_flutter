import Flutter
import UIKit
import VNWebSDK

public class Shift4SdkPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "shift4_sdk", binaryMessenger: registrar.messenger())
    let instance = Shift4SdkPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "initialize":
        guard let args = call.arguments as? [String : Any] else {result(false); return;}
        
        let org = args["org"] as? String
        if org == nil {
            result(false)
            return;
        }
        
        let instance: String = args["instance"] as? String ?? ""
        let env: String = args["env"] as? String ?? ""
        
        VenueNextWeb.shared.initialize(org!, instance: instance, env: instance)
        result(true)
    case "setUser":
        guard let args = call.arguments as? [String : Any] else {result(false); return;}
        
        let userId = args["userId"] as? String
        if userId == nil {
            result(false)
            return
        }
        
        let email = args["email"] as? String
        let firstName = args["firstName"] as? String
        let lastName = args["lastName"] as? String
        let phoneNumber = args["phoneNumber"] as? String
        let provider = args["provider"] as? String
        let accessToken = args["accessToken"] as? String
        
        VenueNextWeb.shared.setUser(
            User(userId!,
                 email: email,
                 firstName: firstName,
                 lastName: lastName,
                 phoneNumber: phoneNumber,
                 provider: provider,
                 accessToken: accessToken)
        )
        
        result(true)
    case "logUserOut":
        VenueNextWeb.shared.logUserOut()

        result(true)
    case "openWallet":
        guard let rootViewController = UIApplication.shared.keyWindow?.rootViewController, let url = URL(string: "theapp://vn/wallet") else {result(false); return;}
        
        VenueNextWeb.handle(url: url, presenter: rootViewController, completion: nil)
        result(true)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
