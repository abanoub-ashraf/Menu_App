import UIKit

class HamburgerViewController: UIViewController {

    // Configuration goes here
    var menuItem = "Hamburger"
    var font = UIFont(name: "Avenir", size: 22)
    var labelFont = UIFont(name: "AvenirNext-DemiBold", size: 36.0)

    // Subviews
    var imageView = UIImageView()
    var label = UILabel()
    var backButton = UIButton(type: .system)
    var orderButton = UIButton(type: .system)

    //Actions
    @IBAction func backButton(_ sender:UIButton){
        navigationController?.popViewController(animated: true)
    }

    //MARK: - Setup Methods

    func addImageView(){
        let image = UIImage(named: menuItem)
        imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = UIColor(named:menuItem + "Back")
        view.addSubview(imageView)
        // layout
    }

    func addLabel(){
        label.text = menuItem
        label.font = labelFont
        label.textColor = UIColor(named:menuItem + "Label")
        label.backgroundColor = UIColor(named:"WhiteLabelBackground")
        label.textAlignment = .left
        view.addSubview(label)
    }

    func addBackButton(){
        backButton.setTitle("Back", for: .normal)
        backButton.titleLabel?.font = font
        backButton.tintColor = UIColor(named:menuItem + "Background")
        backButton.backgroundColor = UIColor(named:menuItem + "Back")
        backButton.addTarget(self, action: #selector(backButton(_:)), for: .touchUpInside)
        view.addSubview(backButton)
    }

    func addOrderButton(){
        orderButton.setTitle("Order", for: .normal)
        orderButton.titleLabel?.font = font
        orderButton.tintColor = UIColor(named:menuItem + "Background")
        orderButton.backgroundColor = UIColor(named:menuItem + "Button")
        orderButton.addTarget(self, action: #selector(backButton(_:)), for: .touchUpInside)
        view.addSubview(orderButton)
    }

    func addViews(){
        view.backgroundColor = UIColor(named:menuItem + "Background")
        addImageView()
        addLabel()
        addBackButton()
        addOrderButton()
    }

    //MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = menuItem
        addViews()
        layoutViews()
    }

    //MARK: - Layout

    //Layout your views here
    func layoutViews() {
        imageView.isHidden = true

        // turn off this property of each view
        imageView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        orderButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false

        // visual language format uses strings, it needs help understanding the names of the views
        // this will identify the views inside of the strings
        let views: [String: Any] = [
            "imageView": imageView,
            "label": label,
            "orderButton": orderButton,
            "backButton": backButton
        ]

        // another dictionary for measurements
        let metrics: [String: Any] = [:]

        // this tells auto layout this is a horizontal constraint
        let horizontalConstraints = "H:|[backButton]-[orderButton]|"

        // this tells auto layout this is a vertical constraint
        let verticalConstraints = "V:[backButton]-[label]-|"

        // empty array to have the constraints appended to it
        var constraints = [NSLayoutConstraint]()

        // create constraints described by visual format string, horizontally
        constraints = NSLayoutConstraint.constraints(
                withVisualFormat: horizontalConstraints,
                options: .alignAllBottom,
                metrics: metrics,
                views: views
        )

        // create constraints described by visual format string, vertically
        constraints += NSLayoutConstraint.constraints(
                withVisualFormat: verticalConstraints,
                options: .alignAllTrailing,
                metrics: metrics,
                views: views
        )

        // activate the constraints that's in that array
        NSLayoutConstraint.activate(constraints)
    }

}


























