//
//  ProductCell.swift
//  listScene customCell
//
//  Created by Tacademy-Mac on 2017. 1. 5..
//  Copyright © 2017년 Tacademy-Mac. All rights reserved.
//

import UIKit

protocol ProductCellDelegate : class {
    func addCart(code : String)
}

class ProductCell: UITableViewCell {
    weak var delegate: ProductCellDelegate!
    var productCode : String!

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBAction func touchAddBtn(_ sender: Any) {
        delegate.addCart(code: productCode)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
