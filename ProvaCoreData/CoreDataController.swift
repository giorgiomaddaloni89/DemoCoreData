//
//  CoreDataController.swift
//  ProvaCoreData
//
//  Created by Giorgio Maddaloni on 08/02/18.
//  Copyright © 2018 Giorgio Maddaloni. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataController{
    static let shared = CoreDataController()
    private var context: NSManagedObjectContext
    
    private init(){
       let application = UIApplication.shared.delegate as! AppDelegate
       self.context = application.persistentContainer.viewContext
    }
    
    
    
    
    private func saveContext(){
        do {
            try self.context.save()
        } catch let error {
            print("  Something went wrong: \n \(error) \n")
        }
    }
    
    func addLibro(nome: String, autore: String, nPagine: Int){
        if loadBooksToCheck(name: nome){
            print("Questo libro esiste già!")
        } else{
            let entity = NSEntityDescription.entity(forEntityName: "Libro", in: self.context)
            let newLibro = Libro(entity: entity!, insertInto: self.context)
            newLibro.nome = nome
            newLibro.autore = autore
            newLibro.pagine = Int16(nPagine)
            
            saveContext()
            print(" \(newLibro.nome!) saved")
        }
    }
    
    func loadAllBooks() {
        
        let fetchRequest: NSFetchRequest<Libro> = Libro.fetchRequest()
        
        do {
            let array = try self.context.fetch(fetchRequest)
            guard array.count > 0 else {print("[CDC] Non ci sono elementi da leggere "); return}
            
            for x in array {
                let book = x
                print("[CDC] Libro \(book.nome!) - Autore \(book.autore!)")
            }
            
        } catch let errore {
            print("[CDC] Problema esecuzione FetchRequest")
            print("  Stampo l'errore: \n \(errore) \n")
        }
    }
    
    func loadBooksFromAuthor(author: String) {
        
        let fetchRequest: NSFetchRequest<Libro> = Libro.fetchRequest()
        fetchRequest.returnsObjectsAsFaults = false
        let predicate = NSPredicate(format: "autore == %@ AND nome == %@ ", author,"Libro2")
        fetchRequest.predicate = predicate
        do {
            let array = try self.context.fetch(fetchRequest)
            
            guard array.count > 0 else {print("No elements"); return}
            
            for x in array {
                let book = x
                print("Book \(book.nome!) - Author \(book.autore!)")
            }
            
        } catch let errore {
            print("Problem in FetchRequest")
            print("\n \(errore) \n")
        }
    }
    func loadBook(name: String) -> [Libro]{
        var books: [Libro] = []
        let fetchRequest: NSFetchRequest<Libro> = Libro.fetchRequest()
        fetchRequest.returnsObjectsAsFaults = false
        let predicate = NSPredicate(format: "nome == %@ ", name)
        fetchRequest.predicate = predicate
        do {
            let array = try self.context.fetch(fetchRequest)
            
            guard array.count > 0 else {print("No elements");return books}
            
            for x in array {
                let book = x
                print("Book \(book.nome!) - Author \(book.autore!)")
            }
            books = array
            
            return array
        } catch let errore {
            print("Problem in FetchRequest")
            print("\n \(errore) \n")
        }
        return books
    }
    
    func deleteBook(name: String) {
        let book = self.loadBook(name: name)
        for x in book{
        self.context.delete(x)
        }
        do {
            try self.context.save()
        } catch let errore {
            print("Problems while deleting book ")
            print(" \n \(errore) \n")
        }
    }
    
    func loadBooksToCheck(name: String) -> Bool{
        print("[CDC] Recupero tutti i libri dal context ")
        var result:Bool = false
        let fetchRequest: NSFetchRequest<Libro> = Libro.fetchRequest()
        fetchRequest.returnsObjectsAsFaults = false
        
        let predicate = NSPredicate(format: "nome == %@ ",name)
        fetchRequest.predicate = predicate
        do {
            let array = try self.context.fetch(fetchRequest)
            if (array.count > 0){
                result = true
            }
        } catch let errore {
            print("[CDC] Problema esecuzione FetchRequest")
            print("  Stampo l'errore: \n \(errore) \n")
        }
        return result
    }
}
