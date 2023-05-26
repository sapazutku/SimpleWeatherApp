//
//  RainAnimation.swift
//  SimpleWeatherApp
//
//  Created by utku on 25.05.2023.
//

import SpriteKit


class RainFall: SKScene{
    override func sceneDidLoad() {
        
        size = UIScreen.main.bounds.size
        scaleMode = .resizeFill
        
        // anchor point..
        anchorPoint = CGPoint(x: 0.5, y: 1)
        
        backgroundColor = .clear
        // creating node and adding to scene
        let node = SKEmitterNode(fileNamed: "RainFall.sks")!
        addChild(node)
        
        // Full width...
        node.particlePositionRange.dx = UIScreen.main.bounds.width
        
    }
}

class Drizzle: SKScene{
    override func sceneDidLoad() {
        
        size = UIScreen.main.bounds.size
        scaleMode = .resizeFill
        
        // anchor point..
        anchorPoint = CGPoint(x: 0.5, y: 1)
        
        backgroundColor = .clear
        // creating node and adding to scene
        let node = SKEmitterNode(fileNamed: "Drizzle.sks")!
        addChild(node)
        
        // Full width...
        node.particlePositionRange.dx = UIScreen.main.bounds.width
        
    }
}
