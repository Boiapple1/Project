//
//  ViewModel.swift
//  MusicCoreData
//
//  Created by Consultant on 7/22/22.
//

import Foundation


protocol MusicViewModelCore {
    func bind(updateHandler: @escaping () -> Void)
    func getMusic()
}
protocol MusicViewModelAttributes {
    var countsm: Int { get }
    func MusicTitle(for index: Int) -> String?
    func MusicArtist(for index: Int) -> String?
    func MusicGenres(for index: Int) -> String?
    func MusicReleastD(for index: Int) -> String?
    func musicImage(for index: Int, completion: @escaping (Data?) -> Void)
 
}
protocol CoreManagement {
    func makefav(index: Int)
    func loadfav()
    func getnum() -> Int
    func getalbumInfo() -> [Album]
    func deleteall()
    func deleteFav(inds: String) 
}

typealias MusicModelType = MusicViewModelCore & MusicViewModelAttributes

class MusicViewModel{
    var manager: CoreDataManager

    var counts: Int?
    var favorites: Album?{
        didSet {
            self.updateHandler?()
        }
    }

    var a: Int = 0
    
    
    
     var music100: [Results] = [] {
        didSet {
            print("Test: 5")
            self.updateHandler?()
        }
    }
    private var networkManager: NetworkService
    
    private var updateHandler: (() -> Void)?
    
    init(networkManager: NetworkService, manager: CoreDataManager = CoreDataManager()) {
        self.networkManager = networkManager
        self.manager = manager

    }

    
}
extension MusicViewModel: MusicViewModelCore {
    
    func bind(updateHandler: @escaping () -> Void) {
        self.updateHandler = updateHandler
    }
    
    func getMusic() {
        
        self.networkManager.getModel(url: NetworkParams.TopMusic.url) { (result: Result<topmusic, NetworkError>) in
            switch result {
            case .success(let music):
                self.music100.append(contentsOf: music.feed.results)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
extension MusicViewModel: MusicViewModelAttributes {
    
    var countsm: Int {
        
        return (self.music100.count)
    }
    
    func MusicArtist(for index: Int) -> String? {
        guard index < self.countsm else { return nil }
        return self.music100[index].artistName
    }
    func MusicTitle(for index: Int) -> String? {
        guard index < self.countsm else { return nil }
        return self.music100[index].name
    }
    func MusicReleastD(for index: Int) -> String? {
        guard index < self.countsm else { return nil }
        return self.music100[index].releaseDate
    }
    func MusicGenres(for index: Int) -> String? {
        guard index < self.countsm else { return nil }
            return self.music100[index].genres[0].name


    }

    
    func musicImage(for index: Int, completion: @escaping (Data?) -> Void) {
        
        guard index < self.countsm else {
            completion(nil)
            return
        }
        
        let musicposter = self.music100[index].artworkUrl100
//        
//        // Check ImageCache
        if let imageData = ImageCache.shared.getImageData(key: "\(index)") {
            completion(imageData)
            return
        }
        
        // Else call network
        self.networkManager.getRawData(url: NetworkParams.MusicImage(musicposter).url) { result in
            switch result {
            case .success(let imageData):
                ImageCache.shared.setImageData(data: imageData, key: "\(index)")
                completion(imageData)
            case .failure(let error):
                print(error)
            }
        }
    }
    func musicImage(for index: String, completion: @escaping (Data?) -> Void) {
        
        
        let musicposter = index
//
//        // Check ImageCache
//        if let imageData = ImageCache.shared.getImageData(key: "\(index)") {
//            completion(imageData)
//            return
//        }
        
        // Else call network
        self.networkManager.getRawData(url: NetworkParams.MusicImage(musicposter).url) { result in
            switch result {
            case .success(let imageData):
                //ImageCache.shared.setImageData(data: imageData, key: "\(index)")
                completion(imageData)
            case .failure(let error):
                print(error)
            }
        }
    }

   
    
}
extension MusicViewModel: CoreManagement{


    
    func makefav(index: Int) {
        
        self.favorites = self.manager.Alb(Alname: music100[index].name, Arname: music100[index].artistName, AlImage: music100[index].artworkUrl100, Gen: music100[index].genres[0].name, ReDate: music100[index].releaseDate, id1: index)
//        print(counts ?? 1000)

        self.manager.saveContext()
        
    }
    func loadfav(){
        self.favorites = self.manager.fetchfavorite()
        
    }
    func getnum() -> Int{
        self.a = self.manager.countfavs()
        
        return a
    }

    func getalbumInfo() -> [Album] {
       let a = self.manager.findAll()
        //let a = self.manager.getone()
        return a
    }

 
    func deleteall(){
        self.manager.deleteAllData("Album")
        
    }
    func deleteFav(inds: String) {
       
        self.manager.deleteFavorite1(i: inds)

        
    }
}
