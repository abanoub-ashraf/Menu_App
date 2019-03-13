import UIKit

class CoffeeViewController: UIViewController {
    
    // some configurations
    var menuItem = "Coffee"
    var font = UIFont(name: "Avenir", size: 22)
    var labelFont = UIFont(name: "AvenirNext-DemiBold", size: 36.0)

    // the UI subviews
    var imageView = UIImageView()
    var label = UILabel()
    var backButton = UIButton(type: .system)
    var orderButton = UIButton(type: .system)

    // the action that the button does, it's gonna be hooked up with the buttons
    @IBAction func backButton(_ sender:UIButton) {
        navigationController?.popViewController(animated: true)
    }

    // configure the image and add it to the main view
    func addImageView() {
        // create an image
        let image = UIImage(named: menuItem)
        // then use it for the imageView on the screen
        imageView = UIImageView(image: image)
        // set its content mode
        imageView.contentMode = .scaleAspectFill
        view.addSubview(imageView)
        // layout
    }

    // configure the label and add it to the main view
    func addLabel() {
        // set its text and font from the configurations variables above
        label.text = menuItem
        label.font = labelFont
        // set the color of its text
        label.textColor = UIColor(named:menuItem + "Label")
        // set the color of its background
        label.backgroundColor = UIColor(named:"WhiteLabelBackground")
        label.textAlignment = .left
        view.addSubview(label)
    }

    // configure the addBack button and add it to the main view
    func addBackButton() {
        // set its title, the font of its title label, its tint color, & its background color
        backButton.setTitle("Back", for: .normal)
        backButton.titleLabel?.font = font
        backButton.tintColor = UIColor(named:menuItem + "Background")
        backButton.backgroundColor = UIColor(named:menuItem + "Back")
        // set the action that this button does (use the @IBAction function for this)
        // so make an IBAction method for this button first
        backButton.addTarget(self, action: #selector(backButton(_:)), for: .touchUpInside)
        view.addSubview(backButton)
    }

    // configure the addOrder button and add it to the main view
    func addOrderButton() {
        orderButton.setTitle("Order", for: .normal)
        orderButton.titleLabel?.font = font
        orderButton.tintColor = UIColor(named:menuItem + "Background")
        orderButton.backgroundColor = UIColor(named:menuItem + "Button")
        orderButton.addTarget(self, action: #selector(backButton(_:)), for: .touchUpInside)
        view.addSubview(orderButton)
    }

    // a method to add all the views we created and configured
    func addViews() {
        // set the background of the main view
        view.backgroundColor = UIColor(named:menuItem + "Background")
        addImageView()
        addLabel()
        addBackButton()
        addOrderButton()
    }

    // a method to place the views on the screen
    func layoutViews() {
        // frame describes the view’s location and size in its superview’s coordinate system
        // consists of origin which starts from the top left corner and size which is width and height
        imageView.frame = CGRect(
                origin: CGPoint(x:0,y:0),
                size: CGSize(width: 300, height: 300)
        )
        // or we can put the 4 things together like this
        label.frame = CGRect(x: 0, y: 310, width: 300, height: 40)
        orderButton.frame = CGRect(x: 0, y: view.frame.height - 50, width: 150, height: 40)
        backButton.frame = CGRect(x: 170, y: view.frame.height - 50, width: 150, height: 40)
    }

    // call addViews and layoutViews function in hereto let the views appear on the screen
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = menuItem
        addViews()
        layoutViews()
    }
    
}










