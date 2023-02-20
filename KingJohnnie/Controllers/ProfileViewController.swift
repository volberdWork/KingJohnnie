import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet var backgroundImage: UIImageView!
    
    @IBOutlet var tableView: UITableView!
    var statsDict = UserDefaults.standard.dictionary(forKey: "gameStats")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        tableView.backgroundColor = .clear
        print(statsDict?.count ?? 1000)

    }
    
    private func setupView(){
        backgraundImageConfige(image: Constants.Images.setingsScreenImage)
    }
    
    private func backgraundImageConfige(image: String){
        self.backgroundImage.image = UIImage(named: image)
        self.backgroundImage.contentMode = .scaleAspectFill
    }

}


extension ProfileViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.statsDict?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
