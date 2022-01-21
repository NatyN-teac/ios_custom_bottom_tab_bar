//
//  ViewController.swift
//  testRecorder
//
//  Created by mac on 21/01/2022.
//

import UIKit

class ViewController: UIViewController {
   
    
    @IBOutlet var stackView: UIStackView!
    var currentIndex = 0
    
    lazy var  tabs: [StackViewItem] = {
        var items = [StackViewItem]()
        for _ in 0..<5 {
            items.append(StackViewItem.newInstance)
        }
        return items
    }()
    
    lazy var tabModels: [ButtonStackItem] = {
           return [
            ButtonStackItem(title: "Home", image: "search.png"),
            ButtonStackItem(title: "Search", image: "search.png"),
            ButtonStackItem(title: "Search", image: "search.png"),
            ButtonStackItem(title: "Profile", image: "search.png"),
            ButtonStackItem(title: "Settings", image: "search.png")
           ]
       }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabs()
    }
    
    func setupTabs() {
            for (index, model) in self.tabModels.enumerated() {
                let tabView = self.tabs[index]
                model.isSelected = index == 0
                tabView.item = model
                tabView.delegate = self
                self.stackView.addArrangedSubview(tabView)
            }
        }
    

   
}

extension ViewController: StackViewItemDelegate {
    func handleTap(_ view: StackViewItem) {
        self.tabs[self.currentIndex].isSelected = false
        view.isSelected = true
        self.currentIndex = self.tabs.firstIndex(where: { $0 === view }) ?? 0
        
    }
}
