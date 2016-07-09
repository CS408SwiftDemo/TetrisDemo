//
//  GameViewController.swift
//  TetrisCS480Swift
//
//  Created by Jose Gutierrez on 7/9/16.
//  Copyright (c) 2016 CS480 Project. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    var scene: GameScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Configure for the view.
        let skView = view as! SKView
        skView.multipleTouchEnabled = false
        
        //Creating and configuring the Scene
        scene = GameScene(size: skView.bounds.size)
        scene.scaleMode = .AspectFill
        
        //Display scene
        skView.presentScene(scene)
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
