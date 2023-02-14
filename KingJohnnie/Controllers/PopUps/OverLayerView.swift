//
//  OverLayerView.swift
//  CustomPopUp
//
//  Created by Sajjad Sarkoobi on 8.07.2022.
//

import UIKit
import ALProgressView

class OverLayerView: UIViewController {

    @IBOutlet var progressView: ALProgressRing!
    //IBOutlets
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet var pauseLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    @IBAction func doneButtonAction(_ sender: UIButton) {
        hide()
    }
    
    
    
    init() {
        super.init(nibName: "OverLayerView", bundle: nil)
        self.modalPresentationStyle = .overFullScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configView()
        self.pauseLabel.text = "PAUSE"
        self.pauseLabel.font = UIFont(name: Constants.FontsStrings.InterBold, size: 30)
        progressView.setProgress(0.0, animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [self] in
            
            progressView.lineWidth = 5
            progressView.tintColor = .yellow
            progressView.startColor = Constants.Colors.orangeColor
            progressView.grooveColor = .brown
            progressView.tintColor = .white
            progressView.endColor = Constants.Colors.orangeColor
            progressView.setProgress(0.8, animated: true)
        }
        
    }


    
    private func configView() {
        self.view.backgroundColor = .clear
        self.backView.backgroundColor = .black.withAlphaComponent(1)
        self.backView.alpha = 0
        self.contentView.alpha = 0.9
        
        self.contentView.layer.cornerRadius = 10
    }
    
    func appear(sender: ActiveGameViewController) {
        sender.present(self, animated: true) {
            self.show()
        }
    }
    
    private func show() {
        UIView.animate(withDuration: 0.6, delay: 0) {
            self.backView.alpha = 0.8
            self.contentView.alpha = 1
        }
    }
    
    func hide() {
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut) {
            self.backView.alpha = 0
            self.contentView.alpha = 0
        } completion: { _ in
            self.dismiss(animated: false)
            self.removeFromParent()
        }
    }
}
