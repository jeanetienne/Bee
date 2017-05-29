//
//  CollapsiblePicker.swift
//  Bee
//
//  Created by Jean-Étienne on 26/5/17.
//  Copyright © 2017 Jean-Étienne. All rights reserved.
//

import UIKit

protocol CollapsiblePickerDelegate {
    
    func pickerDidSelectItem(withName name: String)
    
}

class CollapsiblePicker: UIView {
    
    enum Height: CGFloat {
        
        case collapsed = 26.0
        
        case expanded = 175.0
        
    }
    
    var items: [String]?
    
    var displayItems: [String]? {
        return items?.filter { itemName -> Bool in
            itemName != pickerButton.title(for: .normal)
        }
    }
    
    var delegate: CollapsiblePickerDelegate?
    
    // MARK: Outlets
    @IBOutlet weak var pickerButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var arrow: DisclosureArrow!
    
    @IBOutlet weak var bottomLine: UIView!
    
    @IBOutlet weak var topGradient: GradientView!
    
    @IBOutlet weak var bottomGradient: GradientView!
    
    // MARK: Private properties
    private var isExpanded: Bool {
        return heightConstraint.constant == Height.expanded.rawValue
    }
    
    private let animationDuration: TimeInterval = 0.2
    
    private var heightConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let view = loadFromNib()
        view.frame = self.bounds
        addSubview(view)
        
        heightConstraint = initialHeightConstraint()
        addConstraint(heightConstraint)
        
        pickerButton.setTitleColor(UIColor.faded, for: .normal)
        
        // TableView
        let cell = UINib(nibName: String(describing: CollapsiblePickerTableViewCell.self), bundle: Bundle.main)
        tableView.register(cell, forCellOfClass: CollapsiblePickerTableViewCell.self)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = Height.collapsed.rawValue
        var contentInset = tableView.contentInset
        contentInset.top = 3
        contentInset.bottom = 3
        tableView.contentInset = contentInset
        
        topGradient.alpha = 0
        bottomGradient.alpha = 0
        
        self.clipsToBounds = true
    }
    
    func selectItem(atIndex index: Int) {
        if let name = items?[index] {
            pickerButton.setTitle(name, for: .normal)
        }
    }
    
    @IBAction private func pickerDidTouchUpInside(_ sender: Any, forEvent event: UIEvent) {
        if isExpanded {
            animate(toHeight: .collapsed)
        } else {
            animate(toHeight: .expanded)
        }
    }
    
    fileprivate func selectItem(withName name: String) {
        animate(toHeight: .collapsed)
        pickerButton.setTitle(name, for: .normal)
        delegate?.pickerDidSelectItem(withName: name)
    }
    
    // MARK: - Helpers
    private func loadFromNib() -> UIView {
        let bundle = Bundle(for: CollapsiblePicker.self)
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil)[0] as! UIView
    }
    
    private func initialHeightConstraint() -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self,
                                  attribute: .height,
                                  relatedBy: .equal,
                                  toItem: nil,
                                  attribute: .notAnAttribute,
                                  multiplier: 1,
                                  constant: Height.collapsed.rawValue)
    }
    
    private func animate(toHeight height: Height) {
        pickerButton.isEnabled = false
        let angle: CGFloat = (height == .collapsed) ? 0 : .pi
        let bottomLineAlpha: CGFloat = (height == .collapsed) ? 1 : 0
        let gradientsAlpha: CGFloat = (height == .collapsed) ? 0 : 1
        
        UIView.animate(withDuration: animationDuration,
                       delay: 0,
                       options: .curveEaseInOut,
                       animations: { 
                        self.heightConstraint.constant = height.rawValue
                        self.arrow.transform = CGAffineTransform(rotationAngle: angle)
                        self.bottomLine.alpha = bottomLineAlpha
                        self.topGradient.alpha = gradientsAlpha
                        self.bottomGradient.alpha = gradientsAlpha
                        self.superview?.layoutIfNeeded()
        }) { _ in
            self.pickerButton.isEnabled = true
            if height == .expanded {
                self.tableView.flashScrollIndicators()
            } else {
                self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
            }
        }
    }
    
}

extension CollapsiblePicker: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withClass: CollapsiblePickerTableViewCell.self,
                                                 for: indexPath) as! CollapsiblePickerTableViewCell
        
        // Selection background
        cell.selectionStyle = .default
        let cellbackgroundView = UIView()
        cellbackgroundView.backgroundColor = UIColor.secondary
        cellbackgroundView.layer.cornerRadius = 2
        cellbackgroundView.clipsToBounds = true
        cell.selectedBackgroundView = cellbackgroundView
        
        if let itemName = displayItems?[indexPath.row] {
            cell.configure(withItemName: itemName)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayItems?.count ?? 0
    }
    
}

extension CollapsiblePicker: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let itemName = displayItems?[indexPath.row] {
            selectItem(withName: itemName)
        }
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.reloadData()
    }
    
}
