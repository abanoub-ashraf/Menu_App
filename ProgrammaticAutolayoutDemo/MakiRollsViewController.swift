import UIKit

class MakiRollsViewController: UIViewController {

    //MARK: - Properties and Actions

    // Configuration goes here
    var menuItem = "Maki Rolls"
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
        // array of views that's gonna be inside the stack
        let subViews: [UIView] = [imageView, orderButton, backButton, label]

        // initialize a stackView and give it the array of its sub views
        let stackView = UIStackView(arrangedSubviews: subViews)

        // the direction of how the subviews are gonna be stacked inside
        stackView.axis = .vertical

        // the alignment of your views in each cell
        stackView.alignment = .fill

        // decide the size of each cell in the stack
        stackView.distribution = .fillEqually

        // add the stackView to the super view
        view.addSubview(stackView)

        // turn off this property of it
        stackView.translatesAutoresizingMaskIntoConstraints = false

        // initialize an empty array for the constraints
        var constraints = [NSLayoutConstraint]()

        // horizontal constraint in visual format and appended to the array
        constraints += NSLayoutConstraint.constraints(
                withVisualFormat: "H:|-[stackView]-|",
                options: .alignAllCenterY,
                metrics: nil,
                views: ["stackView": stackView]
        )

        // vertical constraint in visual format and appended to the array
        constraints += NSLayoutConstraint.constraints(
                withVisualFormat: "V:|-[stackView]-|",
                options: .alignAllCenterX,
                metrics: nil,
                views: ["stackView": stackView]
        )

        // activate the array of constraints
        NSLayoutConstraint.activate(constraints)
    }

}