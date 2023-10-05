//
//  ToDoDaoRepository.swift
//  Tasky
//
//  Created by Utku Çetinkaya on 5.10.2023.
//

import RxSwift

class ToDoDaoRepository {
    
    // MARK: - Properties
    
    var toDoList = BehaviorSubject<[ToDoItem]>(value: [ToDoItem]())
    let db: FMDatabase?
    
    // MARK: - Init
    
    init() {
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("toDos.sqlite")
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    // MARK: - Functions
    
    // Kaydet
    func save(name: String) {
        db?.open()
        
        do {
            try db!.executeUpdate("INSERT INTO toDos (name) VALUES (?)", values: [name])
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    // Guncelle
    func update(id: Int, name: String) {
        db?.open()
        
        do {
            try db!.executeUpdate("UPDATE toDos SET name=? WHERE id=?", values: [name,id])
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    // Arama
    func search(searchText: String) {
        db?.open()
        var list = [ToDoItem]()
        
        do {
            let result = try db!.executeQuery("SELECT * FROM toDos WHERE name like '%\(searchText)%'", values: nil)
            
            while result.next() {
                let id = Int(result.string(forColumn: "id"))!
                let name = result.string(forColumn: "name")
                
                let toDos = ToDoItem(id: id,name: name)
                list.append(toDos)
            }
            toDoList.onNext(list)
        } catch {
            
        }
    }
    
    // Sil
    func deleteToDo(id: Int) {
        db?.open()
        
        do {
            try db!.executeUpdate("DELETE FROM toDos WHERE id=?", values: [id])
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    // Yukle
    func setupToDos() {
        
        db?.open()
        
        var list = [ToDoItem]()

        do {
            let result = try db!.executeQuery("SELECT * FROM toDos", values: nil)
            
            while result.next() {
                let id = Int(result.string(forColumn: "id"))!
                let name = result.string(forColumn: "name")
                
                let toDos = ToDoItem(id: id,name: name)
                list.append(toDos)
            }
            
            toDoList.onNext(list)
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    // kopyala
    func copyDatabase(){
        let bundleYolu = Bundle.main.path(forResource: "toDos", ofType: ".sqlite")
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("toDos.sqlite")
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: kopyalanacakYer.path){
            print("Veritabanı zaten var")
        }else{
            do{
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
            }catch{}
        }
    }
}
