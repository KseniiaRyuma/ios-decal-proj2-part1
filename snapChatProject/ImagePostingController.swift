//
//  ImagePosting.swift
//  snapChatProject
//
//  Created by Kseniia Ryuma on 3/13/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class ImagePostingController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var sectionToPostTo: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var pickedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return threadNames.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        sectionToPostTo.text = threadNames[indexPath.item]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell") as! ImageCategoryTableViewCell
        
        cell.feedsToPost.text = threadNames[indexPath.item]
        return cell
    }
    
    
    @IBAction func postPicture(_ sender: UIButton) {
        
        threads[sectionToPostTo.text!]!.append(pickedImage!)
//        makeAlert(t: "The Picture Was Posted", m: "Check your feed board")
        
        let alert = UIAlertController(title: "The Picture Was Posted", message: "Check your feed board :)", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {
            (_)in
            self.performSegue(withIdentifier: "unwindToMenu", sender: self)
        })
        
        alert.addAction(OKAction)
        self.present(alert, animated: true, completion: nil)
    }

    
//    func makeAlert(t: String, m: String){
//        // create the alert
//        let alert = UIAlertController(
//            title: t,
//            message: m,
//            preferredStyle: UIAlertControllerStyle.alert)
//        // add an action (button)
//        let newGame = UIAlertAction(title: "OK", style: .default)
//        // show the alert
//        alert.addAction(newGame)
//        self.present(alert, animated: true, completion: nil)
//        
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
