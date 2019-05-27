//
//  ViewController.swift
//  Catalog
//
//  Created by Kishan on 4/7/19.
//  Copyright © 2019 Kishan. All rights reserved.
//

import UIKit
import RealmSwift
import Contacts

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var frendoTableView: UITableView!
    
    let contactsService: ContactsService = ContactsService()
    var contacts: Array<CNContact> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        frendoTableView.delegate = self
        frendoTableView.dataSource = self

        contacts = contactsService.fetchContacts() ?? []
    }
    
    // authenticate user with Realm
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        title = "Welcome"
        
        if let _ = SyncUser.current {
            print("were already logged in")
        } else {
            let creds = SyncCredentials.nickname("Kishan")
            SyncUser.logIn(with: creds, server: Constants.AUTH_URL, onCompletion: { [weak self](user, err) in
                if let _ = user {
                    print("we just logged in")
                } else if let error = err {
                    fatalError(error.localizedDescription)
                }
            })
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FrendoTableViewCell = frendoTableView.dequeueReusableCell(withIdentifier: "frendoCell", for: indexPath) as! FrendoTableViewCell
        let name = contacts[indexPath.row].givenName + " " + contacts[indexPath.row].familyName
        cell.frendoName.text = name
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("clicked")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "viewFrendoSegue") {
            if let indexPath = self.frendoTableView.indexPathForSelectedRow {
                let controller = segue.destination as! FrendoViewController
                controller.frendo = contacts[indexPath.row].givenName
            }
        }
    }
}

