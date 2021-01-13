//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import RxSwift
class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .black
        
        view.addSubview(label)
        self.view = view
        //1
        typealias Completed = (Int, Bool) -> Void

        //2
        func add(a: Int, b: Int, completed: Completed) {
            let result = a + b
            completed(result, true)
        }

        //3
        let myComplete = { (result: Int, done: Bool) in
            if done {
                print("Result: \(result)")
            } else {
                print("Failed")
            }
        }

        //4
        add(a: 10, b: 25) { (result, done) in
            if done {
                print("Result: \(result)")
            } else {
                print("Failed")
            }
        }
        add(a: 10, b: 25){(result,done) in
            
            if done {
                print("Result: \(result)")
            } else {
                print("Failed")
            }
        }
        add(a: 10, b: 25, completed: {(result,done) in
            if done {
                print("Result: \(result)")
            } else {
                print("Failed")
            }
            
        })
    }
}

public func example(of description: String, action: () -> Void) {
  print("\n--- Example of:", description, "---")
    action() }
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()


