import Foundation

class UserPreferencesService {
    
    func saveUser(userName: String?) {
        guard let userName = userName, userName != "" else { return }
        User(userName: userName).save()
    }
    
    func findUser() -> User? {
        return User.find() as? User
    }
}
