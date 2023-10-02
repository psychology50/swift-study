//
//  SearchBar.swift
//  uikit-test
//
//  Created by 양재서 on 2023/10/02.
//

import UIKit

/**
 tjyny
 */
class SearchBarVC : UITableViewController {
    var detailVC: DetailVC? = nil
    var items = [Item]()
    var filteredItems = [Item]()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // item list 초기화
        items = [
            Item("Chocolate", "Chocolate Bar"),
            Item("Chocolate", "Chocolate Chip"),
            Item("Chocolate", "Dark Chocolate"),
            Item("Hard", "Lollipop"),
            Item("Hard", "Candy Cane"),
            Item("Hard", "Jaw Breker"),
            Item("Other", "Caramel"),
            Item("Other", "Sour Chew"),
            Item("Other", "Gummi Bear")
        ]
        
        initSearchController()
        
        if let splitViewController = splitViewController {
            let controllers = splitViewController.viewControllers
            detailVC = (controllers[controllers.count - 1] as! UINavigationController).topViewController as? DetailVC
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // splitViewController가 잡혀있는 경우 선택 행 해제
//        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchController.isActive ? filteredItems.count : items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let item: Item
        item = searchController.isActive ? filteredItems[(indexPath as NSIndexPath).row] : items[(indexPath as NSIndexPath).row]
        cell.textLabel!.text = item.name
        cell.detailTextLabel!.text = item.category
        return cell
    }
    
    override func prepare(for seque: UIStoryboardSegue, sender: Any?) {
        if seque.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let item: Item
                item = searchController.isActive ? filteredItems[(indexPath as NSIndexPath).row] : items[(indexPath as NSIndexPath).row]
                
                let controller = (seque.destination as! UINavigationController).topViewController as! DetailVC
                controller.detailItem = item
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
    
    func filterItems(_ searchText: String, scope: String = "All") {
        filteredItems = items.filter { item in
            if !(item.category == scope) && scope != "All" {
                return false
            }
            return item.name.lowercased().contains(searchText.lowercased()) || searchText == ""
        }
        tableView.reloadData()
    }
    
    private func initSearchController() {
        searchController.searchResultsUpdater = self // 검색 결과 업데이트할 객체
        searchController.dimsBackgroundDuringPresentation = false // 검색 중 배경 어두워 지는 효과 제거 (수정 필요)
        definesPresentationContext = true // 검색 컨트롤러가 다른 뷰 컨트롤러 제어
        searchController.searchBar.scopeButtonTitles = ["All", "Chocolate", "Hard", "Other"]
        searchController.searchBar.delegate = self // UISearchBarDelegate 메서드 구현 허용
        
        tableView.tableHeaderView = searchController.searchBar // 검색바를 테이블 뷰 헤더로 지정
    }
}

/**
 * UISearchResultsUpdating 프로토콜 채택
 * 사용자 검색 입력에 따른 결과 업데이트
 */
extension SearchBarVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterItems(searchController.searchBar.text!, scope: scope)
    }
}

/**
 * UISearchBarDelegate 프로토콜 채택
 * Scope 설정에 따른 검색 결과 제한
 */
extension SearchBarVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterItems(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
}
