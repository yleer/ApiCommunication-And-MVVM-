//
//  BoardViewController.swift
//  Week14
//
//  Created by Yundong Lee on 2021/12/28.
//

import UIKit

class BoardViewController: UIViewController {
    
    let mainView = BoardView()
    let viewModel = BoardViewModel()
    
    
    
    override func loadView() {
        super.loadView()
        self.view = mainView
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchBoard()
    }
    
}

extension BoardViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    
    
}
