//
//  DetailVC.swift
//  uikit-test
//
//  Created by 양재서 on 2023/10/02.
//

import UIKit

class DetailVC : UIViewController {
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    
    var detailItem: Item? {
        didSet {
            initView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    private func initView() {
        if let detailItem = detailItem {
            if let detailDescriptionLabel = detailDescriptionLabel, let itemImageView = itemImageView {
                detailDescriptionLabel.text = detailItem.name
                itemImageView.image = UIImage(named: detailItem.name)
                title = detailItem.category
            }
        }
    }
}
