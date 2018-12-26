//
//  SearchResultCell.swift
//  Swift_SearchVC_Test
//
//  Created by shenyinghao on 2018/12/25.
//  Copyright © 2018年 shenyinghao. All rights reserved.
//

import UIKit

class SearchResultCell: UITableViewCell {

    let left = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 30))
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(left)
        setupContentView(textTemp: "默认")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupContentView(textTemp : NSString) {
        left.text = textTemp as String
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
