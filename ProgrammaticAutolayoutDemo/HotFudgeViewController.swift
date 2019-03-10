import UIKit

class HotFudgeViewController: UIViewController {
    //MARK: - Properties and Actions
    // Configuration goes here
    var menuItem = "Hot Fudge"
    var font = UIFont(name: "Avenir", size: 22)
    var labelFont = UIFont(name: "AvenirNext-DemiBold", size: 36.0)
    // Subviews
    var imageView = UIImageView()
    var label = UILabel()
    var backButton = UIButton(type: .system)
    var orderButton = UIButton(type: .system)
    
     // Constraint indices
   
    var orderButtonWidth = 0
    
    //Actions
    @IBAction func backButton(_ sender:UIButton){
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Setup Methods
    func addImageView(){
        let image = UIImage(named: menuItem)
        imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = UIColor(named:menuItem + "Button")?.withAlphaComponent(0.5)
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
    
    func sizeClassString(sizeClass:UIUserInterfaceSizeClass)->String{
        switch sizeClass{
        case .unspecified:
            return "unspecified"
        case .compact:
            return "compact"
        case .regular:
            return "regular"
        }
    }
    
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = menuItem
        navigationController?.isNavigationBarHidden = true
        addViews()
        layoutViews()
        
    }
    
    
    //MARK: - Layout
    
    //Layout your views here
    

    func layoutViews(){
        
        var constraints = [NSLayoutConstraint]()
        let views:[String:Any] = ["label":label,"imageView":imageView]
        let metrics:[String:Any] = ["labelHeight": label.intrinsicContentSize.height * 2.0]
        
        //image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|[imageView]|", options: .alignAllCenterX, metrics: metrics, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|[imageView]|", options: .alignAllCenterY, metrics: metrics, views: views)
        //Label
        label.translatesAutoresizingMaskIntoConstraints = false
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|-[label(labelHeight)]", options: .alignAllCenterX, metrics: metrics, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-[label]-|", options: .alignAllCenterY, metrics: metrics, views: views)
        //order and back button
        orderButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        // orderButton.leading = label.leading
        constraints += [NSLayoutConstraint.init(item: orderButton, attribute: .leading, relatedBy: .equal, toItem: label, attribute: .leading, multiplier: 1.0, constant: 0.0)]
        
        // orderButton.width = label.width * 4/6
        constraints += [NSLayoutConstraint.init(item: orderButton, attribute: .width, relatedBy: .equal, toItem: label, attribute: .width, multiplier: 3/6, constant: 0.0)]
        // orderbutton.height = orderbutton.intrinsicContentSize * 2.0
        constraints += [NSLayoutConstraint.init(item: orderButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: orderButton.intrinsicContentSize.height * 2.0)]
        
        // backbutton.width = orderButton.width
        constraints += [NSLayoutConstraint.init(item: backButton, attribute: .width, relatedBy: .equal, toItem: orderButton, attribute: .width, multiplier: 1.0, constant: 0.0)]
        // backbutton.height = orderButton.height
        constraints += [NSLayoutConstraint.init(item: backButton, attribute: .height, relatedBy: .equal, toItem: orderButton, attribute: .height, multiplier: 1.0, constant: 0.0)]
        // backbutton.bottom = view.margin.bottom
        constraints += [NSLayoutConstraint.init(item: backButton, attribute: .bottom, relatedBy: .equal, toItem: view.layoutMarginsGuide, attribute: .bottom, multiplier: 1.0, constant: 0.0)]
        // orderButton.width = label.width * 3/6
        constraints += [NSLayoutConstraint.init(item: orderButton, attribute: .width, relatedBy: .equal, toItem: label, attribute: .width, multiplier: 3/6, constant: 0.0)]
        // orderButton.leading = label.leading
        constraints += [NSLayoutConstraint.init(item: orderButton, attribute: .leading, relatedBy: .equal, toItem: label, attribute: .leading, multiplier: 1.0, constant: 0.0)]
        
        //MARK: Dyanamic Constraints
        
        // * backbutton.leading = orderButton.trailing + 10
        // Rw(orderButton.bottom = backButton.top + 10)
         constraints += [NSLayoutConstraint.init(item: orderButton, attribute: .trailing, relatedBy: .equal, toItem: backButton, attribute: .leading, multiplier: 1.0, constant: 10.0)]
        
        // * orderButton.top = backButton.top
        constraints += [NSLayoutConstraint.init(item: orderButton, attribute: .top, relatedBy: .equal, toItem: backButton, attribute: .top, multiplier: 1.0, constant: 0.0)]
        
        
        NSLayoutConstraint.activate(constraints)
    }
    
}
























