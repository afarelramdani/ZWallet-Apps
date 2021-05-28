//
//  HeaderComponent.swift
//  Core
//
//  Created by MacBook on 25/05/21.
//

import UIKit

class HeaderView: UIView {
    
    @IBOutlet var headerView: UIView!
    @IBOutlet var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("HeaderView", owner: self, options: nil)
        
        addSubview(headerView)
        headerView.frame = self.bounds
        headerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}
