//
//  ViewController.swift
//  CustomTransitions
//
//  Created by Dimitrios Kalaitzidis on 26/06/2018.
//  Copyright © 2018 Dimitrios Kalaitzidis. All rights reserved.
//

import UIKit

class ViewController: ApplicationViewController {
    
    lazy var nextController : SecondViewController = {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "secondViewController") as! SecondViewController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func goNextAction(_ sender: UIButton) {
        present(nextController, animated: true, completion: nil)
    }
}

