import UIKit
import NotificationBannerSwift

class Alert {
    
    static let shared = Alert()
    private var banner: NotificationBanner!
    private init() {}
    
    func success(title: String? = nil, subtitle: String? = nil) {
        self.show(title: title, subtitle: subtitle, style: BannerStyle.success)
    }
    
    func danger(title: String? = nil, subtitle: String? = nil) {
        self.show(title: title, subtitle: subtitle, style: BannerStyle.danger)
    }
    
    private func show(title: String? = nil, subtitle: String? = nil, style: BannerStyle) {
        if let _ = banner {
            self.banner.remove()
        }
        self.banner = NotificationBanner(title: title, subtitle: subtitle, style: style)
        self.banner.show()
    }
    
}
