import UIKit

class PastaViewController: UIViewController {
    //MARK: - Properties and Actions
    // Configuration goes here
    var menuItem = "Pasta"
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
        imageView.backgroundColor = UIColor(named: menuItem + "Button")?.withAlphaComponent(0.25)
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
    func layoutViews(){
        navigationController?.isNavigationBarHidden = true
        
        
        //autoresiszing masks
        imageView.translatesAutoresizingMaskIntoConstraints = false
        orderButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints   = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        // changes to views
        imageView.contentMode = .scaleAspectFit
        label.font = label.font.withSize(72)
        orderButton.titleLabel?.font = orderButton.titleLabel?.font.withSize(64)
        backButton.titleLabel?.font = backButton.titleLabel?.font.withSize(48)
        
        
        // priorities for views
        
        
        var constraints = [NSLayoutConstraint]()
        let layoutViews:[String:Any] = ["imageView":imageView,"label":label,"orderButton":orderButton]
        let metrics:[String:Any] = [:]
        let HConstraint = "H:|-10-[imageView]-10-|"
        let VConstraint = "V:|[imageView]-10-[label]-20-[orderButton]-20-|"
        constraints += NSLayoutConstraint.constraints(withVisualFormat: HConstraint, options: .alignAllCenterY, metrics: metrics, views: layoutViews)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: VConstraint, options: .alignAllLeading, metrics: metrics, views: layoutViews)
        
        
        //Constraints for Back button
        // backButton.leading = orderButton.trailing + 10
        constraints += [NSLayoutConstraint(item: backButton, attribute: .leading, relatedBy: .equal, toItem: orderButton, attribute: .trailing, multiplier: 1.0, constant: 10.0)]
        // backButton.top = orderButton.top
        constraints += [NSLayoutConstraint(item: backButton, attribute: .top, relatedBy: .equal, toItem: orderButton, attribute: .top, multiplier: 1.0, constant: 0.0)]
        // backButton.bottom = orderButton.bottom
        constraints += [NSLayoutConstraint(item: backButton, attribute: .bottom, relatedBy: .equal, toItem: orderButton, attribute: .bottom, multiplier: 1.0, constant: 0.0)]
        // backButton.trailing = imageView.trailing
        constraints += [NSLayoutConstraint(item: backButton, attribute: .trailing, relatedBy: .equal, toItem: imageView, attribute: .trailing, multiplier: 1.0, constant: 0.0)]
        // backButton.width = orderButton.width
        constraints += [NSLayoutConstraint(item: backButton, attribute: .width, relatedBy: .equal, toItem: orderButton, attribute: .width, multiplier: 1.0, constant:0.0)]
        // label.trailing = imageview.trailing
         constraints += [NSLayoutConstraint(item: label, attribute: .trailing, relatedBy: .equal, toItem: imageView, attribute: .trailing, multiplier: 1.0, constant: 0.0)]
        
        
        
        //add constraints
        NSLayoutConstraint.activate(constraints)
    
    }
    
    
    
}

















