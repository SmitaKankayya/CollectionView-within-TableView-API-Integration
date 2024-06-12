//
//  CartsViewController.swift
//  CollectionViewOnTableViewAPI
//
//  Created by Smita Kankayya on 12/06/24.
//

import UIKit

class CartsViewController: UIViewController {
    
    @IBOutlet var cartsTableView: UITableView!
    var cart : [Cart] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeTableView()
        registerXIBWithTableView()
        jsonParsingUsingDecoder()
    }
    
    func  initializeTableView(){
        cartsTableView.dataSource = self
    }
    
    func  registerXIBWithTableView(){
        let uiNib = UINib(nibName: "CartsTableViewCell", bundle: nil)
        self.cartsTableView.register(uiNib, forCellReuseIdentifier: "CartsTableViewCell")
    }
    
    func jsonParsingUsingDecoder(){
        let url = URL(string: "https://dummyjson.com/carts")
        let urlRequest = URLRequest(url: url!)
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            
            let jsonDecoder = JSONDecoder()
            let tempCart = try! jsonDecoder.decode(CartDM.self, from: data!)
            self.cart = tempCart.carts
            print(self.cart)
            
            DispatchQueue.main.async{
                self.cartsTableView.reloadData()
            }
        }
        
        dataTask.resume()
    }
}

//MARK : UITableViewDataSource
extension CartsViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cartsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CartsTableViewCell", for: indexPath) as! CartsTableViewCell
        cartsTableViewCell.cartNoLabel.text = "Cart No : \(indexPath.row + 1)"
        cartsTableViewCell.initCart(dataValues: cart[indexPath.row])
        return cartsTableViewCell
    }
    
    
}

