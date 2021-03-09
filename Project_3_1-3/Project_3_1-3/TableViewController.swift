//
//  TableViewController.swift
//  Project_3_1-3
//
//  Created by Игорь Чумиков on 18.02.2021.
//  Copyright © 2021 Игорь Чумиков. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var flags = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Flags"
        //большой заголовок
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasSuffix("3x.png") {
                flags.append(item)
            }
        }
    }
    // MARK: - Table view data source
    //сколько всего ячеек
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flags.count
    }
    //cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = flags[indexPath.row].uppercased().replacingOccurrences(of: "@3X.PNG", with: "")
        cell.imageView?.image = UIImage(named: flags[indexPath.row])
        
        cell.imageView?.layer.borderWidth = 1
        cell.imageView?.layer.borderColor = UIColor.lightGray.cgColor

        return cell
    }
    //height cell
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    //переход
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController
        vc?.selectedImage = flags[indexPath.row]
        navigationController?.pushViewController(vc!, animated: true)
    }
}
