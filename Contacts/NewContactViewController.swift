//
//  NewContactViewController.swift
//  Contacts
//
//  Created by Alex Whitlock on 3/3/17.
//  Copyright © 2017 Alex Whitlock. All rights reserved.
//

import UIKit

class NewContactViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    var contact: Contact?
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text, let phone = phoneTextField.text, let email = emailTextField.text else { return }
        ContactController.shared.createContact(contactName: name, contactNumber: phone, contactEmail: email) { (error) in
            DispatchQueue.main.async {
                if let error = error {
                    print("Error: \(error.localizedDescription) File: \(#file) Line: \(#line)")
                }
            }
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func contactsButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
