import UIKit

class ViewController: UITableViewController {

    let foods = [
        "Coffee", "Doughnut", "French Toast",
        "Oatmeal", "Hamburger", "Peanut Butter",
        "Maki Rolls", "Spring Rolls", "Pizza",
        "Pasta", "Hot Fudge", "Cake"
    ]

    let font = UIFont(name: "Avenir", size: 30)
    
    func presentViewController(food:String) {
        switch food {
            case "Coffee":
                //present(CoffeeViewController(), animated: true, completion: nil)
                navigationController?.pushViewController(CoffeeViewController(), animated: true)
            case "Doughnut":
                //present(DoughnutViewController(), animated: true, completion: nil)
                navigationController?.pushViewController(DoughnutViewController(), animated: true)
            case "French Toast":
                navigationController?.pushViewController(FrenchToastViewController(), animated: true)
            case "Oatmeal":
                navigationController?.pushViewController(OatmealViewController(), animated: true)
            case "Hamburger":
                navigationController?.pushViewController(HamburgerViewController(), animated: true)
            case "Peanut Butter":
                navigationController?.pushViewController(PeanutButterViewController(), animated: true)
            case "Maki Rolls":
                navigationController?.pushViewController(MakiRollsViewController(), animated: true)
            case "Spring Rolls":
                navigationController?.pushViewController(SpringRollsViewController(), animated: true)
            case "Pizza":
                navigationController?.pushViewController(PizzaViewController(), animated: true)
            case "Pasta":
                navigationController?.pushViewController(PastaViewController(), animated: true)
            case "Hot Fudge":
                navigationController?.pushViewController(HotFudgeViewController(), animated: true)
            case "Cake":
                navigationController?.pushViewController(CakeViewController(), animated: true)
            default:
                return
            }
    }
    
    override func viewDidLoad() {
        navigationItem.title = "Menu"
        super.viewDidLoad()
    }

    //MARK: Table View code
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let food = foods[indexPath.row]
        cell.textLabel?.text = food
        cell.textLabel?.font = font
        cell.textLabel?.textAlignment  = .right
        cell.backgroundColor = UIColor(named: food+"Background")
        cell.imageView?.image = UIImage(named: food)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presentViewController(food: foods[indexPath.row])
    }

}





