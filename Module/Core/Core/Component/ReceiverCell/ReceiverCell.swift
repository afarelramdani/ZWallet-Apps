//
//  ReceiverCell.swift
//  Core
//
//  Created by MacBook on 28/05/21.
//

import UIKit

public class ReceiverCell: UITableViewCell {

    @IBOutlet var receiverImage: UIImageView!
    @IBOutlet var receiverNameLabel: UILabel!
    @IBOutlet var receiverPhoneNumberLabel: UILabel!
    @IBOutlet var receiverView: UIView!
    
    public var delegate: ReceiverCellDelegate?
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        
        receiverView.setShadow(color: UIColor.black.cgColor, opacity: 0.1)
    }

    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    public func showDataReceiver (receiver: ReceiverEntity) {
        self.receiverNameLabel.text = receiver.name
        self.receiverPhoneNumberLabel.text = receiver.phone
        
        
        let url = URL(string: receiver.image)
        self.receiverImage.kf.setImage(with: url)
        
    }
    
}
