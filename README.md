# News For All

### Requirements
- Xcode 11.1
- Swift 5
- CocoaPods

### Installation - 
- Install cocoapods
`sudo gem install cocoapods`  

### Run application
- go to your project directory where the podfile is placed.
- run followings  
`pod install` - this will install all pod frameworks in to your project   
- run project with xcode

### (IHProgressHUD error)   
if you are expiriencing following error

**Fatal error: Unexpectedly found nil while unwrapping an Optional value: file /Users/user/Downloads/news-for-all/NewsForAll/Pods/IHProgressHUD/IHProgressHUD/Classes/IHProgressHUD.swift, line 369
2019-12-16 07:29:18.877559+0530 NewsForAll[4714:1650368] Fatal error: Unexpectedly found nil while unwrapping an Optional value: file /Users/user/Downloads/news-for-all/NewsForAll/Pods/IHProgressHUD/IHProgressHUD/Classes/IHProgressHUD.swift, line 369**

please chnage this code 

`if let appDelegate = UIApplication.shared.delegate,
                let window : UIWindow = appDelegate.window! {
                frame = window.bounds
            }`
            
into this

`frame = UIScreen.main.bounds`

