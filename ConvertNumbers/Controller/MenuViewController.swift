//
//  MenuViewController.swift
//  ConvertNumbers
//
//  Created by 杉原大貴 on 2020/09/14.
//  Copyright © 2020 杉原大貴. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var sixteenButton: UIButton!
    @IBOutlet weak var thirtyTwoButton: UIButton!
    @IBOutlet weak var sixtyFourButton: UIButton!
    @IBOutlet weak var aHundreadTwoEightButton: UIButton!
    
    @IBOutlet weak var userAnswerLabel: UILabel!
    @IBOutlet weak var quizDecNumber: UILabel!
    
    @IBOutlet weak var wrapView: UIStackView!
    
    
    var senderTitle = "0"
    var quizBrain = QuizBrain()
    var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        aHundreadTwoEightButton.tag = 1
        sixtyFourButton.tag = 2
        thirtyTwoButton.tag = 3
        sixteenButton.tag = 4
        eightButton.tag = 5
        fourButton.tag = 6
        twoButton.tag = 7
        oneButton.tag = 8
        
        quizDecNumber.text = quizBrain.makeQuiz()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateProgress), userInfo: nil, repeats: true)
    }
    
    
    @IBAction func BynaryPressed(_ sender: UIButton) {
        
        if sender.currentTitle == "0" {
            senderTitle = "1"
            sender.setTitle(senderTitle, for: .normal)
        } else {
            senderTitle = "0"
            sender.setTitle(senderTitle, for: .normal)
        }
        
        let index = sender.tag-1
        quizBrain.changeAnswer(place: index, number: senderTitle)
        userAnswerLabel.text = quizBrain.ansDecNumber
        updateUI()
    }
    
    func updateUI() {
        
        if quizBrain.checkAnswer() {
            quizBrain.resetQuiz()
            quizDecNumber.text = quizBrain.makeQuiz()
            
            oneButton.setTitle(quizBrain.byteArr[7], for: .normal)
            twoButton.setTitle(quizBrain.byteArr[6], for: .normal)
            fourButton.setTitle(quizBrain.byteArr[5], for: .normal)
            eightButton.setTitle(quizBrain.byteArr[4], for: .normal)
            sixteenButton.setTitle(quizBrain.byteArr[3], for: .normal)
            thirtyTwoButton.setTitle(quizBrain.byteArr[2], for: .normal)
            sixtyFourButton.setTitle(quizBrain.byteArr[1], for: .normal)
            aHundreadTwoEightButton.setTitle(quizBrain.byteArr[0], for: .normal)
            
            userAnswerLabel.text = quizBrain.ansDecNumber

        }
    }
    
    func createButton() {
  
        let wrapWidth = wrapView.frame.width
        let wrapHight = wrapView.frame.height
        let timeUpButton = UIButton(type: .system)
        timeUpButton.frame = CGRect(x: 0, y: 0, width: wrapWidth, height: wrapHight)
        timeUpButton.setTitle("TIME UP!", for: .normal)
        timeUpButton.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        timeUpButton.contentHorizontalAlignment = .center
        timeUpButton.addTarget(self, action: #selector(dismissPage), for: UIControl.Event.touchUpInside)
        view.addSubview(timeUpButton)
    }
    
    @objc func dismissPage(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func updateProgress() {
        progressBar.progress = quizBrain.getProgress()
        
        if progressBar.progress == 0.0 {
            timer.invalidate()
            createButton()
        }
    }
    
    
}

extension UIView {
    
    /// 枠線の色
    @IBInspectable var borderColor: UIColor? {
        get {
            return layer.borderColor.map { UIColor(cgColor: $0) }
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    /// 枠線のWidth
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    /// 角丸の大きさ
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    /// 影の色
    @IBInspectable var shadowColor: UIColor? {
        get {
            return layer.shadowColor.map { UIColor(cgColor: $0) }
        }
        set {
            layer.shadowColor = newValue?.cgColor
            layer.masksToBounds = false
        }
    }
    
    /// 影の透明度
    @IBInspectable var shadowAlpha: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    /// 影のオフセット
    @IBInspectable var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    /// 影のぼかし量
    @IBInspectable var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
}
