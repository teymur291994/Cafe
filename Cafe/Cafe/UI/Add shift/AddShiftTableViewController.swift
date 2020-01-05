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
    private var selectedCellIndexPath: IndexPath?
    private var shiftRole: RoleType?
    private var shiftEmployeeName: String?
    private var shiftStartDate: Date?
    private var shiftEndDate: Date?
    private var shiftColor: ColorType?
    private var workers: [String]?

    // MARK: - override

    override func viewDidLoad() {
        super.viewDidLoad()
        setupContent()
        setupViewHierarchy()
        setupBehaviour()
    }

    // MARK: - public

    func getShift() -> Shift? {
        guard let role = shiftRole,
        let employeeName = shiftEmployeeName,
        let startDate = shiftStartDate,
        let endDate = shiftEndDate,
            let color = shiftColor else {
                return nil
        }
        return Shift(role: role,
                     name: employeeName,
                     startDate: startDate,
                     endDate: endDate,
                     color: color)
    }

    // MARK: - private

    private func setupContent() {
        getWorkers()
    }

    private func setupBehaviour() {
        tableView.registerCell(AddShiftTableViewCell.self)
    }

    private func setupViewHierarchy() {
        addTableView()
        initItems()
    }

    private func getWorkers() {
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            let workersProvider = WorkersProvider(parsingManager: delegate.services.parsingManager)
            workersProvider.workers { [weak self] (workers) in
                guard let workers = workers else { return }
                self?.workers = workers
            }
        }
    }

    private func initItems() {
        let startDateAddShiftCell = AddShiftCell(title: "addShiftScreenStartDate".localized, type: .startDate)
        let endDateAddShiftCell = AddShiftCell(title: "addShiftScreenEndDate".localized, type: .endDate)
        let employeeAddShiftCell = AddShiftCell(title: "addShiftScreenEmployee".localized, type: .employee)
        let roleAddShiftCell = AddShiftCell(title: "addShiftScreenRole".localized, type: .role)
        let colorAddShiftCell = AddShiftCell(title: "addShiftScreenColor".localized, type: .color)

        addShiftCells.append(startDateAddShiftCell)
        addShiftCells.append(endDateAddShiftCell)
        addShiftCells.append(employeeAddShiftCell)
        addShiftCells.append(roleAddShiftCell)
        addShiftCells.append(colorAddShiftCell)
    }

    private func addTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
        }
    }

    private func showDatePicker() {
        let customDatePickerViewController = CustomDatePickerViewController(delegate: self)
        present(customDatePickerViewController, animated: true)
    }

    private func showActionSheet(with type: AddShiftCellType) {
        let optionMenu = UIAlertController(title: nil, message: "addShiftScreenChooseOption".localized, preferredStyle: .actionSheet)

        let values: [String]

        switch type {
        case .role:
            values = RoleType.allCases.map { $0.rawValue }
        case .employee:
            guard let workers = workers else { return }
            values = workers
        case .color:
            values = ColorType.allCases.map { $0.rawValue }
        default:
            return
        }

        values.forEach {
            let selectedValue = $0
            let action = UIAlertAction(title: selectedValue, style: .default, handler:
            {
                (alert: UIAlertAction!) -> Void in

                switch type {
                case .role:
                    guard let roleType = RoleType(rawValue: selectedValue) else { return }
                    self.shiftRole = roleType
                case .employee:
                    self.shiftEmployeeName = selectedValue
                case .color:
                    guard let colorType = ColorType(rawValue: selectedValue) else { return }
                    self.shiftColor = colorType
                default:
                    return
                }
                self.setOptionValue(selectedValue)
            })
            optionMenu.addAction(action)
        }

        let cancelAction = UIAlertAction(title: "addShiftScreenCancel".localized, style: .cancel, handler: nil)
        optionMenu.addAction(cancelAction)

        present(optionMenu, animated: true, completion: nil)
    }

    private func setOptionValue(_ value: String) {
        if let selectedDatePickerCellIndexPath = selectedCellIndexPath,
            let cell = tableView.cellForRow(at: selectedDatePickerCellIndexPath) as? AddShiftTableViewCell {
            cell.setValue(value)
        }
    }
}

extension AddShiftTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addShiftCells.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let addShiftCell = addShiftCells[indexPath.row]

        let cell: AddShiftTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configure(title: addShiftCell.title, delegate: self)
        cell.selectionStyle = .none

        return cell
    }
}

extension AddShiftTableViewController: AddShiftsTableViewCellDelegate {
    func optionButtonPressed(in cell: AddShiftTableViewCell) {
        selectedCellIndexPath = tableView.indexPath(for: cell)
        guard let selectedindexPath = selectedCellIndexPath else { return }
        let type = addShiftCells[selectedindexPath.row].type
        if type == .startDate || type == .endDate {
            showDatePicker()
        } else {
            showActionSheet(with: type)
        }
    }
}

extension AddShiftTableViewController: CustomDatePickerViewControllerDelegate {
    func selected(_ date: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        let dateString = dateFormatter.string(from: date)

        guard let selectedindexPath = selectedCellIndexPath else { return }
        let type = addShiftCells[selectedindexPath.row].type
        if type == .startDate {
            shiftStartDate = date
        } else {
            shiftEndDate = date
        }

        setOptionValue(dateString)
    }
}
