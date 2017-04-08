//
//  ViewController.swift
//  3dgame
//
//  Created by MP Mac on 07/04/2017.
//  Copyright © 2017 MP Mac. All rights reserved.
//



import UIKit
import SceneKit

//https://developer.apple.com/reference/scenekit


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        load3D()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //it loads all 3D grpahics to the screen
    func load3D() {
        
        
        let sceneView = SCNView(frame: self.view.frame)
        sceneView.backgroundColor = .white
        
        
        //createScene
        let scene = createScene(view: sceneView)
        
        //createCameras
        let camerNode = createCamera()
        scene.rootNode.addChildNode(camerNode)
        
        //createLight
        scene.rootNode.addChildNode(createTheLight())
        scene.rootNode.addChildNode(createTheLight2())
        scene.rootNode.addChildNode(createTheLight3())
        scene.rootNode.addChildNode(createTheLight4())
        
        
        //createObject
        let sphereNode = createObject()
        scene.rootNode.addChildNode(sphereNode)
        self.view.addSubview(sceneView)
        
        let sphereNode2 = createObject2()
        scene.rootNode.addChildNode(sphereNode2)
        self.view.addSubview(sceneView)
        
        let sphereNode3 = createObject3()
        scene.rootNode.addChildNode(sphereNode3)
        self.view.addSubview(sceneView)
        
        let constraint = SCNLookAtConstraint(target: sphereNode)
        constraint.isGimbalLockEnabled = true
        camerNode.constraints = [constraint]
        
        sceneView.allowsCameraControl = true
        
    }
    
    func createScene(view: SCNView) -> SCNScene {
        let scene1 = SCNScene()
        view.scene = scene1
        return scene1
    }
    
    
    //    func addBackround(){
    //        let animation = CABasicAnimation(keyPath: "backgroundColor")
    //        animation.fromValue = .red
    //        animation.toValue = .blue
    //
    //    }
    //
    
    func animationRadius(_ node: SCNNode) {
        let animation = CABasicAnimation(keyPath: "geometry.radius")
        animation.fromValue = 1.0
        animation.toValue = 0.5
        animation.duration = 1.0
        animation.autoreverses = true
        animation.repeatCount = .infinity
        node.addAnimation(animation, forKey: "radius")
    }
    
    func animationRadius2(_ node: SCNNode) {
        let animation = CABasicAnimation(keyPath: "geometry.radius")
        animation.fromValue = 0.5
        animation.toValue = 1.0
        animation.duration = 0.8
        animation.autoreverses = true
        animation.repeatCount = .infinity
        node.addAnimation(animation, forKey: "radius")
    }

    func animationRadius3(_ node: SCNNode) {
        let animation = CABasicAnimation(keyPath: "geometry.radius")
        animation.fromValue = 0.5
        animation.toValue = 1.0
        animation.duration = 0.5
        animation.autoreverses = true
        animation.repeatCount = .infinity
        node.addAnimation(animation, forKey: "radius")
    }

//    func animationPosition(_ node: SCNNode) {
//        let animation = CABasicAnimation(keyPath: "transform.scale.x")
//        animation.fromValue = 0.0
//        animation.toValue = 10.0
//        animation.duration = 10.0
//        animation.autoreverses = true
//        animation.repeatCount = .infinity
//        node.addAnimation(animation, forKey: "position")
//    }

//    func animationColor(_ node: SCNNode) {
//        let animation = CABasicAnimation(keyPath: "backgroundColor")
//        animation.fromValue = UIColor.red
//        animation.toValue = UIColor.blue
//        animation.duration = 2.0
//        animation.autoreverses = true
//        animation.repeatCount = .infinity
//        node.addAnimation(animation, forKey: "color")
//
//    }
    
    func createCamera() -> SCNNode {
        
        let cameraNode = SCNNode()
        
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: -9.0, y: 8.0, z: 5.0)
        return cameraNode
        
    }
    
    
    func createTheLight() -> SCNNode {
        let light = SCNLight()
        light.type = SCNLight.LightType.omni
        let lightNode = SCNNode()
        lightNode.light = light
        lightNode.position = SCNVector3(x: 1.5, y: 1.5, z: 1.5)
        
        return lightNode
    }
    
    func createTheLight2() -> SCNNode {
        let light = SCNLight()
        light.type = SCNLight.LightType.omni
        let lightNode = SCNNode()
        lightNode.light = light
        lightNode.position = SCNVector3(x: -1.5, y: -1.5, z: -1.5)
        
        return lightNode
    }

    func createTheLight3() -> SCNNode {
        let light = SCNLight()
        light.type = SCNLight.LightType.omni
        let lightNode = SCNNode()
        lightNode.light = light
        lightNode.position = SCNVector3(x: -1.5, y: 1.5, z: -1.5)
        
        return lightNode
    }
    
    func createTheLight4() -> SCNNode {
        let light = SCNLight()
        light.type = SCNLight.LightType.omni
        let lightNode = SCNNode()
        lightNode.light = light
        lightNode.position = SCNVector3(x: -1.5, y: -1.5, z: 1.5)
        
        return lightNode
    }


    //it adds object to the scene
    func createObject() -> SCNNode  {
        let sphereGeometry = SCNSphere(radius: 0.5)
        let sphereNode = SCNNode(geometry: sphereGeometry)
        let redMaterial = SCNMaterial()
        redMaterial.diffuse.contents = UIImage(named: "earth-topo.png")
        sphereGeometry.materials = [redMaterial]
        sphereNode.position = SCNVector3(x: -1.0, y: 1.0, z: 1.0)
        animationRadius(sphereNode)
        //animationPosition(sphereNode)
     //   animationColor(sphereNode)
               return sphereNode
    }
    
    func createObject2() -> SCNNode  {
        let sphereGeometry = SCNSphere(radius: 0.5)
        let sphereNode = SCNNode(geometry: sphereGeometry)
        let yellowMaterial = SCNMaterial()
        yellowMaterial.diffuse.contents = UIImage(named: "germany_round_icon_640.png")
        sphereGeometry.materials = [yellowMaterial]
        animationRadius2(sphereNode)
        //animationPosition(sphereNode)
        return sphereNode
    }
    
    func createObject3() -> SCNNode  {
        let sphereGeometry = SCNSphere(radius: 0.5)
        let sphereNode = SCNNode(geometry: sphereGeometry)
        let greenMaterial = SCNMaterial()
        greenMaterial.diffuse.contents = UIImage(named: "italy_round_icon_640.png")
        sphereGeometry.materials = [greenMaterial]
        sphereNode.position = SCNVector3(x: 1.0, y: 1.0, z: 1.0)
        animationRadius3(sphereNode)
        //animationPosition(sphereNode)
        return sphereNode
    }

}
