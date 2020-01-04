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

struct AddShiftCell {
    var title: String
    var type: AddShiftCellType
}

extension AddShiftCellType: CaseIterable {}

class AddShiftTableViewController: UIViewController {
    // MARK: - properties

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.contentInset.top = 60
        return tableView
    }()
    private var addShiftCells = [AddShiftCell]()
    private lazy var customDatePicker = CustomDatePicker.instantiate(delegate: self)
    private var selectedDatePickerCellIndexPath: IndexPath?

    // MARK: - override

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewHierarchy()
        setupBehaviour()
    }

    // MARK: - private

    private func setupBehaviour() {
        tableView.registerCell(DatePickerTableViewCell.self)
    }

    private func setupViewHierarchy() {
        addTableView()
        initItems()
    }

    private func initItems() {
        let startDateAddShiftCell = AddShiftCell(title: "addShiftScreenStartDate".localized, type: .startDate)
        let endDateAddShiftCell = AddShiftCell(title: "addShiftScreenEndDate".localized, type: .endDate)

        addShiftCells.append(startDateAddShiftCell)
        addShiftCells.append(endDateAddShiftCell)
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
        return addShiftCells.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let addShiftCell = addShiftCells[indexPath.row]
//        switch addShiftCell.type {
//        case .startDate, .endDate:
            let cell: DatePickerTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configure(title: addShiftCell.title, delegate: self)
        cell.selectionStyle = .none

            return cell
//        default:

//        }
    }
}

extension AddShiftTableViewController: AddShiftsTableViewCellDelegate {
    func dateButtonPressed(in cell: DatePickerTableViewCell) {
        selectedDatePickerCellIndexPath = tableView.indexPath(for: cell)
        if customDatePicker.superview == nil {
            customDatePicker.alpha = 0
            UIView.animate(withDuration: 0.5) {
                self.view.addSubview(self.customDatePicker)
                self.customDatePicker.snp.makeConstraints { (maker) in
                    maker.height.equalTo(254)
                    maker.left.right.bottom.equalToSuperview()
                }
                self.customDatePicker.alpha = 1
            }
        }
    }
}

extension AddShiftTableViewController: CustomDatePickerDelegate {
    func selected(_ date: Date) {
        if let selectedDatePickerCellIndexPath = selectedDatePickerCellIndexPath,
            let cell = tableView.cellForRow(at: selectedDatePickerCellIndexPath) as? DatePickerTableViewCell {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .short
            dateFormatter.timeStyle = .short
            let dateString = dateFormatter.string(from: date)
            cell.setDateValue(dateString)
        }
    }
}
