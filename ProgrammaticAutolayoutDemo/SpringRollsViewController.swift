import UIKit

class SpringRollsViewController: UIViewController {
    //MARK: - Properties and Actions
    // Configuration goes here
    var menuItem = "Spring Rolls"
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
        imageView.contentMode = .scaleAspectFit

        // first nested stack view
        let buttonStack: [UIView] = [orderButton, backButton]
        let buttonStackView = UIStackView(arrangedSubviews: buttonStack)
        buttonStackView.axis = .vertical
        buttonStackView.alignment = .fill
        buttonStackView.distribution = .fill
        buttonStackView.spacing = 10

        // second nested stack view
        let labelStack: [UIView] = [label, imageView]
        let labelStackView = UIStackView(arrangedSubviews: labelStack)
        labelStackView.axis = .vertical
        labelStackView.alignment = .fill
        labelStackView.distribution = .fill
        labelStackView.spacing = 10

        // container stack view
        let subViews: [UIView] = [labelStackView, buttonStackView]
        let stackView = UIStackView(arrangedSubviews: subViews)
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 10

        view.addSubview(stackView)

        stackView.translatesAutoresizingMaskIntoConstraints = false

        var constraints = [NSLayoutConstraint]()

        constraints += NSLayoutConstraint.constraints(
                withVisualFormat: "H:|-[stackView]-|",
                options: .alignAllCenterY,
                metrics: nil,
                views: ["stackView": stackView]
        )

        constraints += NSLayoutConstraint.constraints(
                withVisualFormat: "V:|-[stackView]-|",
                options: .alignAllCenterX,
                metrics: nil,
                views: ["stackView": stackView]
        )

        // buttonStackView.width = stackView.width * 2/9
        constraints += [NSLayoutConstraint.init(
                item: buttonStackView, attribute: .width,
                relatedBy: .equal,
                toItem: stackView, attribute: .width,
                multiplier: 2/9, constant: 0.0
        )]

        // backButton.height = buttonStackView.height * 3/9
        constraints += [NSLayoutConstraint.init(
                item: backButton, attribute: .height,
                relatedBy: .equal,
                toItem: buttonStackView, attribute: .height,
                multiplier: 3/9, constant: 0.0
        )]

        // label.height = labelStackView.height * 1/9
        constraints += [NSLayoutConstraint.init(
                item: label, attribute: .height,
                relatedBy: .equal,
                toItem: labelStackView, attribute: .height,
                multiplier: 1/9, constant: 0.0
        )]

        // activate the array of constraints
        NSLayoutConstraint.activate(constraints)
    }
    
}

















