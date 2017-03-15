//
//  ImageFeedController.swift
//  snapChatProject
//
//  Created by Kseniia Ryuma on 3/14/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class ImageFeedController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var fullImage: UIButton!
    
    var indexPathForCell: IndexPath?
    
        override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return threadNames[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return threadNames.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return threads[threadNames[section]]!.count
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //get UIImage from source
        //show (add subView) UIImageView with full screen frame
        //add gesture for double tap on which remove UIImageView       
        let img = threads[threadNames[indexPath.section]]?[indexPath.item]

        fullImage.setBackgroundImage(img, for: UIControlState.normal)
        view.addSubview(fullImage)
        
        
        
        
        indexPathForCell = indexPath
        
        let cell = tableView.cellForRow(at: indexPathForCell!) as! ImageFeedTableCell
        
        
        
        if cell.beenRead == true{
            fullImage.isEnabled = false
        }
        else if cell.beenRead == false{
            
            fullImage.isEnabled = true
            fullImage.isHidden = false
        }
        
        
        
        
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell2") as? ImageFeedTableCell {
            cell.name.text = "KR"
            
            if cell.beenRead!{
                cell.readIndicator.image = UIImage(named: "read")
            }else{
                cell.readIndicator.image = UIImage(named: "unread")
            }
            
            cell.timePosted.text = "1 minute ago"
            return cell
        }
        
        
        return UITableViewCell()

    }
    
    
    @IBAction func dismisImage(_ sender: UIButton) {
        
        let cell = tableView.cellForRow(at: indexPathForCell!) as! ImageFeedTableCell
        
        cell.readIndicator.image = UIImage(named: "read")
        
        cell.beenRead = true
        fullImage.isHidden = true
        

        
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
