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
        navigationController?.isNavigationBarHidden = true
        imageView.isHidden = false

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

        // MARK: - Constraints Strings

        // this tells auto layout this is a horizontal constraint (from left to right)
        // (pipe) | represents the super view
        // - represents the space between sub views, or between sub view and super view
        // removing the - means no space between sub view and its super view
        // value between 2 dashes represent the space you want between the views
        // | defaults to the safeView if there's no spacing, and to the super view if there is
        /**** 15 between backButton's leading and super view's leading
              10 between backButton's trailing and orderButton's leading
              default value between orderButton's trailing and super view's trailing ****/
        // to make the size of the backButton is equal to the size of the orderButton
        //let horizontalConstraints = "H:|-15-[backButton(==orderButton)]-10-[orderButton]-|"
        let horizontalConstraints = "H:|-15-[backButton]-10-[orderButton]-|"

        // this tells auto layout this is a vertical constraint (from top to down)
        // pin tha backButton to the safe view's top with 20 of space
        // [backButton]" means the bottom of the backButton will float
        // the 20 was making the button cross the safe area so remove it just | means don't cross it
        let verticalConstraints = "V:|-[backButton(70)]"

        // pin the leading and trailing of the label with the leading and trailing of safe view
        let labelHConstraints = "H:|-[label]-|"

        /**** 20 between the bottom of the label with the bottom to the super view
              20 between the top of the label with the bottom of the image
              the top of the image will float ****/
        // V:[label] means the top of the label will float
        // (100) is the size we set to the label
        let labelVConstraints = "V:[imageView]-20-[label(100)]-20-|"

        // MARK: - Append to the array

        // empty array to have the constraints appended to it
        var constraints = [NSLayoutConstraint]()

        // create constraints described by visual format string, horizontally
        // add the horizontalConstraints constraint to the array
        constraints += NSLayoutConstraint.constraints(
                withVisualFormat: horizontalConstraints,
                options: .alignAllTop,
                metrics: metrics,
                views: views
        )

        // add the verticalConstraints constraint to the array
        constraints += NSLayoutConstraint.constraints(
                withVisualFormat: verticalConstraints,
                options: .alignAllLeading,
                metrics: metrics,
                views: views
        )

        // add the labelHConstraints constraint to the array
        constraints += NSLayoutConstraint.constraints(
                withVisualFormat: labelHConstraints,
                options: .alignAllTop,
                metrics: metrics,
                views: views
        )

        // add the labelVConstraints constraint to the array
        constraints += NSLayoutConstraint.constraints(
                withVisualFormat: labelVConstraints,
                options: .alignAllLeading,
                metrics: metrics,
                views: views
        )

        // imageView.width = label.width
        constraints += [NSLayoutConstraint.init(
                item: imageView, attribute: .width,
                relatedBy: .equal,
                toItem: label, attribute: .width,
                multiplier: 1.0, constant: 0.0
        )]

        // aspect ratio for the image, aspectFit needs it to work
        // imageView.width = imageView.height * 3/2
        constraints += [NSLayoutConstraint.init(
                item: imageView, attribute: .width,
                relatedBy: .equal,
                toItem: imageView, attribute: .height,
                multiplier: 3/2, constant: 0.0
        )]

        // orderButton.width = backButton.width * 3/2
        constraints += [NSLayoutConstraint.init(
                item: orderButton, attribute: .width,
                relatedBy: .equal,
                toItem: backButton, attribute: .width,
                multiplier: 3/2, constant: 0.0
        )]

        // orderButton.height = backButton.height
        /**** now the value 70 in this line
              "let verticalConstraints = "V:|-[backButton(70)]"" above
              is gonna be the height of them both ****/
        constraints += [NSLayoutConstraint.init(
                item: orderButton, attribute: .height,
                relatedBy: .equal,
                toItem: backButton, attribute: .height,
                multiplier: 1.0, constant: 0.0
        )]

        // activate the constraints that's been added to constraints array
        NSLayoutConstraint.activate(constraints)
    }

}


























