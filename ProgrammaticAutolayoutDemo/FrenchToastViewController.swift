import UIKit

class FrenchToastViewController: UIViewController {
	//MARK: - Properties and Actions
	// Configuration goes here
	var menuItem = "French Toast"
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

	// Layout your views here
	func layoutViews() {
		// fill this array with constraints we gonna add for each view
		var constraints = [NSLayoutConstraint]()

		// turn off the minimum margin space that's determined by the system
		viewRespectsSystemMinimumLayoutMargins = false

		// the amount of space between the trailing of the view and the subviews
		// the default value for this is 40, if we wanna use less, type the line above this ^
		view.directionalLayoutMargins.trailing = 5.0

		/** Label Constraints **/

		// first turn off the default value of xcode figuring out constraints on its own
		label.translatesAutoresizingMaskIntoConstraints = false
		// label.top = view.safeAreaLayoutGuide.top + 40
		// safe area is like a boundary that the subviews shouldn't pass
		constraints += [NSLayoutConstraint.init(
				item: label, attribute: .top,
				relatedBy: .equal,
				toItem: view.safeAreaLayoutGuide, attribute: .top,
				multiplier: 1.0, constant: 40.0
		)]
		// label.leading = view.safeAreaLayoutGuide.leading
		// safe area is like a boundary that the subviews shouldn't pass
		constraints += [NSLayoutConstraint.init(
				item: label, attribute: .leading,
				relatedBy: .equal,
				toItem: view.safeAreaLayoutGuide, attribute: .leading,
				multiplier: 1.0, constant: 0.0
		)]
		// label.trailing = view.layoutMarginsGuide.trailing
		// the view's margin (the main view): space between it and the sub views
		constraints += [NSLayoutConstraint.init(
				item: label, attribute: .trailing,
				relatedBy: .equal,
				toItem: view.layoutMarginsGuide, attribute: .trailing,
				multiplier: 1.0, constant: 0.0
		)]
		// label.height = view.height * 0.15
		// make its height based on the height of the view
		constraints += [NSLayoutConstraint.init(
				item: label, attribute: .height,
				relatedBy: .equal,
				toItem: view, attribute: .height,
				multiplier: 0.15, constant: 0.0
		)]

		/** ImageView Constraints **/

		// first turn off the default value of xcode figuring out constraints on its own
		imageView.translatesAutoresizingMaskIntoConstraints = false
		// imageView.top = view.top
		constraints += [NSLayoutConstraint.init(
				item: imageView, attribute: .top,
				relatedBy: .equal,
				toItem: view, attribute: .top,
				multiplier: 1.0, constant: 0.0
		)]
		// imageView.leading = view.leading
		constraints += [NSLayoutConstraint.init(
				item: imageView, attribute: .leading,
				relatedBy: .equal,
				toItem: view, attribute: .leading,
				multiplier: 1.0, constant: 0.0
		)]
		// imageView.trailing = view.trailing
		constraints += [NSLayoutConstraint.init(
				item: imageView, attribute: .trailing,
				relatedBy: .equal,
				toItem: view, attribute: .trailing,
				multiplier: 1.0, constant: 0.0
		)]
		// imageView.bottom = view.bottom
		constraints += [NSLayoutConstraint.init(
				item: imageView, attribute: .bottom,
				relatedBy: .equal,
				toItem: view, attribute: .bottom,
				multiplier: 1.0, constant: 0.0
		)]

		/** OrderButton Constraints **/

		// first turn off the default value of xcode figuring out constraints on its own
		orderButton.translatesAutoresizingMaskIntoConstraints = false
		// orderButton.leading = label.leading
		constraints += [NSLayoutConstraint.init(
				item: orderButton, attribute: .leading,
				relatedBy: .equal,
				toItem: label, attribute: .leading,
				multiplier: 1.0, constant: 0.0
		)]
		// backButton.leading = orderButton.trailing + 10
		constraints += [NSLayoutConstraint.init(
				item: backButton, attribute: .leading,
				relatedBy: .equal,
				toItem: orderButton, attribute: .trailing,
				multiplier: 1.0, constant: 10.0
		)]
		// view.layoutMarginsGuide.bottom = orderButton.bottom + 10
		constraints += [NSLayoutConstraint.init(
				item: view.layoutMarginsGuide, attribute: .bottom,
				relatedBy: .equal,
				toItem: orderButton, attribute: .bottom,
				multiplier: 1.0, constant: 10.0
		)]
		// orderButton.height = view.height * 1/5
		// to make its height based on the height of the main screen (view)
//		constraints += [NSLayoutConstraint.init(
//				item: orderButton, attribute: .height,
//				relatedBy: .equal,
//				toItem: view, attribute: .height,
//				multiplier: 1/5, constant: 00.0
//		)]
		// orderButton.width = label.width * 3/5
		constraints += [NSLayoutConstraint.init(
				item: orderButton, attribute: .width,
				relatedBy: .equal,
				toItem: label, attribute: .width,
				multiplier: 3/5, constant: 00.0
		)]
		// orderButton.width = orderButton.height * 3/1
		constraints += [NSLayoutConstraint.init(
				item: orderButton, attribute: .width,
				relatedBy: .equal,
				toItem: orderButton, attribute: .height,
				multiplier: 3/1, constant: 00.0
		)]

		/** BackButton Constraints **/

		// first turn off the default value of xcode figuring out constraints on its own
		backButton.translatesAutoresizingMaskIntoConstraints = false
		// backButton.leading = label.leading
//		constraints += [NSLayoutConstraint.init(
//				item: backButton, attribute: .leading,
//				relatedBy: .equal,
//				toItem: label, attribute: .leading,
//				multiplier: 1.0, constant: 0.0
//		)]
		// backButton.trailing = label.trailing
//		constraints += [NSLayoutConstraint.init(
//				item: backButton, attribute: .trailing,
//				relatedBy: .equal,
//				toItem: label, attribute: .trailing,
//				multiplier: 1.0, constant: 0.0
//		)]
		// backButton.firstBaseLine = orderButton.firstBaseLine
		// makes the line of the text inside the 2 buttons is the same line
		constraints += [NSLayoutConstraint.init(
				item: backButton, attribute: .firstBaseline,
				relatedBy: .equal,
				toItem: orderButton, attribute: .firstBaseline,
				multiplier: 1.0, constant: 0.0
		)]
		// backButton.height = orderButton.height
		constraints += [NSLayoutConstraint.init(
				item: backButton, attribute: .height,
				relatedBy: .equal,
				toItem: orderButton, attribute: .height,
				multiplier: 1.0, constant: 0.0
		)]
		// backButton.width = orderButton.width * 0.5
		// backButton.width = orderButton.width * 5.0/3.0, to make a ratio 5 (back) to 3 (order)
		/*** reverse the ratio make it 3/5 or swap the views names
		     orderButton.width = backButton.width * 5.0/3.0 ***/
		/*** working with multipliers allow us to control the width and the height of the views
		     based on the width and the height of the main view ***/
		constraints += [NSLayoutConstraint.init(
				item: orderButton, attribute: .width,
				relatedBy: .equal,
				toItem: backButton, attribute: .width,
				multiplier: 5/3, constant: 0.0
		)]

		// add the constraints array to the view
		view.addConstraints(constraints)
	}

}
















