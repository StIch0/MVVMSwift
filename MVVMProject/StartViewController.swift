//
//  ViewController.swift
//  MVVMProject
//
//  Created by Pavel Burdukovskii on 17/01/18.
//  Copyright © 2018 Pavel Burdukovskii. All rights reserved.
//
//ули ацинка 30 б ????
import UIKit

class StartViewController: UIViewController {
    weak var viewModel: StartViewModel! {
        didSet {
            viewModel.updateWeather{
                self.tableView.reloadData()
                self.actionView.stopAnimating()
            }
        }
    }
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var actionView: UIActivityIndicatorView!
    let cellIdentifier : String = "CityCell"
    let segueIdentidier: String = "showDetails"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        actionView.hidesWhenStopped = true
        setupTableView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let id = segue.identifier, id == segueIdentidier,
//        let detailViewController = segue.destination as? DetailsViewController,
//             let index = sender as? Int {
        print("prepare",sender!)
        let index = sender as? Int
        print(index!)
        let detailViewController = segue.destination as? DetailsViewController
            detailViewController?.viewModel = self.viewModel.detailsViewModel(index: index!)
       // }
    }
    func setupTableView(){
        self.tableView.dataSource = self
        self.tableView.delegate = self
//        self.tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 200
        self.tableView.contentInset.top = 20
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
extension StartViewController: UITableViewDataSource {
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CityCell
//        if cell == nil {
//            cell = UINib(nibName: cellIdentifier, bundle: nil).instantiate(withOwner: nil, options: nil).first as? CityCell
//            
//        }
        cell?.viewModel = self.viewModel.cellViewModel(index: indexPath.row)
        return cell!
    }

    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfCities()
    }
}
extension StartViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: segueIdentidier, sender: indexPath.row)
    }
}


