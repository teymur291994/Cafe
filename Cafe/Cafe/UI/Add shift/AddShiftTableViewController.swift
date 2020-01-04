//
//  AddShiftTableViewController.swift
//  Cafe
//
//  Created by Timur on 1/4/20.
//  Copyright © 2020 Timur. All rights reserved.
//

import UIKit

enum AddShiftCellType {
    case startDate
    case endDate
    case employee
    case role
    case color
}

extension AddShiftCellType: CaseIterable {}

class AddShiftTableViewController: UIViewController {
    // MARK: - properties

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        return tableView
    }()

    // MARK: - override

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewHierarchy()
    }

    // MARK: - private

    private func setupViewHierarchy() {
        addTableView()
    }

    private func addTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
        }
    }
}

extension AddShiftTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AddShiftCellType.allCases.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch AddShiftCellType.allCases[indexPath.row] {
        case .startDate, .endDate:

        default:

        }
    }
}
