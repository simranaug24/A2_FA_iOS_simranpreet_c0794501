//
//  ViewController.swift
//  A2_FA_iOS_simranpreet_c0794501
//
//  Created by simranPreet KAur on 30/01/21.
//

import UIKit
import CoreData
class ViewController: UIViewController, UISearchBarDelegate, UISearchControllerDelegate  {

    @IBOutlet weak var tableView: UITableView!
    var productData = [Product]()
    
   
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
   
    
    
    let searchController = UISearchController(searchResultsController: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        showSearchBar()
        searchController.delegate = self
        
      loadProduct()
        //saveProduct()
        
    
        
  /*
        let newProduct = NSEntityDescription.insertNewObject(forEntityName: "Product", into: context)
  
        newProduct.setValue("", forKey: "productID")
        newProduct.setValue("", forKey: "produxtName")
        newProduct.setValue("", forKey: "productPrice")
        */
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
         let destination = segue.destination as! DetailViewController
        
             let indexPath = tableView.indexPathForSelectedRow
            
                
        destination.selectedProduct = productData[indexPath!.row]
            
           
        
    }
    func showSearchBar() {
            searchController.searchBar.delegate = self
            searchController.obscuresBackgroundDuringPresentation = false
            searchController.searchBar.placeholder = "Search Note"
            navigationItem.searchController = searchController
            definesPresentationContext = true
            searchController.searchBar.searchTextField.textColor = .lightGray
        }

    func loadProduct(predicate: NSPredicate? = nil)
    {
        let result : NSFetchRequest<Product> = Product.fetchRequest()
        
        if let additionalPredicate = predicate {
                    result.predicate = additionalPredicate
                }
        
        
        do{
            productData = try context.fetch(result)
            tableView.reloadData()
        }
        catch
        {
            print(error)
        }
    }
    
    func saveProduct()
    {
        let newProdcut = Product(context: context)
        newProdcut.productName = "iphone 8"
        newProdcut.productID = 123
        newProdcut.productPrice = 800
        newProdcut.productProvider = "Apple"
        newProdcut.productDescription = """
        this is iphone 8
        Display
        4.70-inch (750x1334)
        Processor
        Apple A11 Bionic
        Front Camera
        7MP
        Rear Camera
        12MP
        RAM
        2GB
        Storage
        64GB
        Battery Capacity
        1821mAh
        OS
        iOS 11
 """
        productData.append(newProdcut)
        
        let newProdcut1 = Product(context: context)
        newProdcut1.productName = "Red mi note 9 pro"
        newProdcut1.productID = 124
        newProdcut1.productPrice = 1000
        newProdcut1.productProvider = "mi"
        newProdcut1.productDescription = """
The Redmi Note 9 Pro Max takes a giant leap in the Note journey.This smartphone features an unbeatable 64MP Quad Camera array that combines a powerful 64MP primary sensor, 8MP ultra-wide angle lens, a dedicated 5MP macro camera and a 2MP depth sensor, so you can dabble in truly pro photography. The Qualcomm® Snapdragon™ 720G delivers truly elite gaming with the Adreno 618 GPU and you can game non-stop for 14 hours with the massive 5020mAh battery
"""
        productData.append(newProdcut1)
        
        let newProdcut2 = Product(context: context)
        newProdcut2.productName = "Google Nest Mini"
        newProdcut2.productID = 125
        newProdcut2.productPrice = 8000
        newProdcut2.productProvider = "google"
        newProdcut2.productDescription = """
The small and mighty smart speaker that you control with your voice.
Dimensions----
Nest Mini is 5.08 cm (2") tall and 10.16 cm (4") wide and blends right into any room – on a coffee table, bedside table or wall.
Speakers---
Nest Mini sounds bigger and richer, with more power and 40% stronger bass1 to fill your bedroom or home office.
"""
        productData.append(newProdcut2)
        
        let newProdcut3 = Product(context: context)
        newProdcut3.productName = "Creative MUVO Play "
        newProdcut3.productID = 126
        newProdcut3.productPrice = 8580
        newProdcut3.productProvider = "creative"
        newProdcut3.productDescription = """
            The Creative MUVO Play is our latest portable and IPX7-certified waterproof Bluetooth speaker that is packed full of features. With dual micro drivers and dual bass radiators, MUVO Play sounds larger than it is! Designed for the outdoors, it is lightweight at 360g (12.6 oz), so you can bring it along with you to pool parties, camping trips, or your next exciting adventure!
"""
        productData.append(newProdcut3)
        
        let newProdcut4 = Product(context: context)
        newProdcut4.productName = "iphone 12 pro"
        newProdcut4.productID = 127
        newProdcut4.productPrice = 1250
        newProdcut4.productProvider = "Apple"
        newProdcut4.productDescription = """
This is iphone 12 pro
6.1” or 6.7”
Super Retina
XDR display3
5G capable4
A14 Bionic chip
Pro camera system
(Ultra Wide, Wide, Telephoto)
LiDAR Scanner for Night mode portraits and next‑level AR
Compatible with MagSafe accessories.
"""
        productData.append(newProdcut4)
        
        let newProdcut5 = Product(context: context)
        newProdcut5.productName = "Apple Watch Series 6"
        newProdcut5.productID = 128
        newProdcut5.productPrice = 6775
        newProdcut5.productProvider = "Apple"
        newProdcut5.productDescription =
            """
44mm or 40mm
case size

Always-On Retina display

GPS + Cellular1
GPS

Blood Oxygen app2
ECG app3
High and low heart rate notifications

Irregular heart rhythm notification4
Water resistant to 50 metres5
"""
        productData.append(newProdcut5)
        
        let newProdcut6 = Product(context: context)
        newProdcut6.productName = "MacBook Pro 13"
        newProdcut6.productID = 129
        newProdcut6.productPrice = 1500
        newProdcut6.productProvider = "Apple"
        newProdcut6.productDescription =
        """
            13.3″ Retina display1
        Apple M1 chip
        Also available with Intel Core i5 or i7 processor
        Up to 16GB memory4
        Up to 2TB storage2
        Up to 20 hours of battery life5

"""
        productData.append(newProdcut6)
        
        let newProdcut7 = Product(context: context)
        newProdcut7.productName = "Hp Chromebook"
        newProdcut7.productID = 120
        newProdcut7.productPrice = 8200
        newProdcut7.productProvider = "hp"
        newProdcut7.productDescription =
            """
        HP Chromebook x360 12b-ca0010TU
        Intel® Celeron® processor
        Chrome OS™
        Intel® UHD Graphics 600
        4 GB LPDDR4-2400 SDRAM (onboard)
        64GB eMMC + 100GB Cloud + 256GB expandable
        Starting at 1.35 kg
        Included:
        1 Year On-site Warranty
        Google Assistant
"""
        productData.append(newProdcut7)
        
        let newProdcut8 = Product(context: context)
        newProdcut8.productName = "Airpods"
        newProdcut8.productID = 121
        newProdcut8.productPrice = 500
        newProdcut8.productProvider = "one plus"
        newProdcut8.productDescription =
            """
OnePlus Buds and OnePlus phones, when used together, will provide the best experience. They are also compatible with all Bluetooth devices; the longest Bluetooth distance is 10m between OnePlus Buds and the Bluetooth device. Due to the nature of Bluetooth earphones, electromagnetic interference in the area may cause the connection to break. Based on the nature of wireless technology, when the device screen is on and transmits the Bluetooth sound signal at the same time, "delay" may occur in the audio and the video signals, meaning the sound may not synchronized with the picture.
"""
        productData.append(newProdcut8)
        
        let newProdcut9 = Product(context: context)
        newProdcut9.productName = "iPad mini"
        newProdcut9.productID = 122
        newProdcut9.productPrice = 8550
        newProdcut9.productProvider = "Apple"
        newProdcut9.productDescription =
            """
            7.9”
            Retina display

            A12 Bionic chip

            Compatible with Bluetooth keyboards

            Compatible with Apple Pencil (1st generation)
            """
        productData.append(newProdcut9)
        do{
            try context.save()
            tableView.reloadData()
        }
        catch
        {
            print(error)
        }
        
    }
    
    // Mark:
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    // add predicate
    let predicate = NSPredicate(format: "productName CONTAINS[cd] %@", searchBar.text!)
    loadProduct(predicate: predicate)//
}


/// when the text in text bar is changed
/// - Parameters:
///   - searchBar: search bar is passed to this function
///   - searchText: the text that is written in the search bar
func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    if searchBar.text?.count == 0 {
        loadProduct()
        
        DispatchQueue.main.async {
            searchBar.resignFirstResponder()
        }
    }
}

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        loadProduct()
    }
}

extension ViewController:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return productData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "product_cell", for: indexPath)
        cell.textLabel?.text = productData[indexPath.row].productName
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        
        
        return 1
    }
}




