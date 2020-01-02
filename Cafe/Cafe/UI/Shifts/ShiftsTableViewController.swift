//
//  ShiftsTableViewController.swift
//  Cafe
//
//  Created by Timur on 1/2/20.
//  Copyright © 2020 Timur. All rights reserved.
//

import UIKit

class ShiftsTableViewController: UIViewController {
    // MARK: - properties

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        return tableView
    }()
    private var shifts = [Shift]()

    // MARK: - override

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewHierarchy()
        setupContent()
    }

    // MARK: - public

    func addShift(_ shift: Shift) {
        shifts.append(shift)

        let indexPath:IndexPath = IndexPath(row:(shifts.count - 1), section:0)
        tableView.insertRowAt(indexPath: indexPath)
    }

    // MARK: - private

    private func setupContent() {
        getShifts()
    }

    private func getShifts() {
        shifts.removeAll()
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            let workersProvider = WorkersProvider(parsingManager: delegate.services.parsingManager)
            workersProvider.shifts { [weak self] (shifts) in
                guard let shifts = shifts else { return }
                self?.shifts = shifts
            }
        }
        tableView.reloadData()
    }

    private func setupViewHierarchy() {
        addTableView()
        tableView.registerCell(ShiftsTableViewCell.self)
    }

    private func addTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
        }
    }
}

extension ShiftsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shifts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ShiftsTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.selectionStyle = .none
        let shift = shifts[indexPath.row]
        cell.configure(shift: shift)
        return cell
    }
}
