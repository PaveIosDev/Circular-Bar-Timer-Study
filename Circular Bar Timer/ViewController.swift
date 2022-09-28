//
//  ViewController.swift
//  Circular Bar Timer
//
//  Created by Павел Яковенко on 28.09.2022.
//

import UIKit

class ViewController: UIViewController {

    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Circular Bar Timer"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let shapeView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "ellipse")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let timerLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.font = UIFont.boldSystemFont(ofSize: 84)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let startButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.setTitle("START", for: .normal)
        button.backgroundColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var timer = Timer()
    
    let shapeLayer = CAShapeLayer()
    
    var durationTimer = 10
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = .white
        
        setConstraints()
        
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
    }
    
    @objc func startButtonTapped(){
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    @objc func timerAction() {
        
        durationTimer -= 1
        timerLabel.text = "\(durationTimer)"
        print(durationTimer)
        
        if durationTimer == 0 {
            timer.invalidate()
        }
    }
    
    //MARK: Animation
    
    func animationCircular() {
        
        let center = CGPoint(x: shapeView.frame.width / 2, y: shapeView.frame.height / 2)
        
        let endAngle = (-CGFloat.pi / 2)
        let startAngle = 2 * CGFloat.pi + endAngle
        
        
        let circularPath = UIBezierPath(arcCenter: center, radius: 138, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        
        
        shapeLayer.path = circularPath.cgPath
        shapeLayer.lineWidth = 21
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeEnd = 1
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        shapeLayer.strokeColor = #colorLiteral(red: 0.4094929156, green: 0.0193908778, blue: 0.1732415347, alpha: 1)
        
    }
    
}

extension ViewController {
    
    func setConstraints() {
        
        view.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        view.addSubview(shapeView)
        NSLayoutConstraint.activate([
            shapeView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            shapeView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            shapeView.heightAnchor.constraint(equalToConstant: 300),
            shapeView.widthAnchor.constraint(equalToConstant: 300)
        ])
        
        view.addSubview(timerLabel)
        NSLayoutConstraint.activate([
            timerLabel.centerXAnchor.constraint(equalTo: shapeView.centerXAnchor),
            timerLabel.centerYAnchor.constraint(equalTo: shapeView.centerYAnchor)
        ])
        
        
        view.addSubview(startButton)
        NSLayoutConstraint.activate([
            startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.heightAnchor.constraint(equalToConstant: 70),
            startButton.widthAnchor.constraint(equalToConstant: 300)
        ])
        
        
        
    }
}
