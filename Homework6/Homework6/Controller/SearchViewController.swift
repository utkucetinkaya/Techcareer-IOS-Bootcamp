//
//  ViewController.swift
//  Homework6
//
//  Created by Utku Çetinkaya on 29.09.2023.
//

import UIKit

class SearchViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: - Variables
    
    var programListesi = [Program]()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewDelegate()
        data()

    }
    
    private func tableViewDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func data() {
        programListesi.append(Program.init(image: "mevzular", title: "Mevzular Açık Mikrofon", category: "Program"))
        programListesi.append(Program.init(image: "ayakIsleri", title: "Ayak İşleri", category: "Dizi"))
        programListesi.append(Program.init(image: "dunyaBu", title: "Dünya Bu", category: "Dizi"))
        programListesi.append(Program.init(image: "tuzBiber", title: "Tuz Biber", category: "Program"))
        programListesi.append(Program.init(image: "dogu", title: "Doğu Demirkol", category: "Program"))
        programListesi.append(Program.init(image: "cezailer", title: "Cezailer", category: "Dizi"))
        programListesi.append(Program.init(image: "bkm", title: "BKM Mutfak - Stand Up", category: "Program"))
        programListesi.append(Program.init(image: "10binAdim", title: "10 Bin Adım", category: "Dizi"))
        programListesi.append(Program.init(image: "aslindaOzgursun", title: "Aslında Özgürsün", category: "Dizi"))
        programListesi.append(Program.init(image: "etkileyici", title: "#Etkileyici", category: "Dizi"))
        
    }
}

// MARK: - TableViewProtocol

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        programListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let hucre = tableView.dequeueReusableCell(withIdentifier: "cell") as! GainCell
        let program = programListesi[indexPath.row]
        hucre.nameLabel.text = program.title
        hucre.categoryLabel.text = program.category
        hucre.searchImageView.image = UIImage(named: program.image ?? "" )
        return hucre
    }
}
