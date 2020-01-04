import UIKit

protocol CustomDatePickerDelegate: class {
    func selected(_ date: Date)
}

class CustomDatePicker: NibView {
    // MARK: - properties
    
    @IBOutlet private weak var dateOfBirthLabel: UILabel!
    @IBOutlet private var cancelButton: UIButton!
    @IBOutlet private weak var doneButton: UIButton!
    @IBOutlet private weak var datePicker: UIDatePicker!
    private weak var delegate: CustomDatePickerDelegate!
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupContent()
        setupBehaviour()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - override
    
    override func layoutSubviews() {
        super.layoutSubviews()
        roundCorners(corners: [.topLeft, .topRight], radius: 10.0)
    }
    
    // MARK: - public
    
    static func instantiate(delegate: CustomDatePickerDelegate) -> CustomDatePicker {
        let customDatePicker = CustomDatePicker()
        customDatePicker.delegate = delegate
        return customDatePicker
    }
    
    func setCurrentDateAsMin() {
        datePicker.setCurrentDateAsMin()
    }
    
    // MARK: - private

    private func setupBehaviour() {
        setCurrentDateAsMin()
    }
    
    private func setupContent() {
        doneButton.setTitle("customDatePickerDone".localized, for: .normal)
        cancelButton.setTitle("customDatePickerCancel".localized, for: .normal)
    }

    private func hide() {
        UIView.animate(withDuration: 0.5, animations: {
            self.alpha = 0
        }) { _ in
            self.removeFromSuperview()
        }
    }
    
    // MARK: - actions
    
    @IBAction private func doneButtonPressed() {
        delegate.selected(datePicker.date)
        hide()
    }

    @IBAction private func cancelButtonPressed() {
        hide()
    }
}
