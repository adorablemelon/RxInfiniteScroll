//
//  CollectionViewCell.swift
//  audiotest
//
//  Created by DC4 on 04/01/2021.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    let playButton = UIButton()
    let resumeButton = UIButton()
    var collectionView:UICollectionView?
    let timeLeftShapeLayer = CAShapeLayer()
    let bgShapeLayer = CAShapeLayer()
    var timeLeft: TimeInterval = 60
    var endTime: Date?
    var timeLabel =  UILabel()
    var timer = Timer()
    // here you create your basic animation object to animate the strokeEnd
    let strokeIt = CABasicAnimation(keyPath: "strokeEnd")
    let pauseButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        
  
        
        
        self.addSubview(pauseButton)
        pauseButton.translatesAutoresizingMaskIntoConstraints = false
        pauseButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        pauseButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        pauseButton.widthAnchor.constraint(equalToConstant: self.frame.height * 0.5).isActive = true
        pauseButton.heightAnchor.constraint(equalToConstant: self.frame.height * 0.5).isActive = true
        pauseButton.setTitle("Pause", for: .normal)
        pauseButton.layer.borderWidth = 2
        pauseButton.addTarget(self, action: #selector(play), for: .touchDown)
        
   
    }
    
    
    
    
    
    
    
    @objc func play(){
        self.drawBgShape(bgShapeLayer: bgShapeLayer)
        self.drawTimeLeftShape(timeLeftShapeLayer: timeLeftShapeLayer)
        self.addTimeLabel(timeLabel: &timeLabel, timer: timer, timeLeft: timeLeft)

        strokeIt.fromValue = 0
        strokeIt.toValue = 1
        strokeIt.duration = timeLeft
        
        timeLeftShapeLayer.add(strokeIt, forKey: nil)
        // define the future end time by adding the timeLeft to now Date()
        endTime = Date().addingTimeInterval(timeLeft)
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)  // countdown the number in middle
        
    }
    
    @objc func updateTime() {
        if timeLeft > 0 {
            timeLeft = endTime?.timeIntervalSinceNow ?? 0
            timeLabel.text = timeLeft.time
        } else {
            timeLabel.text = "00:00"
            timer.invalidate()
        }
    }
    @objc func pauseCircular(){
        self.pauseAnimation(layer: timeLeftShapeLayer)
        pauseButton.setTitle("Play", for: .normal)
    }
    @objc func resumCircular(){
        self.resumeAnimation(layer: timeLeftShapeLayer)
    }
    
    func drawBgShape(bgShapeLayer:CAShapeLayer) {
        bgShapeLayer.path = UIBezierPath(arcCenter: CGPoint(x: self.frame.midX - 45 , y: self.frame.midY), radius:
            30, startAngle: -90.degreesToRadians, endAngle: 270.degreesToRadians, clockwise: true).cgPath
        bgShapeLayer.strokeColor = UIColor.white.cgColor
        bgShapeLayer.fillColor = UIColor.clear.cgColor
        bgShapeLayer.lineWidth = 15
        self.layer.addSublayer(bgShapeLayer)
    }
    func drawTimeLeftShape(timeLeftShapeLayer:CAShapeLayer) {
        timeLeftShapeLayer.path = UIBezierPath(arcCenter: CGPoint(x: self.frame.midX - 45, y: self.frame.midY), radius:
            30, startAngle: -90.degreesToRadians, endAngle: 270.degreesToRadians, clockwise: true).cgPath
        timeLeftShapeLayer.strokeColor = UIColor.red.cgColor
        timeLeftShapeLayer.fillColor = UIColor.clear.cgColor
        timeLeftShapeLayer.lineWidth = 15
        self.layer.addSublayer(timeLeftShapeLayer)
    }
    func addTimeLabel(timeLabel:inout UILabel, timer:Timer, timeLeft:TimeInterval) {
        timeLabel = UILabel(frame: CGRect(x: self.frame.midX-95 ,y: self.frame.midY-25, width: 100, height: 50))
        timeLabel.textAlignment = .center
        timeLabel.text = timeLeft.time
        self.addSubview(timeLabel)
    }
    func pauseAnimation(layer:CALayer){
        let pausedTime = layer.convertTime(CACurrentMediaTime(), from: nil)
         layer.speed = 0.0
         layer.timeOffset = pausedTime
       }
       
    func resumeAnimation(layer:CALayer){
        let pausedTime = layer.timeOffset
         layer.speed = 1.0
         layer.timeOffset = 0.0
         layer.beginTime = 0.0
        let timeSincePause = layer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
         layer.beginTime = timeSincePause
       }
}
