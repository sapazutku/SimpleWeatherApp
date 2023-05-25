//
//  SnowAnimation.swift
//  SimpleWeatherApp
//
//  Created by utku on 25.05.2023.
//

import Foundation
import SpriteKit


class Snow: SKScene{
    override func sceneDidLoad() {
        
        size = UIScreen.main.bounds.size
        scaleMode = .resizeFill
        
        // anchor point..
        anchorPoint = CGPoint(x: 0.5, y: 1)
        
        backgroundColor = .clear
        // creating node and adding to scene
        let node = SKEmitterNode(fileNamed: "Snow.sks")!
        addChild(node)
        
        // Full width...
        node.particlePositionRange.dx = UIScreen.main.bounds.width
        
    }
}
