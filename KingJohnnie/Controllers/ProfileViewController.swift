import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet var backgroundImage: UIImageView!
    
    @IBOutlet var tableView: UITableView!
    
    var gameStatisticsData: [ProfileStat] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        var countOfGames = defaults.integer(forKey: "lossCount")+defaults.integer(forKey: "winCount")
        gameStatisticsData.append(ProfileStat(winCount: 0, losseCount: 0, procentOfWin: 0, cauntOgGames: countOfGames))
        self.tableView.reloadData()
        print(countOfGames)
        
        setupView()
        tableView.backgroundColor = .clear

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
        return gameStatisticsData[0].cauntOgGames
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
