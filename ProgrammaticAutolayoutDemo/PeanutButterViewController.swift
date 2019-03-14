import UIKit

class PeanutButterViewController: UIViewController {
    //MARK: - Properties and Actions
    // Configuration goes here
    var menuItem = "Peanut Butter"
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

        navigationController?.isNavigationBarHidden = false
        imageView.isHidden = false

        imageView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        orderButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false

        let views: [String: Any] = [
            "imageView": imageView,
            "label": label,
            "orderButton": orderButton,
            "backButton": backButton
        ]

        let marginSpace: CGFloat = 10
        let padding: CGFloat = 20

        view.directionalLayoutMargins.top = marginSpace
        view.directionalLayoutMargins.leading = marginSpace
        view.directionalLayoutMargins.bottom = marginSpace * 2.0
        view.directionalLayoutMargins.trailing = marginSpace

        let metrics: [String: Any] = [
            "padding": padding,
            "height": padding * 3.0
        ]

        let bottomHConstraints = "H:|-[backButton]-padding-[orderButton]-|"
        let bottomVConstraints = "V:[backButton(height)]-|"

        let topHConstraints = "H:|-[label]-|"
        let topVConstraints = "V:|-[label(height)]-padding-[imageView]"

        var constraints = [NSLayoutConstraint]()

        constraints += NSLayoutConstraint.constraints(
                withVisualFormat: topHConstraints,
                options: .alignAllTop,
                metrics: metrics,
                views: views
        )

        constraints += NSLayoutConstraint.constraints(
                withVisualFormat: topVConstraints,
                options: .alignAllLeading,
                metrics: metrics,
                views: views
        )

        constraints += NSLayoutConstraint.constraints(
                withVisualFormat: bottomHConstraints,
                options: .alignAllFirstBaseline,
                metrics: metrics,
                views: views
        )

        constraints += NSLayoutConstraint.constraints(
                withVisualFormat: bottomVConstraints,
                options: .alignAllLeading,
                metrics: metrics,
                views: views
        )

        // imageView.height = view.height * 1/4
        constraints += [NSLayoutConstraint.init(
                item: imageView, attribute: .height,
                relatedBy: .equal,
                toItem: view, attribute: .height,
                multiplier: 1/4, constant: 0.0
        )]

        // imageView.width = imageView.height * 3/2
        constraints += [NSLayoutConstraint.init(
                item: imageView, attribute: .width,
                relatedBy: .equal,
                toItem: imageView, attribute: .height,
                multiplier: 3/2, constant: 0.0
        )]

        // orderButton.width = backButton.width * 2/3
        constraints += [NSLayoutConstraint.init(
                item: orderButton, attribute: .width,
                relatedBy: .equal,
                toItem: backButton, attribute: .width,
                multiplier: 2/3, constant: 0.0
        )]

        // orderButton.height = backButton.height
        constraints += [NSLayoutConstraint.init(
                item: orderButton, attribute: .height,
                relatedBy: .equal,
                toItem: backButton, attribute: .height,
                multiplier: 1.0, constant: 0.0
        )]

        NSLayoutConstraint.activate(constraints)
    }

}

















