//
//  CloudAnimation.swift
//  SimpleWeatherApp
//
//  Created by utku on 25.05.2023.
//
import SpriteKit

class CloudScene: SKScene {
    
    override init(size: CGSize) {
        super.init(size: size)
        
        self.backgroundColor = .clear
        
        let cloud = SKSpriteNode(imageNamed: "cloud") 
        cloud.position = CGPoint(x: -cloud.size.width / 2, y: self.size.height / 2)
        cloud.zPosition = 10
        addChild(cloud)
        
        let moveCloud = SKAction.moveBy(x: self.size.width + cloud.size.width, y: 0, duration: 40)
        let resetCloud = SKAction.moveBy(x: -(self.size.width + cloud.size.width), y: 0, duration: 0)
        let cloudAction = SKAction.repeatForever(SKAction.sequence([moveCloud, resetCloud]))
        
        cloud.run(cloudAction)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

