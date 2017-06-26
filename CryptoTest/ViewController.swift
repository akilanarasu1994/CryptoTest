//
//  ViewController.swift
//  CryptoTest
//
//  Created by Akilan Thirunavukka Arasu on 25/06/17.
//  Copyright © 2017 Akilan Thirunavukka Arasu. All rights reserved.
//

import UIKit
import SwiftyEC

class ViewController: UIViewController {

    let cskPri: String = "MEECAQAwEwYHKoZIzj0CAQYIKoZIzj0DAQcEJzAlAgEBBCANmGSJwsHKpNq7O9j218GsWaRGzNXc22kPJRx0YtvFXQ=="
    
//    var crypto: GMEllipticCurveCrypto = GMEllipticCurveCrypto.crypto(for: GMEllipticCurveSecp192r1) as! GMEllipticCurveCrypto
    
    var payload1: String = "29bef36d-ed42-4e4a-8a19-69491b6fef57:d32a212d-9ea6-4877-830e-0380ee2cc866:22ef4bd5-2768-46aa-9c40-c79e2f5481a6:1497955015490"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        do {
        
            let privateKey = try PrivateKey(base64Encoded: cskPri)
            let payload1Clear = try ClearMessage(string: payload1, using: .utf8)
            let signature = try payload1Clear.signed(with: privateKey, digestType: .sha256)
            let signatureBase64 = signature.base64String
            print(signatureBase64)
            
        } catch {
            print(error.localizedDescription)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

