import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.setupRootVC()
        return true
    }
    
    private func setupRootVC() {
        window = UIWindow()
        window?.makeKeyAndVisible()
        let tabBarVC = TabBarViewController()
        window?.rootViewController = tabBarVC
    }
}

