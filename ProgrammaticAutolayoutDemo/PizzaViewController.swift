import UIKit

class PizzaViewController: UIViewController {
    //MARK: - Properties and Actions
    // Configuration goes here
    var menuItem = "Pizza"
    var font = UIFont(name: "Avenir", size: 72)
    var labelFont = UIFont(name: "AvenirNext-DemiBold", size: 136)
    //var labelFont = UIFont.preferredFont(forTextStyle: .headline)
    
    // Controls
    var imageView = UIImageView()
    var label = UILabel()
    var descriptionLabel = UILabel()
    var backButton = UIButton(type: .system)
    var orderButton = UIButton(type: .system)
    //Subviews
    
    
    //Actions
    @IBAction func backButton(_ sender:UIButton){
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Setup Methods For Controls
    func addImageView(){
        let image = UIImage(named: menuItem)
        imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = UIColor(named: menuItem + "Button")?.withAlphaComponent(0.25)
        //view.addSubview(imageView)
        // layout
    }
    
    func addLabel(){
        label.text = menuItem
        label.font = labelFont
        label.textColor = UIColor(named:menuItem + "Label")
        label.backgroundColor = UIColor(named:"WhiteLabelBackground")
        label.textAlignment = .left
        //view.addSubview(label)
    }
    
    func addDescriptionLabel(){
        descriptionLabel.text = "Our pizzas are made of the finest ingredients and then wood fired"
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.font = UIFont(name: "Avenir", size: 26)
        descriptionLabel.textColor = UIColor(named:menuItem + "Label")
        descriptionLabel.backgroundColor = UIColor(named:"WhiteLabelBackground")
        descriptionLabel.textAlignment = .natural
        //view.addSubview(label)
    }
    
    func addBackButton(){
        backButton.setTitle("Back", for: .normal)
        backButton.titleLabel?.font = font
        backButton.tintColor = UIColor(named:menuItem + "Background")
        backButton.backgroundColor = UIColor(named:menuItem + "Back")
        backButton.addTarget(self, action: #selector(backButton(_:)), for: .touchUpInside)
        //view.addSubview(backButton)
    }
    
    func addOrderButton(){
        orderButton.setTitle("Order", for: .normal)
        orderButton.titleLabel?.font = font
        orderButton.tintColor = UIColor(named:menuItem + "Background")
        orderButton.backgroundColor = UIColor(named:menuItem + "Button")
        orderButton.addTarget(self, action: #selector(backButton(_:)), for: .touchUpInside)
        //view.addSubview(orderButton)
    }
    
    //MARK: - Subviews
    func addButtonView(){
    
        
        
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    func addLabelView(){
        //label and image
       /*
        addImageView()
        addLabel()
        labelView.addSubview(label)
        labelView.addSubview(imageView)
        label.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
       
        labelView.addConstraints(constraints)
         */
    }
    
    //MARK: - Life Cycle
    func addViews(){
        view.backgroundColor = UIColor(named:menuItem + "Background")
        addImageView()
        addLabel()
        addBackButton()
        addOrderButton()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = menuItem
        view.backgroundColor = UIColor(named:menuItem + "Background")
        addViews()
        layoutViews()
    
    }
    
    
    //MARK: - Layout
    
    //Layout your views here
    func layoutViews(){
        navigationController?.isNavigationBarHidden = true
        //add subviews
        
        
        //root stack view
        let stackSubviews:[UIView] = []
        let stackView = UIStackView(arrangedSubviews: stackSubviews)
        view.addSubview(stackView)
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        var constraints = [NSLayoutConstraint]()
       
        //equal margins
        let views = ["stackView":stackView]
        let constraint = "|-[stackView]-|"
        constraints += NSLayoutConstraint.constraints(withVisualFormat: constraint, options: .alignAllCenterY, metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "V:" + constraint, options: .alignAllCenterX, metrics: nil, views: views)
        
        NSLayoutConstraint.activate(constraints)
    }
    
}

























