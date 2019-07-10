//
//  ViewController.swift
//  Magnetometer
//
//  Created by Andi Ikhsan Eldrian on 09/07/19.
//  Copyright © 2019 Andi Ikhsan Eldrian. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var yLabel: UILabel!
    @IBOutlet weak var zLabel: UILabel!
    
    let motionManager = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startMagnetometer()
    }
    
    func startMagnetometer() {
        if motionManager.isMagnetometerAvailable {
            motionManager.magnetometerUpdateInterval = 0.1
            motionManager.startMagnetometerUpdates(to: OperationQueue.main) { (data, error) in
//                print(data)
                self.xLabel.text = "x: \(data!.magneticField.x)"
                self.yLabel.text = "y: \(data!.magneticField.y)"
                self.zLabel.text = "z: \(data!.magneticField.z)"
            }
        }
    }

}

