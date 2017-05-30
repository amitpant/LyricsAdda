//
//  ViewController.swift
//  Lyrics
//
//  Created by Maahi on 30/05/17.
//  Copyright © 2017 Maahi. All rights reserved.
//

import UIKit
import CoreData
import Social
import MessageUI
import Messages
import Alamofire
import SwiftyJSON


class ViewController: UIViewController ,UIActionSheetDelegate,MFMailComposeViewControllerDelegate,MFMessageComposeViewControllerDelegate,UIDocumentInteractionControllerDelegate{

    
    
    var albumList = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    @IBAction func menuClick(_ sender: AnyObject) {
        
        
        
    }
    
    
    @IBAction func search(_ sender: AnyObject) {
    
    
    }
    
    
    
    @IBAction func shareApp(_ sender: AnyObject) {
        
        //Create the AlertController and add Its action like button in Actionsheet
        let actionSheetControllerIOS8: UIAlertController = UIAlertController(title: NSLocalizedString("share", comment: "share"), message: "", preferredStyle: .actionSheet)
        
        let cancelActionButton = UIAlertAction(title: NSLocalizedString("Cancel", comment: "CancelBtn"), style: .cancel) { _ in
            print("Cancel")
        }
        
        actionSheetControllerIOS8.addAction(cancelActionButton)
        
        let saveActionButton = UIAlertAction(title: "WhatsApp", style: .default)
        { _ in
            print("WhatsApp")
            self.callWhatsApp(title: "WhatsApp")
        }
        actionSheetControllerIOS8.addAction(saveActionButton)
        
        let FBButton = UIAlertAction(title: "Facebook", style: .default)
        { _ in
            print("FB")
            self.shareonFB(title: "FB")
        }
        actionSheetControllerIOS8.addAction(FBButton)
        
        let twitterButton = UIAlertAction(title: "twitter", style: .default)
        { _ in
            print("twitter")
            self.shareontwitter(title: "twitter")
        }
        actionSheetControllerIOS8.addAction(twitterButton)
        
        
        let EmailButton = UIAlertAction(title: NSLocalizedString("Email", comment: "Emailbtn"), style: .default)
        { _ in
            print("mail")
            self.sendMail(text: "hii");
        }
        actionSheetControllerIOS8.addAction(EmailButton)
        
        let SMSButton = UIAlertAction(title: NSLocalizedString("SMS", comment: "SMSbtn"), style: .default)
        { _ in
            print("message")
            self.sendSMS(text: "hii");
        }
        actionSheetControllerIOS8.addAction(SMSButton)
        
        
        
        
        let FlikerButton = UIAlertAction(title: "Fliker", style: .default)
        { _ in
            print("message")
            self.ShareFliker(text: "hii");
        }
        actionSheetControllerIOS8.addAction(FlikerButton)
        
        let PrintrestButton = UIAlertAction(title: "Printrest", style: .default)
        { _ in
            print("message")
            self.SharePrintrest(text: "hii");
        }
        actionSheetControllerIOS8.addAction(PrintrestButton)
        
        
        let InstagramButton = UIAlertAction(title: "Instagaram", style: .default)
        { _ in
            print("message")
            self.ShareInstagaram(text: "hii");
        }
        actionSheetControllerIOS8.addAction(InstagramButton)
        
        
        
        
        
        actionSheetControllerIOS8.view.tintColor =  UIColor(red:255.0/255.0, green:111.0/255.0, blue:64.0/255.0, alpha:1.0)
        
        
        self.present(actionSheetControllerIOS8, animated: true, completion: nil)
        

        
        
    }
    
  
    //https://stackoverflow.com/questions/31337490/how-to-share-image-in-instagramswift
    func ShareInstagaram(text:String)  {
        
        DispatchQueue.main.async {
            
            //Share To Instagrma:
            
            let instagramURL = URL(string: "instagram://app")
            
            if UIApplication.shared.canOpenURL(instagramURL!) {
                
                let imageData = UIImageJPEGRepresentation(UIImage(named: "Logo")!, 100)//UIImageJPEGRepresentation("Logo", 100)
                
                let writePath = (NSTemporaryDirectory() as NSString).appendingPathComponent("instagram.igo")
                
                do {
                    try imageData?.write(to: URL(fileURLWithPath: writePath), options: .atomic)
                    
                } catch {
                    
                    print(error)
                }
                
                let fileURL = URL(fileURLWithPath: writePath)
                
                let   documentController : UIDocumentInteractionController = UIDocumentInteractionController(url: fileURL)
                
                documentController.delegate = self
                
                documentController.uti = "com.instagram.exlusivegram"
                
                if UIDevice.current.userInterfaceIdiom == .phone {
                    
                    documentController.presentOpenInMenu(from: self.view.bounds, in: self.view, animated: true)
                    
                } else {
                    
                    // documentController.presentOpenInMenu(from: self.IGBarButton, animated: true)
                    
                }
                
                
            } else {
                
                print(" Instagram is not installed ")
                
                let errorAlert = UIAlertView(title: "Alert!", message: "Instagram is not installed", delegate: self, cancelButtonTitle: "OK")
                errorAlert.show()
                
            }
        }
        /* let image = UIImage(named: "Logo")
         let objectsToShare: [AnyObject] = [ image! ]
         let activityViewController = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
         activityViewController.popoverPresentationController?.sourceView = self.view
         
         
         activityViewController.excludedActivityTypes = [ UIActivityType.airDrop, UIActivityType.postToFacebook ]
         
         
         self.present(activityViewController, animated: true, completion: nil)
         */
        
        
    }
    
    
    
    func SharePrintrest(text:String)  {
        
        
        
        
    }
    
    
    func ShareFliker(text:String)  {
        
        
        
        
    }
    
    func sendSMS(text:String)  {
        
        if (MFMessageComposeViewController.canSendText()) {
            let messageVC = MFMessageComposeViewController()
            
            messageVC.body = "Enter a message";
            messageVC.recipients = ["Enter tel-nr"]
            messageVC.messageComposeDelegate = self;
            
            self.present(messageVC, animated: false, completion: nil)
        }else{
            let errorAlert = UIAlertView(title: NSLocalizedString("SMSConfiErrorALRT", comment: ""), message: NSLocalizedString("SMSConfiErrorMSG", comment: ""), delegate: self, cancelButtonTitle: "OK")
            errorAlert.show()
        }
        
        
        
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        switch (result.rawValue) {
        case MessageComposeResult.cancelled.rawValue:
            print("Message was cancelled")
            self.dismiss(animated: true, completion: nil)
        case MessageComposeResult.failed.rawValue:
            print("Message failed")
            self.dismiss(animated: true, completion: nil)
        case MessageComposeResult.sent.rawValue:
            print("Message was sent")
            self.dismiss(animated: true, completion: nil)
        default:
            break;
        }
    }
    
    
    //http://stackoverflow.com/questions/40887721/sending-an-email-from-swift-3
    func sendMail(text:String) {
        
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail()
        {
            self.present(mailComposeViewController, animated: true, completion: nil)
        }
        else
        {
            self.showSendMailErrorAlert()
        }
        
    }
    
    
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        mailComposerVC.setToRecipients(["abc@gmail.com"])
        mailComposerVC.setSubject("Sending you an in-app e-mail...")
        mailComposerVC.setMessageBody("Sending e-mail in-app is not so bad!", isHTML: false)
        
        return mailComposerVC
    }
    
    
    func showSendMailErrorAlert()
    {
        let sendMailErrorAlert = UIAlertView(title: NSLocalizedString("MailConfiErrorALRT", comment: ""), message:
            NSLocalizedString("MailConfiErrorMSG", comment: ""), delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }
    
    // MARK: MFMailComposeViewControllerDelegate Method
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
    //http://www.oodlestechnologies.com/blogs/Sending-WhatsApp-message-through-app-in-Swift
    func callWhatsApp(title:String)  {
        let urlString = "Sending WhatsApp message through app in Swift"
        let urlStringEncoded = urlString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        
        let url  = NSURL(string: "whatsapp://send?text=\(urlStringEncoded!)")
        
        if UIApplication.shared.canOpenURL(url! as URL) {
            UIApplication.shared.openURL(url! as URL)
        } else {
            let errorAlert = UIAlertView(title: "Cannot Send Message", message: "Your device is not able to send WhatsApp messages.", delegate: self, cancelButtonTitle: "OK")
            errorAlert.show()
        }
        
    }
    
    
    //https://medium.com/@h_shib8/share-contents-on-facebook-and-twitter-in-swift-3-slcomposeviewcontroller-fb02de241416
    
    func shareonFB (title:String){
        
        let vc = SLComposeViewController(forServiceType:SLServiceTypeFacebook)
        vc?.add(UIImage.init(named: "Logo"))
        vc?.add(URL(string: "http://www.example.com/"))
        vc?.setInitialText("Initial text here.")
        self.present(vc!, animated: true, completion: nil)
    }
    
    func shareontwitter (title:String){
        
        let vc = SLComposeViewController(forServiceType:SLServiceTypeTwitter)
        vc?.add(UIImage.init(named: "Logo"))
        vc?.add(URL(string: "http://www.example.com/"))
        vc?.setInitialText("Initial text here.")
        self.present(vc!, animated: true, completion: nil)
    }
    
    
}


/*
extension ViewController : UITableViewDelegate,UITableViewDataSource{
    
    
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
        return settingList.count
    }
    
    
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 10
    }
    
    //    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //        let dict = tripList.object(at: section) as? [String : Any]
    //        let str = dict?["showDate"]
    //        return str as! String?
    //    }
    
    
    
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
        
    }
    
    func configureCell(cell: UITableViewCell, atIndexPath indexPath: NSIndexPath) {
        // Fetch Record
        
        
        // cell.textLabel.text = eventDict.value(forKey: "title")  as! String//["title"] as? String
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       // tripObj = tripList.object(at: indexPath.section) as? NSManagedObject
        //self.performSegue(withIdentifier: "toShowItems", sender: self)
        
    }
    
}*/
