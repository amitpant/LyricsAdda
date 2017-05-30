//
//  LeftVC.swift
//  Lyrics
//
//  Created by Maahi on 30/05/17.
//  Copyright © 2017 Maahi. All rights reserved.
//

import UIKit
import CoreData


class LeftVC: UIViewController {

    
    var settingList = NSMutableArray()
    
    @IBOutlet weak var leftTableview: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        settingList = [["name":"Home","img":"Home"],["name":"Favorate","img":"Home"],["name":"Saved Lyrics","img":"Home"],["name":"Faq","img":"Home"],["name":"Terms","img":"Home"],["name":"Rate Us","img":"Home"]]
   
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


extension LeftVC : UITableViewDelegate,UITableViewDataSource {
    
    @available(iOS 2.0, *)
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 45
        
    }
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath )
        let str = settingList.object(at: indexPath.row) as! String//dict?.value(forKey: "tripName") as! String
        cell.textLabel?.text = str
        cell.textLabel?.textAlignment = NSTextAlignment.center
        return cell
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int{
        return 1
    }
    
    
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 10
    }
    
    
    
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return settingList.count
        
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //tripObj = tripList.object(at: indexPath.section) as? NSManagedObject
        //self.performSegue(withIdentifier: "toShowItems", sender: self)
        
    }
    
}
