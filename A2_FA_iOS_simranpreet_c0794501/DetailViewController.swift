//
//  DetailViewController.swift
//  A2_FA_iOS_simranpreet_c0794501
//
//  Created by simranPreet KAur on 30/01/21.
//

import UIKit
import CoreData

class DetailViewController: UIViewController {

    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var provider: UITextField!
    
    @IBOutlet weak var info: UITextView!
    
    var product = [Product]()
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    var selectedProduct : Product?
    {
        didSet
        {
            loadProduct()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadProduct()
        showData()
        // Do any additional setup after loading the view.
    }
    
    
    func loadProduct(predicate: NSPredicate? = nil)
    {
        
        let folderPredicate = NSPredicate(format: "pro_.productName  = %@", selectedProduct!.productName!)
        let request: NSFetchRequest<Product> = Product.fetchRequest()
        request.predicate = folderPredicate
        do{
            product = try context.fetch(request)
        }
        catch
        {
            print("error\(error.localizedDescription)")
        }
        
    }
    
    func showData ()
    {
        name.text = selectedProduct?.productName
       id.text = String(selectedProduct!.productID)
        price.text = String(selectedProduct!.productPrice)
        provider.text = selectedProduct!.productProvider
        info.text = selectedProduct?.productDescription
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
