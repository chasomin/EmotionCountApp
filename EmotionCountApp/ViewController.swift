//
//  ViewController.swift
//  EmotionCountApp
//
//  Created by 차소민 on 1/2/24.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var emotions: [UIImageView]!
    @IBOutlet var labels: [UILabel]!
    
    let emotionImageList = ["slime1", "slime2", "slime3", "slime4", "slime5", "slime6", "slime7", "slime8", "slime9"]
    var cntList = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var labelList = ["행복해", "사랑해", "좋아해", "당황해", "속상해", "우울해", "심심해", "지루해", "쓸쓸해"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        designImageView()
        designNavigationItem()
        designLabel()
    }


    
    @IBAction func emotionTapGesture(_ sender: UITapGestureRecognizer) {
        for i in labels {
            if i.tag == sender.view!.tag {
                let n = i.tag
                cntList[n] += 1
                i.text = "\(labelList[n]) \(cntList[n])"
            }
        }
    }
    
    
    func designImageView() {
        for i in 0...emotions.count - 1{
            emotions[i].image = UIImage(named: emotionImageList[i])
            emotions[i].contentMode = .scaleAspectFit
        }
    }

    func designLabel() {
        for i in 0...labels.count - 1 {
            labels[i].text = "\(labelList[i]) \(cntList[i])"
            labels[i].textAlignment = .center
        }
    }
    
    func designNavigationItem() {
        navigationItem.title = "감정 다이어리"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.bullet"), style: .plain, target: self, action: #selector(leftButtonClicked))
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    @objc
    func leftButtonClicked() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let button1 = UIAlertAction(title: "취소", style: .cancel)
        let button2 = UIAlertAction(title: "확인", style: .default)
        alert.addAction(button1)
        alert.addAction(button2)
        present(alert, animated: true)
    }
}

