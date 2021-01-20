
import Foundation


enum Role {
    case writer
    case reader
    case teacher
    case speaker
}

struct User {
    var name: String
    var canRead: Bool?
    var canWrite: Bool?
    var role: Role
}

class PermissionsModule {

    // properties
    
    private var user: User?

    // init
    
    init(user: User) {
        self.user = user
    }

    // open API

    func grandReadPermission(canRead: Bool) {
        user?.canRead = canRead
    }

    func grandWritePermission(canWrite: Bool) {
        user?.canWrite = canWrite
    }

    func canRead() -> Bool {
        return self.user?.canRead ?? false
    }

    func canWrite() -> Bool {
        return self.user?.canWrite ?? false
    }

    func setWriterRole() {
        self.user?.role = .writer
    }

    func setReaderRole() {
        self.user?.role = .reader
    }

    func getUser() -> User? {
        return self.user
    }
    
    func setNewUser(user: User) {
        self.user = user
    }
}


class Caller {
    
    // properties
    
    var users: [User] = []
    let permissionsModule: PermissionsModule

    // init
    
    init(module: PermissionsModule) {
        self.permissionsModule = module
    }
    
    // creating user funcs
    
    func addUser(name: String, role: Role) {
        let newUser = User(name: name, role: role)
        users.append(newUser)
    }
    
    func getUser(by name: String) -> User? {
        return users.filter({ $0.name == name }).first
    }
    
    // permission module funcs
    
    func setNewUserToPermissionsModule(user: User) {
        permissionsModule.setNewUser(user: user)
    }
    
    func setWritePermissionToUser() {
        permissionsModule.grandWritePermission(canWrite: true)
    }
}

