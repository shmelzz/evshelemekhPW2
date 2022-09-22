//
//  ViewController.swift
//  evshelemekhPW2
//
//  Created by Lisa Shell on 22.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let commentLabel = UILabel()
    private let valueLabel = UILabel()
    let incrementButton = UIButton()
    
    private var value: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupIncrementButton() {
        incrementButton.setTitle("Increment", for: .normal)
        incrementButton.setTitleColor(.black, for: .normal)
        incrementButton.layer.cornerRadius = 12
        incrementButton.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
        incrementButton.backgroundColor = .white
        // incrementButton.layer.applyShadow()
        
        self.view.addSubview(incrementButton)
        
        incrementButton.setHeight(to: 48)
        incrementButton.pinTop(to: self.view.centerYAnchor)
        incrementButton.pin(to: self.view, [.left: 24, .right: 24])
        incrementButton.addTarget(self, action: #selector(incrementButtonPressed), for: .touchUpInside)
    }
    
    @objc
    func incrementButtonPressed() {
        value += 1
        
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
        
        UIView.animate(withDuration: 1) {
            self.setupValueLabel()
            self.updateCommentLabel(value: self.value)
        }
    }
    
    private func setupValueLabel() {
        valueLabel.font = .systemFont(ofSize: 40.0, weight: .bold)
        valueLabel.textColor = .black
        valueLabel.text = "\(value)"
        self.view.addSubview(valueLabel)
        valueLabel.pinBottom(to: incrementButton.topAnchor, 16)
        valueLabel.pinCenter(to: self.view.centerXAnchor)
    }
    
    private func setupView() {
        view.backgroundColor = .systemGray6
        setupIncrementButton()
        setupValueLabel()
        setupCommentView()
        setupMenuButtons()
    }
    
    private func setupCommentView() -> UIView {
        let commentView = UIView()
        commentView.backgroundColor = .white
        commentView.layer.cornerRadius = 12
        
        view.addSubview(commentView)
        commentView.pinTop(to: self.view.safeAreaLayoutGuide.topAnchor)
        commentView.pin(to: self.view, [.left: 24, .right: 24])
        commentLabel.font = .systemFont(ofSize: 14.0, weight: .regular)
        commentLabel.textColor = .systemGray
        commentLabel.numberOfLines = 0
        commentLabel.textAlignment = .center
        
        commentView.addSubview(commentLabel)
        commentLabel.pin(to: commentView, [.top: 16, .left: 16, .bottom: 16, .right: 16])
        
        updateCommentLabel(value: value)
        
        return commentView
    }
    
    func updateCommentLabel(value: Int) {
        switch value {
        case 0...10:
            commentLabel.text = "1"
        case 10...20:
            commentLabel.text = "2"
        case 20...30:
            commentLabel.text = "3"
        case 30...40:
            commentLabel.text = "4"
        case 40...50:
            commentLabel.text = "! ! ! ! ! ! ! ! ! "
        case 50...60:
            commentLabel.text = "big boy"
        case 60...70:
            commentLabel.text = "70 70 70 moreeeee"
        case 70...80:
            commentLabel.text = "⭐ ⭐ ⭐ ⭐ ⭐ ⭐ ⭐ ⭐ ⭐ "
        case 80...90:
            commentLabel.text = "80+\n go higher!"
        case 90...100:
            commentLabel.text = "100!! to the moon!!"
        default:
            break
        }
    }
    
    private func makeMenuButton(title: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 12
        button.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
        button.backgroundColor = .white
        button.heightAnchor.constraint(equalTo: button.widthAnchor).isActive = true
        return button
    }
    
    private func setupMenuButtons() {
        let colorsButton = makeMenuButton(title: "🌎")
        let notesButton = makeMenuButton(title: "🎋")
        let newsButton = makeMenuButton(title: "🌋")
        
        let buttonsStackView = UIStackView(arrangedSubviews: [colorsButton, notesButton, newsButton])
        buttonsStackView.spacing = 12
        buttonsStackView.axis = .horizontal
        buttonsStackView.distribution = .fillEqually
        
        self.view.addSubview(buttonsStackView)
        buttonsStackView.pin(to: self.view, [.left: 24, .right: 24])
        buttonsStackView.pinBottom(to: self.view.safeAreaLayoutGuide.bottomAnchor, 24)
    }
}

