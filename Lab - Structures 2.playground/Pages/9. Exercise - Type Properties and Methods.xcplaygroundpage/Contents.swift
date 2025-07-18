/*:
## Exercise - Type Properties and Methods
 
 Imagine you have an app that requires the user to log in. You may have a `User` struct similar to that shown below. However, in addition to keeping track of specific user information, you might want to have a way of knowing who the current logged in user is. Create a `currentUser` type property on the `User` struct below and assign it to a `user` object representing you. Now you can access the current user through the `User` struct. Print out the properties of `currentUser`.
 */
struct User{
    static var currentUser = User(userName: "Michael", email: "michael@email.com", age: 23)
    var userName: String
    var email: String
    var age: Int
    
    static func logIn(user: User) {
        currentUser = user
        print("\(user.userName) has logged in.")
    }
}
print(User.currentUser.userName)
print(User.currentUser.email)
print(User.currentUser.age)
var user = User(userName: "James", email: "james@email.com", age: 23)
User.logIn(user: user)

/*:
[Previous](@previous)  |  page 9 of 10  |  [Next: App Exercise - Type Properties and Methods](@next)
 */
