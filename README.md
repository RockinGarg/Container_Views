# Container_Views

Add Other ViewControllers As subview in Container View 

# Code Used

**Reference to Controller to be added as Subview**

      private lazy var FirstObject: firstVC =
      {
        // Instantiate View Controller
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "firstVC") as! firstVC
        
        // Add View Controller as Child View Controller
        self.addChildViewController(viewController)
        return viewController
      }()
      
* Used Table Views As Subview in Second Controller Thus, Complex Designs can also be implemnted in same manner

# Adding subview to Container View

     private func add(asChildViewController viewController: UIViewController)
    {
        // Configure Child View
        viewController.view.frame = CGRect(x: 0, y: 0, width: self.firstContainer.frame.size.width, height: self.firstContainer.frame.size.height)
        
        // Add Child View Controller
        addChildViewController(viewController)
        viewController.view.translatesAutoresizingMaskIntoConstraints = true
        
        // Add Child View as Subview
        firstContainer.addSubview(viewController.view)
        
        // Notify Child View Controller
        viewController.didMove(toParentViewController: self)
    }
    
**Subviews Are being managed using code So, If required Added VC as Subview can aslo be Removed using**

     private func remove(asChildViewController viewController: UIViewController)
    {
        // Notify Child View Controller
        viewController.willMove(toParentViewController: nil)
        
        secondContainer.willRemoveSubview(viewController.view)
        
        // Remove Child View From Superview
        viewController.view.removeFromSuperview()
        
        // Notify Child View Controller
        viewController.removeFromParentViewController()
    }
      
# Expected Output

![simulator screen shot - iphone 8 plus - 2018-01-19 at 12 06 44](https://user-images.githubusercontent.com/26831784/35137808-3f986ff2-fd11-11e7-8c5c-b8f7f6fbebf5.png)
