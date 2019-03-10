import UIKit

class CakeViewController: UIViewController {
    //MARK: - Properties and Actions
    // Configuration goes here
    var menuItem = "Cake"
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
        imageView.contentMode = .scaleAspectFill
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
        addViews()
        layoutViews()
    }
    
    override func viewWillLayoutSubviews() {
        
        print("----------\n\n")
        print("Horizontal Size Class: " + sizeClassString(sizeClass: traitCollection.horizontalSizeClass) )
        print("Vertical Size Class: " + sizeClassString(sizeClass: traitCollection.verticalSizeClass) )
        
        let widthSizeClass = traitCollection.horizontalSizeClass
        let heightSizeClass = traitCollection.verticalSizeClass
        
        var constraints = view.constraints
        NSLayoutConstraint.deactivate(constraints)
        let pinIndex = constraints.index { (constraint) -> Bool in
            constraint.identifier  == "pin"
        }
        let alignIndex = constraints.index { (constraint) -> Bool in
            constraint.identifier == "align"
        }
        
        
        
        if widthSizeClass == .regular && heightSizeClass == .regular{
            print("iPad")
            label.font = labelFont?.withSize(72)
            orderButton.titleLabel?.font = font?.withSize(48)
            backButton.titleLabel?.font = font?.withSize(48)
            //orderButton.bottom  = backbutton.top + 10
            constraints[pinIndex!] = NSLayoutConstraint.init(item: orderButton, attribute: .bottom, relatedBy: .equal, toItem: backButton, attribute: .top, multiplier: 1.0, constant: 10.0)
            constraints[pinIndex!].identifier = "pin"
            //orderButton.leading = backButton.leading
            constraints[alignIndex!] = NSLayoutConstraint.init(item: orderButton, attribute: .leading, relatedBy: .equal, toItem: backButton, attribute: .leading, multiplier: 1.0, constant: 0.0)
            constraints[alignIndex!].identifier = "align"
            
        }
        else {
            if heightSizeClass == .compact{
                print("iPhone Landscape")
                label.font = labelFont
                orderButton.titleLabel?.font = font
                backButton.titleLabel?.font = font
                //orderButton.bottom  = backbutton.top + 10
                constraints[pinIndex!] = NSLayoutConstraint.init(item: orderButton, attribute: .bottom, relatedBy: .equal, toItem: backButton, attribute: .top, multiplier: 1.0, constant: 10.0)
                constraints[pinIndex!].identifier = "pin"
                //orderButton.leading = backButton.leading
                constraints[alignIndex!] = NSLayoutConstraint.init(item: orderButton, attribute: .leading, relatedBy: .equal, toItem: backButton, attribute: .leading, multiplier: 1.0, constant: 0.0)
                constraints[alignIndex!].identifier = "align"
                
            }
            else {
                print("iPhone Portrait")
                label.font = labelFont
                orderButton.titleLabel?.font = font
                backButton.titleLabel?.font = font
                //orderButton.trailing = backButton.leading + 10
                constraints[pinIndex!] = NSLayoutConstraint.init(item: orderButton, attribute: .trailing, relatedBy: .equal, toItem: backButton, attribute: .leading, multiplier: 1.0, constant: 10.0)
                constraints[pinIndex!].identifier = "pin"
                //orderButton.top = backbutton.top
                constraints[alignIndex!] = NSLayoutConstraint.init(item: orderButton, attribute: .top, relatedBy: .equal, toItem: backButton, attribute: .top, multiplier: 1.0, constant: 0.0)
                constraints[alignIndex!].identifier = "align"
                
            }
        }
        //print("----------\n\n\n\n")
        
        
        NSLayoutConstraint.activate(constraints)
        
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
        let pin = NSLayoutConstraint.init(item: orderButton, attribute: .trailing, relatedBy: .equal, toItem: backButton, attribute: .leading, multiplier: 1.0, constant: 10.0)
        pin.identifier = "pin"
        constraints += [pin]
        
        // * orderButton.top = backButton.top
        let align = NSLayoutConstraint.init(item: orderButton, attribute: .top, relatedBy: .equal, toItem: backButton, attribute: .top, multiplier: 1.0, constant: 0.0)
        align.identifier = "align"
        constraints += [align]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    
}

















