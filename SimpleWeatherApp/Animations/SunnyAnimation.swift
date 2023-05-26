//
//  SunnyAnimation.swift
//  SimpleWeatherApp
//
//  Created by utku on 25.05.2023.
//

import SpriteKit

class SunnyScene: SKScene{
    override init (size: CGSize) {
        super.init(size: size)
        backgroundColor = .clear
        
        let sun = SKSpriteNode(imageNamed: "sun")
        sun.position = CGPoint(x: size.width * 0.1, y: size.height * 0.8)
        addChild(sun)
        
        let moveRight = SKAction.move(to: CGPoint(x: size.width * 0.9, y: size.height * 0.8), duration: 10)
        sun.run(SKAction.repeatForever(moveRight))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
