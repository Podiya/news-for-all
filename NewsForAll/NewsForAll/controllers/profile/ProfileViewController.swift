import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var userNameField: UITextField!
    let service = UserPreferencesService()
    var user: User! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
        user = service.findUser()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let user = user else { return }
        userNameField.text = user.userName
    }
    
    
    @IBAction func didPressSave(_ sender: UIButton) {
        dismissKeyboard()
        service.saveUser(userName: userNameField.text)
    }
    
    @objc func dismissKeyboard() {
        userNameField.resignFirstResponder()
    }
}
