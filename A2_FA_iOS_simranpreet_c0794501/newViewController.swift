//
//  newViewController.swift
//  A2_FA_iOS_simranpreet_c0794501
//
//  Created by simranPreet KAur on 01/02/21.
//

import UIKit
import CoreData
class newViewController: UIViewController {

    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var arr = [Product]()
   
    
    @IBOutlet weak var provider: UITextField!
    @IBOutlet weak var descript: UITextView!
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var id: UITextField!
    
    @IBAction func cancelBtn(_ sender: Any)
    {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveBtn(_ sender: Any)
    {
        saveItem()
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func saveItem()
    {
        let save = Product(context: context)
        save.productName = name.text
        save.productID = id.text
        save.productDescription = descript.text
        save.productPrice = price.text
        save.productProvider = provider.text
        
        do{
            try context.save()
        }
        catch
        {
            print(error)
        }
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
