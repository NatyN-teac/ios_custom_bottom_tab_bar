//
//  StackViewItem.swift
//  testRecorder
//
//  Created by mac on 21/01/2022.
//

import UIKit

protocol StackViewItemDelegate {
    func handleTap(_ view: StackViewItem)
}

class StackViewItem: UIView {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var highlightView: UIView!
    
    private let hightlightBGColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
    
    static var newInstance: StackViewItem {
        return Bundle.main.loadNibNamed("StackViewItem", owner: nil, options: nil)?.first as! StackViewItem
    }
    
     var delegate: StackViewItemDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        highlightView.layer.cornerRadius = highlightView.bounds.height / 2
        self.addTapGesture()
    }
    var isSelected: Bool = false {
        willSet {
            self.updateUI(isSelected: newValue)
        }
    }
    var item: Any? {
        didSet {
            self.configure(self.item)
        }
    }
    private func configure(_ item: Any?) {
        guard let model = item as? ButtonStackItem else { return }
        self.titleLabel.text = model.title
        self.imageView.image = UIImage(named: model.image)
        self.isSelected = model.isSelected
    }
    
    private func updateUI(isSelected: Bool) {
        guard let model = item as? ButtonStackItem else { return }
        model.isSelected = isSelected
        let options: UIView.AnimationOptions = isSelected ? [.curveEaseIn] : [.curveEaseOut]
        if isSelected {
            self.titleLabel.textColor = .white
        }
        UIView.animate(withDuration: 0.4, delay: 0.0,
                       options: options,
                       animations: {
                        self.titleLabel.text = isSelected ? model.title : ""
                        let color  = isSelected ? self.hightlightBGColor : .white
                        self.highlightView.backgroundColor = color
                        (self.superview as? UIStackView)?.layoutIfNeeded()
                        
                       }, completion: nil)
    }
    
}
extension StackViewItem {
    func addTapGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleGesture(_:)))
        self.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleGesture(_ sender: UITapGestureRecognizer) {
        self.delegate?.handleTap(self)
    }
}
