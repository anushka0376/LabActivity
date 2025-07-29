/*:
## Exercise - Methods
 
 A `Book` struct has been created for you below. Add an instance method on `Book` called `description` that will print out facts about the book. Then create an instance of `Book` and call this method on that instance.
 */
struct Book {
    var title: String
    var author: String
    var pages: Int
    var price: Double
    
    func description() {
          print("This book is \(title), written by \(author). It has \(pages) pages and  price \(price)")
      }
    
}
let book = Book(title: "Harry Potter", author: "J. K. Rowling", pages: 223, price: 149.0)

book.description()

//:  A `Post` struct has been created for you below, representing a generic social media post. Add a mutating method on `Post` called `like` that will increment `likes` by one. Then create an instance of `Post` and call `like()` on it. Print out the `likes` property before and after calling the method to see whether or not the value was incremented.
struct Post {
    var message: String
    var likes: Int
    var numberOfComments: Int
    
    mutating func like() {
           likes = likes + 1
       }
    

}
var post = Post(message: "Hello, World!", likes: 1, numberOfComments: 1)
print(post.likes)
post.like()
print(post.likes)

/*:
[Previous](@previous)  |  page 5 of 10  |  [Next: App Exercise - Workout Functions](@next)
 */
