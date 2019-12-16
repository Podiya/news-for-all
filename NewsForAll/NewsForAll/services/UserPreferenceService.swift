import Foundation

class UserPreferencesService {
    
    func saveUser(userName: String?) -> User? {
        guard let userName = userName, userName != "" else { return nil }
        return User(userName: userName).save() as? User
    }
    
    func findUser() -> User? {
        return User.find() as? User
    }
}
