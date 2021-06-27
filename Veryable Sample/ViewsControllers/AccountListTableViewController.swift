//
//  AccountListTableViewController.swift
//  Veryable Sample
//
//  Created by LMNTrix on 6/26/21.
//  Copyright © 2021 Veryable Inc. All rights reserved.
//

import UIKit

class AccountListTableViewController: UITableViewController {

    @IBOutlet var tblAcoounts: UITableView!
    
    var selectedAccount : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableInit()
        tblAcoounts.reloadData()
        self.navigationItem.title = "ACCOUNTS"
        view.backgroundColor = ViewColor.background.color
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tblAcoounts.reloadData()
    }
    func tableInit(){
        let urlString1 = "https://veryable-public-assets.s3.us-east-2.amazonaws.com/veryable.json"

        let urlBuilder1 = URLComponents(string: urlString1)

        let url1 = urlBuilder1?.url
        var request1 = URLRequest(url: url1!)
        request1.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request1){(data,response,error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            do{
                let newData = try JSONDecoder().decode(accs.self, from: data!)
                
                DispatchQueue.main.async {
                        do {
                            Accounts.accounts = newData;
                            self.tblAcoounts.reloadData()
                            
                        }catch{
                            print(error)
                        }
                }
            }
            catch let parsingError{
                print(parsingError)
            }
        }.resume()
    }
    
    
    
    
    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //print(Accounts.accounts.count)
        return Accounts.accounts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellAccount", for: indexPath) as! AccountTableViewCell
        
        cell.lblType.text = Accounts.accounts[indexPath.row].accountName
        cell.lblName.text = Accounts.accounts[indexPath.row].desc
        //cell.lblName.text = Accounts.accounts[indexPath.row].desc
        cell.backgroundColor = ViewColor.background.color
        if(Accounts.accounts[indexPath.row].accountType.rawValue == "bank"){
            cell.lblNumber.text = "Bank Account: ACH - Same Day"
            cell.imgAccount?.image = UIImage(named: "bank")
            //cell.imgAccount?.image?.withTintColor("")
        }else{
            cell.lblNumber.text = "Card: Instant"
            cell.imgAccount?.image = UIImage(named: "card")
        }
        
        cell.imgAccount.tintColor = VBlue.dark.color

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedAccount = indexPath.row
        performSegue(withIdentifier: "details", sender: nil)
    }

    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        let destinationVC = segue.destination as! AccountDetailViewController
        destinationVC.selectedAccount = selectedAccount
        let backItem = UIBarButtonItem()
        backItem.title = " "
        backItem.tintColor = UIColor.black
        navigationItem.backBarButtonItem = backItem
        // Pass the selected object to the new view controller.
    }
    

}
