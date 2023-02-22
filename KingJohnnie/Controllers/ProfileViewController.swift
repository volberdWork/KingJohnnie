import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet var backgroundImage: UIImageView!
    
    @IBOutlet var tableView: UITableView!
    
    var gamesStatstics: [ProfileGameStatistic] = [
        ProfileGameStatistic(nameOfGame: "KING OF LIGHT",
                             winCounts: KingOfLightStatistic.winCount,
                             lossCount: KingOfLightStatistic.lossCount,
                             currentLevel: UserProgressData.gameLevel),
        ProfileGameStatistic(nameOfGame: "MIND MAZE",
                             winCounts: 0,
                             lossCount: 0,
                             currentLevel: 0),
        ProfileGameStatistic(nameOfGame: "LIGHTING STRIKE",
                             winCounts: 0,
                             lossCount: 0,
                             currentLevel: 0),
        ProfileGameStatistic(nameOfGame: "WAY OF TRUTH",
                             winCounts: 0,
                             lossCount: 0,
                             currentLevel: 0),
        ProfileGameStatistic(nameOfGame: "RIDDLE OF KING",
                             winCounts: 0,
                             lossCount: 0,
                             currentLevel: 0)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "ProfileProgressTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfileProgressTableViewCell")
        
        
        
        
        self.tableView.reloadData()
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
        return gamesStatstics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileProgressTableViewCell", for: indexPath) as! ProfileProgressTableViewCell
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        cell.configureView(model: gamesStatstics[indexPath.row])
        return cell
    }
    
    
}

struct ProfileGameStatistic{
    var nameOfGame: String
    var winCounts: Int
    var lossCount: Int
    var currentLevel: Int
}
