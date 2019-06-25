//
//  alamofireGetter.swift
//  testGS
//
//  Created by Leonardo Gomez Sosa on 6/24/19.
//  Copyright © 2019 Leonardo Gomez Sosa. All rights reserved.
//

import Alamofire

func getRequestWithAlamofire(){
    Alamofire.request("https://us-central1-bibliotecadecontenido.cloudfunctions.net/helloWorld").responseJSON { response in
        if let json = response.result.value {
            print("emite datos")
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "alamofireFinished"), object: nil, userInfo: json as! [AnyHashable : Any])
        }
    }
}
