//
//  HomeViewController.swift
//  ReusableClient
//
//  Created by Xue Yong Ming on 30/12/2016.
//  Copyright © 2016 Robin. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
  @IBOutlet weak var moduleScrollView: RCModuleScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
   }

  override func viewDidLayoutSubviews() {
    //      moduleScrollView.auto = false
//    moduleScrollView.scrollsToTop = false

    moduleScrollView.setModules(moduleButtonTitles: ["Hot", "International", "Domestic", "Finance", "Sports", "Technology", "Entertainment", "Hot", "International", "Domestic", "Finance", "Sports", "Technology", "Entertainment", "Hot", "International", "Domestic", "Finance", "Sports", "Technology", "Entertainment"])
    moduleScrollView.moduleButtonDidClickClosure = { index in
      print(index)
    }

//    let label = UILabel()
//    label.text = "test"
//    label.backgroundColor = .black
//    label.frame = CGRect(x: 0, y: 0, width: 150, height: 30)
//    moduleScrollView.addSubview(label)
//    moduleScrollView.contentSize = CGSize(width: 1000, height: 35)
////    moduleScrollView.contentMode = .left
//    moduleScrollView.contentInset = .zero
////    moduleScrollView.contentOffset = .zero

    //      view.addSubview(label)

  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
