import UIKit
import Flutter
import VisionKit
import Vision

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
//    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
//    let scanDocsChannel = FlutterMethodChannel(name: "scanDocsChannel", binaryMessenger: controller.binaryMessenger)
//    scanDocsChannel.setMethodCallHandler({
//        (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
//        // note: this method is invoked in the UI thread!
//    })
    
    let viewFactory = ScanDocsViewFactory()
    
    registrar(forPlugin: "scanDocs")
        .register(viewFactory, withId: "ScanDocsView")
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

public class ScanDocsViewFactory: NSObject, FlutterPlatformViewFactory {
    public func create(
        withFrame frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?
    ) -> FlutterPlatformView {
        return ScanDocsView(frame, viewId: viewId, args: args)
    }
}

public class ScanDocsView : NSObject, FlutterPlatformView {
    let frame: CGRect
    let viewId: Int64
    init(_ frame: CGRect, viewId: Int64, args: Any?) {
        self.frame = frame
        self.viewId = viewId
    }
    
    public func view() -> UIView {
        return UISlider(frame: frame)
    }
}

//@available(iOS 13.0, *)
//private func scanDocuments(result: FlutterResult) {
//    let visionController = VNDocumentCameraViewController()
//    vc.delegate = documentCameraViewController
//    present(vc, animated: true)
//}
//
//@available(iOS 13.0, *)
//private func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
//    print("Found " + String(scan.pageCount) + " pages.")
//}
//
//@available(iOS 13.0, *)
//class CameraViewController: UIViewController, VNDocumentCameraViewControllerDelegate {
//    func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
//        // You are responsible for dismissing the controller.
//        controller.dismiss(animated: true)
//    }
//
//    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
//        // You should handle errors appropriately in your app.
//        print(error)
//
//        // You are responsible for dismissing the controller.
//        controller.dismiss(animated: true)
//    }
//
//}
