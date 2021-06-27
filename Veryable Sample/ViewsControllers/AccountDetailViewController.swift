//
//  AccountDetailViewController.swift
//  Veryable Sample
//
//  Created by LMNTrix on 6/26/21.
//  Copyright © 2021 Veryable Inc. All rights reserved.
//

import UIKit

class AccountDetailViewController: UIViewController {

    @IBOutlet weak var imgAccount: UIImageView!
    @IBOutlet weak var lblAccountName: UILabel!
    @IBOutlet weak var lblAccountType: UILabel!
    @IBOutlet weak var btnDone: UIButton!
    
    var selectedAccount:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "DETAILS"
        navigationItem.backButtonTitle = " "
        if(Accounts.accounts[selectedAccount].accountType.rawValue == "bank"){
            imgAccount.image = UIImage(named: "bank")
        }else{
            imgAccount.image = UIImage(named: "card")
        }
        
        lblAccountName.text = Accounts.accounts[selectedAccount].accountName
        lblAccountType.text = Accounts.accounts[selectedAccount].desc
        view.backgroundColor = ViewColor.background.color
        imgAccount.tintColor = VBlue.dark.color
        btnDone.backgroundColor = VBlue.dark.color
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func doneClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        //dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
