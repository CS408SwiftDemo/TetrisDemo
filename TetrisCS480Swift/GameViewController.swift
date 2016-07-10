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
    var tetris:Tetris!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Configure for the view.
        let skView = view as! SKView
        skView.multipleTouchEnabled = false
        
        //Creating and configuring the Scene
        scene = GameScene(size: skView.bounds.size)
        scene.scaleMode = .AspectFill
        
        scene.tick = didTick
        tetris = Tetris()
        tetris.beginGame()
        
        //Display scene
        skView.presentScene(scene)
        
        scene.addPreviewShapeToScene(tetris.nextShape!) {
            self.tetris.nextShape?.moveTo(StartingColumn, row: StartingRow)
            self.scene.movePreviewShape(self.tetris.nextShape!) {
                let nextShapes = self.tetris.newShape()
                self.scene.startTicking()
                self.scene.addPreviewShapeToScene(nextShapes.nextShape!) {}
            }
        }
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func didTick() {
        tetris.fallingShape?.lowerShapeByOneRow()
        scene.redrawShape(tetris.fallingShape!, completion: {})
    }
}
