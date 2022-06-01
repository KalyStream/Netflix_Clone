//
//  DataPersistenseManager.swift
//  Netflix_Clone
//
//  Created by Kalybay Zhalgasbay on 21.04.2022.
//

import Foundation
import UIKit
import CoreData

class DataPersistenseManager {
    
    enum DatabaseError: Error {
        case failedToSaveData
        case failedToFetchData
        case failedToDeleteData
    }
    
    static let shared = DataPersistenseManager()
    
    func downloadTitleWith(model: Title, completion: @escaping (Result<Void, Error>)-> Void){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        let item = TitleItem(context: context)
        
        item.originalTitle = model.originalTitle
        item.id = Int64(model.id)
        item.overview = model.overview
        item.releaseDate = model.releaseData
        item.voteCount = Int64(model.voteCount)
        item.voteAverage = model.voteAverage
        item.originalName = model.originalName
        item.posterPath = model.posterPath
        item.mediaType = model.mediaType
        
        do {
            try context.save()
            completion(.success(()))
        } catch {
            completion(.failure(DatabaseError.failedToSaveData))
        }
    }
    
    func fetchingTitlesFromDatabase(completion: @escaping (Result<[TitleItem], Error>)-> Void){
    
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        let request: NSFetchRequest<TitleItem>
        
        request = TitleItem.fetchRequest()
        
        do {
            let titles = try context.fetch(request)
            completion(.success(titles))
            
            
        } catch {
            completion(.failure(DatabaseError.failedToFetchData))
        }
    }
    
    func deleteTitleWith(model: TitleItem, completion: @escaping (Result<Void, Error>)-> Void){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        context.delete(model)
        
        do {
            try context.save()
            completion(.success(()))
        } catch {
            completion(.failure(DatabaseError.failedToDeleteData))
        }
    }
    
}
