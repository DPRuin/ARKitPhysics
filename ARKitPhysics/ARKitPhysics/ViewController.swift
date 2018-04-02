//
//  ViewController.swift
//  ARKitPhysics
//
//  Created by mac126 on 2018/4/2.
//  Copyright © 2018年 mac126. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet var sceneView: ARSCNView!
    
    var planeNodes = [SCNNode]()
    let rocketshipNodeName = "rocketship"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create a new scene
        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        
        // Set the scene to the view
        sceneView.scene = scene
        
        configureLighting()
        addTapGestureToSceneView()
        addSwipeGestureToSceneView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupSceneView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    
    // MARK: - 初始化方法
    
    ///  启动世界追踪
    func setupSceneView() {

        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
            
        sceneView.session.run(configuration)
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
    }
    
    func addTapGestureToSceneView() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.addRocketshipToSceneView(recognizer:)))
        sceneView.addGestureRecognizer(tapGesture)
    }
    
    func addSwipeGestureToSceneView() {
        let swipeUpGesture = UISwipeGestureRecognizer(target: self, action: #selector(self.applyForceToRocketship(recognizer:)))
        swipeUpGesture.direction = .up
        sceneView.addGestureRecognizer(swipeUpGesture)
        
        let swipeDownGesture = UISwipeGestureRecognizer(target: self, action: #selector(self.launchRocketship(recognizer:)))
        swipeDownGesture.direction = .down
        sceneView.addGestureRecognizer(swipeDownGesture)
    }
    
    func configureLighting() {
        // 是否自动更新场景的照明
        sceneView.automaticallyUpdatesLighting = true
        // 是否自动点亮没有光源的场景
        sceneView.autoenablesDefaultLighting = true
    }
    
    /// 添加火箭
    @objc func addRocketshipToSceneView(recognizer: UIGestureRecognizer) {
        print("addRocketshipToSceneView")
    }
    
    /// 添加作用力
    @objc func applyForceToRocketship(recognizer: UIGestureRecognizer) {
        print("applyForceToRocketship")
    }
    
    /// 发射火箭
    @objc func launchRocketship(recognizer: UIGestureRecognizer) {
        print("launchRocketship")
    }
    
    
}

extension ViewController: ARSessionObserver {
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}

// MARK: - ARSCNViewDelegate

extension ViewController: ARSCNViewDelegate {
    /*
     // Override to create and configure nodes for anchors added to the view's session.
     func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
     let node = SCNNode()
     
     return node
     }
     */
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        
    }
}

extension float4x4 {
    var translation: float3 {
        let translation = self.columns.3
        return float3(x: translation.x, y: translation.y, z: translation.z)
    }
}

extension UIColor {
    open class var transparentWhite: UIColor {
        return UIColor.white.withAlphaComponent(0.2)
    }
}
