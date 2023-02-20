import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet var backgroundImage: UIImageView!
    
    @IBOutlet var tableView: UITableView!
    
    var gameStatisticsData: [ProfileStat] = []
    let winsCount = UserDefaults.standard.integer(forKey: "winCount")
    let losseCount = UserDefaults.standard.integer(forKey: "losseCount")
  

    override func viewDidLoad() {
        super.viewDidLoad()
      
        let totalGames = self.winsCount + self.losseCount
        let winPercentage = totalGames > 0 ? self.winsCount / totalGames * 100 : 0
        gameStatisticsData.append(ProfileStat(winCount: self.winsCount, losseCount: self.losseCount, procentOfWin: winPercentage, cauntOgGames: totalGames))

        
        self.tableView.reloadData()
        setupView()
        tableView.backgroundColor = .clear
        print("\(winPercentage)%")

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
