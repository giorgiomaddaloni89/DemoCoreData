//
//  ViewController.swift
//  ProvaCoreData
//
//  Created by Giorgio Maddaloni on 07/02/18.
//  Copyright © 2018 Giorgio Maddaloni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        CoreDataController.shared.loadAllBooks()
//        test that functions! Enjoy!
        //CoreDataController.shared.addLibro(nome: "Libro4", autore: "Carlo", nPagine:2)
        //CoreDataController.shared.loadBooksFromAuthor(author: "michele")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

