//
//  UITableView+.swift
//  TableViewController
//
//  Created by HoSiTuan on 04/05/2022.
//


import Foundation
import UIKit

public extension UITableView {
    func regisCells(cellIdentifiers: [String]) {
        for identifier in cellIdentifiers {
            self.register(UINib(nibName: identifier, bundle: Bundle.main), forCellReuseIdentifier: identifier)
        }
    }
    
    func registerCells(_ cellIdentifiers: AnyClass...) {
        for classIdentifier in cellIdentifiers {
            self.register(classIdentifier, forCellReuseIdentifier: String(describing: classIdentifier))
        }
    }
    
    // For generic table view cells
    func regisCell<Cell: UITableViewCell>(_ cellClass: Cell.Type) {
        register(cellClass, forCellReuseIdentifier: (Cell.className))
    }
    
    func dequeueReusableCell<Cell: UITableViewCell>(forIndexPath indexPath: IndexPath) -> Cell {
        guard let cell = self.dequeueReusableCell(withIdentifier: Cell.className) as? Cell else {
            fatalError("Error for cell if: \(Cell.className) at \(indexPath)")
        }
        return cell
    }
    
    // For reloading data without scroll animation
    func reloadWithoutScroll(section: Int? = nil) {
        UIView.performWithoutAnimation {
            if let section = section {
                self.reloadSections(IndexSet(integer: section), with: .automatic)
            }
            else {
                self.reloadData()
            }
        }
    }
    
    func reloadData(completion: @escaping ()->()) {
        UIView.animate(withDuration: 0, animations: { self.reloadData() }) { _ in
            completion()
        }
    }
    
    func setGradientBackgroundTableView(colors: [UIColor: CGFloat]) {
        var cgColors = [CGColor]()
        var location = [NSNumber]()
        for color in colors {
            cgColors.append(color.key.cgColor)
            location.append(NSNumber(value: Float(color.value)))
        }
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = cgColors
        gradientLayer.locations = location
        gradientLayer.frame = UIScreen.main.bounds
        let backgroundView = UIView()
        backgroundView.layer.insertSublayer(gradientLayer, at: 0)
        self.backgroundColor = .clear
        self.backgroundView = backgroundView
    }
    
    func scrollToBottom(section: Int = 0) {
        let rowCount = self.numberOfRows(inSection: section)
        if rowCount > 1 {
            if Thread.isMainThread {
                self.scrollToRow(at: IndexPath(row: rowCount - 1, section: section), at: .bottom, animated: true)
            } else {
                DispatchQueue.main.async {
                    self.scrollToRow(at: IndexPath(row: rowCount - 1, section: section), at: .bottom, animated: true)
                }
            }
        }
    }
}
