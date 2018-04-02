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

class ViewController: UIViewController, ARSCNViewDelegate {

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
        
    }
    
    func addSwipeGestureToSceneView() {
        
    }
    
    func configureLighting() {
        // 是否自动更新场景的照明
        sceneView.automaticallyUpdatesLighting = true
        // 是否自动点亮没有光源的场景
        sceneView.autoenablesDefaultLighting = true
    }
    
    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
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
