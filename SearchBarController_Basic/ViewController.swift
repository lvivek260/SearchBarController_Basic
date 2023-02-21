//
//  ViewController.swift
//  SearchBarController_Basic
//
//  Created by Admin on 19/02/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var studentTableView: UITableView!
    
    var students:[String] = [String]()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        studentTableView.dataSource = self
        studentTableView.delegate = self
       
        setSearchBar()
        setData()
    }
    
    private func setData(){
       students = ["Lokhande Vivek","Pavan Kumar","Yash Chavan","Rameshowar Kumar","Avishkar Kakade","Abhi Lokhande","Mahesh Sathe","Tukaram Savant","Shivam Lokhande","Pradip Chavan","Shubham Savant","Dada Madane"]
    }
    
    private func setSearchBar(){
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
    }
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = studentTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = students[indexPath.row]
        return cell
    }
}

extension ViewController:UISearchResultsUpdating,UISearchBarDelegate{
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else{return}
        if searchText == ""{
            setData()
        }
        else{
            setData()
            students = students.filter({
               return $0.contains(searchText)
            })
        }
        studentTableView.reloadData()
    }
}
