import UIKit

// MARK: - Functions

class Fonksiyonlar {
    
    // Soru 1:
    func soru1(celsius: Int) -> Double {
        let fahrenhiet = (Double(celsius) * 1.8) + 32
        let yuvarlanmis = (fahrenhiet * 10).rounded() / 10
         
         // Elde edilen değeri döndür
         return yuvarlanmis
    }
    
    // Soru2:
    func soru2(kisaKenar: Int, uzunKenar: Int) -> Int {
      return 2 * (kisaKenar + uzunKenar)
    }
    
    // Soru3:
    func saru3(n: Int) -> Int {
      var result = 1
      for i in 1...n {
        result *= i
      }
      return result
    }
    
    // Soru4:
    func soru4(in kelime: String) -> Int {
      return kelime.filter { $0 == "a" }.count
    }
    
    // Soru5:
    func soru5(kenarSayisi: Int) -> Int {
      return kenarSayisi * 180 - 360
    }
    
    // Soru6:
    
    func soru6(gunSayisi: Int) -> Int {
      let calismaSaatiUcreti = 10 // TL
      let mesaiUcreti = 20 // TL
      let gunlukCalismaSaati = 8 // Saat
      let mesaiBaslangici = 160 // Saat

      let toplamCalismaSaati = gunSayisi * gunlukCalismaSaati
      let mesaiSaati = toplamCalismaSaati > mesaiBaslangici ? toplamCalismaSaati - mesaiBaslangici : 0

      return mesaiSaati * mesaiUcreti + (toplamCalismaSaati - mesaiSaati) * calismaSaatiUcreti
    }
    
    // Soru7:
    
    func soru7(kota: Int) -> Int {
      let ilk50GBUcreti = 100 // TL
      let kotaAsimiUcreti = 4 // TL
      let kotaLimiti = 50 // GB

      return kota > kotaLimiti ? ilk50GBUcreti + (kota - kotaLimiti) * kotaAsimiUcreti : ilk50GBUcreti
    }
}

// MARK: - Properties

let f = Fonksiyonlar()

// MARK: - Sonuclar

// Sonuc1:

var celsius = 26
let gelenSonuc1 = f.soru1(celsius: celsius)
print("Fahrenhiet : \(gelenSonuc1)")

// Sonuc2:

var kisaKenar = 5
var uzunKenar = 10
let gelenSonuc2 = f.soru2(kisaKenar: kisaKenar, uzunKenar: uzunKenar)
print("Dikdortgenin Cevresi : \(gelenSonuc2)")

// Sonuc3:

var n = 5
let gelenSonuc3 = f.saru3(n: n)
print("Faktoriyel Degeri : \(gelenSonuc3)")

// Sonuc4:

var kelime = "Yazdigimiz bu cumlede kac tane a harfi var?"
let gelenSonuc4 = f.soru4(in: kelime)
print("Girilen ifade de \(gelenSonuc4) adet 'a' harfi bulunuyor.")

// Sonuc5:

var kenarSayisi = 6
let gelenSonuc5 = f.soru5(kenarSayisi: kenarSayisi)
print("Ic acilar toplami : \(gelenSonuc5)")

// Soru6:

var gunSayisi = 22
let gelenSonuc6 = f.soru6(gunSayisi: gunSayisi)
print("Toplam maas : \(gelenSonuc6)₺")

// Soru7:

var kota = 55
let gelenSonuc7 = f.soru7(kota: kota)
print("Internet kullanim ucreti : \(gelenSonuc7)₺")
