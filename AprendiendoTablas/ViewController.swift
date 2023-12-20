//
//  ViewController.swift
//  AprendiendoTablas
//
//  Created by Antony Huaman Alikhan on 18/12/23.
//

import UIKit

class ViewController: UIViewController {
    
    private let arryName = [1,2,3,4,5]
    
    private var dataSource = ["@carlosmejis3185", "@mariohard", "@pedrobustamante", "@cecilio12", "@platzi"]
    
    @IBOutlet weak var tableView: UITableView!
    
    /*
     1. Implementar Data Source
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //No Olvidar :)
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TweetTableViewCell", bundle: nil), forCellReuseIdentifier: "TweetTableViewCell")
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "mi-celda")
        
        //Para interactuarar implementar el delegate
        tableView.delegate = self
    }


}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("La celda #\(indexPath.row) fue seleccionado")
    }
}


//MARK: - UITableViewDataSource
extension ViewController : UITableViewDataSource {
    
    //1. Numbero de fila que tendra nuestra tabla
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    //2. Metodo para saber que celda debe mostrarse
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetTableViewCell", for: indexPath)
        
        if let newCell = cell as? TweetTableViewCell {
            newCell.setupCell(username: dataSource[indexPath.row], message: "Soy un tweet")
        }
        
        return cell
    }
    
}
