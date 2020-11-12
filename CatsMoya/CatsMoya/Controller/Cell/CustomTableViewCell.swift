//
//  CustomTableViewCell.swift
//  CatsMoya
//
//  Created by Jordi Milla on 10/11/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var labelId: UILabel!
    @IBOutlet weak var labelText: UILabel!
    
    var data: Cats?
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configure(cats:Cats?){
        
        self.data = cats
        labelId.text = self.data?._id
        labelText.text = self.data?.text
    }
}
