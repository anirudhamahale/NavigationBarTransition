//
//  ViewController.swift
//  NavBar
//
//  Created by Anirudha on 20/07/17.
//  Copyright © 2017 Anirudha Mahale. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tbView: UITableView!
    @IBOutlet weak var navBarView: UIView!

    // At this point the navBarView will stick to top and turn alpha to 1.
    var stopPoint: CGFloat = 0
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.transperent()
        navigationController?.navigationBar.setTitleAttributes(attributes: [NSForegroundColorAttributeName: UIColor.white])
        UIApplication.shared.statusBarStyle = .lightContent
        navBarView.alpha = 0.0
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        stopPoint = navBarView.frame.size.height - navigationController!.navigationBar.frame.size.height - 20
        self.title = "Navigation Bar."
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yOffset = scrollView.contentOffset.y
        if yOffset <= stopPoint {
            let alpha = yOffset/stopPoint
            // print(alpha)
            navBarView.alpha = alpha
            // print(yOffset)
            navBarView.transform = CGAffineTransform(translationX: 0, y: -yOffset)
        }
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Let's learn"
        cell.detailTextLabel?.text = "Will learn something new!"
        return cell
    }

}

extension UINavigationBar {
    func transperent() {
        self.setBackgroundImage(UIImage(), for: .default)
        self.shadowImage = UIImage()
        self.isTranslucent = true
        // self.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
    }
    
    func nonTrasnperent() {
        self.setBackgroundImage(nil, for: UIBarMetrics.default)
        // self.shadowImage = nil
        self.tintColor = nil
        self.isTranslucent = false
    }
    
    func setTitleAttributes(attributes: [String : Any]) {
        self.titleTextAttributes = attributes
    }
}


func nonTrasnperentNavigationBar(self: UIViewController) {
    self.navigationController?.navigationBar.setBackgroundImage(nil, for: UIBarMetrics.default)
    //        self.navigationController?.navigationBar.shadowImage = nil
    self.navigationController?.navigationBar.tintColor = nil
    self.navigationController?.navigationBar.isTranslucent = false
}

