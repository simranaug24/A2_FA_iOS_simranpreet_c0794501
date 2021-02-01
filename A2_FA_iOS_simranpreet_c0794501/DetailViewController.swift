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
    var delegate : ProductTVC?
    var product = [Product]()
    var editEnable : Bool = false
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    var selectedProduct : Product?
    {
        didSet
        {
            editEnable = true
          //  loadProduct()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //loadProduct()
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
       id.text = selectedProduct!.productID
        price.text = selectedProduct!.productPrice
        provider.text = selectedProduct!.productProvider
        info.text = selectedProduct?.productDescription
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        if editEnable
        {
            delegate!.deleteProduct(product:selectedProduct!)
        }
        delegate!.updateProduct(name:name.text!,id:id.text!,price:price.text!,provider:provider.text!,descript:info.text!)
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
