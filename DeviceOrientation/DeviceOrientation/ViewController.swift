//
//  ViewController.swift
//  DeviceOrientation
//
//  Created by miyazawaryohei on 2020/10/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var labelABC: UILabel!
    @IBOutlet var labelA: UILabel!
    @IBOutlet var labelB: UIView!
    @IBOutlet var labelC: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //通知センターのオブジェクトを作る
        let notification = NotificationCenter.default
        //デバイスの向きが変わった
        notification.addObserver(self, selector: #selector(self.changedDeviceOrientation), name: UIDevice.orientationDidChangeNotification, object: nil)
        
    }
    @objc func changedDeviceOrientation(_ notification :Notification){
        //デバイスの取得
        let device = UIDevice.current
        //デバイスの向きを調べる
        switch device.orientation{
        case .portrait ://ポートレート
        //ラベルを０度に回転
        rotateLabel(0)
        case .portraitUpsideDown ://逆さま
        //ラベルを１８０度回転
            rotateLabel(CGFloat(Double.pi))
        case .landscapeLeft ://デバイスは左回転
        //ラベルは９０度に回転
            rotateLabel(CGFloat(Double.pi/2))
        case .landscapeRight ://デバイスは右回転
            rotateLabel(CGFloat(-Double.pi/2))
        default:
            break
        }
    }
    
    //デバイスの向きに合わせてラベルを回転させる
    func rotateLabel(_ radean :CGFloat) {
        let transform = CGAffineTransform(rotationAngle: radean)
        labelABC.transform = transform
        labelA.transform = transform
        labelB.transform = transform
        labelC.transform = transform
    }

}

