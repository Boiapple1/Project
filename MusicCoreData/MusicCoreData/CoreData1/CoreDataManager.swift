//
//  CoreDataManager.swift
//  MusicCoreData
//
//  Created by Consultant on 7/22/22.
//

import Foundation
import CoreData


class CoreDataManager {
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "MusicCoreData")
        container.loadPersistentStores { (description, error) in
            if let _ = error {
                fatalError("Something went horribly wrong")
            }
        }
        return container
    }()
    
    
    func saveContext() {
        let context = self.persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print(error)
            }
        }
    }
    
    func countfavs() -> Int {
        let context = self.persistentContainer.viewContext
        
        let request: NSFetchRequest<Album> = Album.fetchRequest()
        
        do {
            let results = try context.fetch(request)
            return results.count
        } catch {
            print(error)
        }
        
        return 0
    }
    
    
    func fetchfavorite() -> Album? {
        let context = self.persistentContainer.viewContext
        
        let request: NSFetchRequest<Album> = Album.fetchRequest()
        
        do {
            let results = try context.fetch(request)

            if let Fav = results.first {
                
         
                return Fav
            }
        } catch {
            print(error)
        }
        
        return nil
    }
    
    func findAll() -> [Album] {
        // Helpers
        var albums: [Album] = []
        let context = self.persistentContainer.viewContext
        // Create Fetch Request
        let fetchRequest: NSFetchRequest<Album> = Album.fetchRequest()

        do {
            // Perform Fetch Request
            albums = try context.fetch(fetchRequest)
            
            for n in albums{
                if let namesd = n.albumname{
                    print(namesd)
                }
            }
            
        } catch {
            print("Unable to Fetch Workouts, (\(error))")
        }

        return albums
    }

    
    
    func deleteAllData(_ entity:String) {
        let context = self.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let results = try context.fetch(fetchRequest)
            for object in results {
                guard let objectData = object as? NSManagedObject else {continue}
                context.delete(objectData)
                
            }
        } catch let error {
            print("Detele all data in \(entity) error :", error)
        }
        self.saveContext()
    }

    
    func deleteFavorite(_ Fav: Album) {
        
        let context = self.persistentContainer.viewContext
        context.delete(Fav)
        self.saveContext()
    }
    
    func deleteFavorite1(i: String) {
        var albums: [Album] = []
        let context = self.persistentContainer.viewContext
        // Create Fetch Request
        let fetchRequest: NSFetchRequest<Album> = Album.fetchRequest()

        do {
            // Perform Fetch Request
            albums = try context.fetch(fetchRequest)
//            context.delete(albums[i])
            for n in albums{
                if i == n.artistname{
                    context.delete(n)
                }
            }
            
        } catch {
            print("Unable to Fetch Workouts, (\(error))")
        }
        self.saveContext()
    }
    
    
    func Alb(Alname: String, Arname:String, AlImage: String, Gen: String, ReDate: String, id1: Int ) -> Album?{
        let context = self.persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "Album", in: context) else { return nil }
        
        let album = Album(entity: entity, insertInto: context)
        
        album.albumname = Alname
        album.artistname = Arname
        album.genres = Gen
        album.picture = AlImage
        album.releasedate = ReDate
        album.ids = Int16(id1)
    
        return album
        
        
    }

    
    }
