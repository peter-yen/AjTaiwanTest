import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
//        self.configure()
        self.setupRootVC()
        return true
    }
    
    private func setupRootVC() {
        window = UIWindow()
        window?.makeKeyAndVisible()
        let VC = ViewController()
        window?.rootViewController = VC
    }
    
//    private func configure() {
//        PowerMode.sparkColors = [.red, .blue, .yellow, .cyan]
//    }
}

