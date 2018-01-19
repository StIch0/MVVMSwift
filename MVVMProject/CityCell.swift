//
//  CityCell.swift
//  MVVMProject
//
//  Created by Pavel Burdukovskii on 18/01/18.
//  Copyright © 2018 Pavel Burdukovskii. All rights reserved.
//

import UIKit

class CityCell: UITableViewCell {

    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var temperatureLbl: UILabel!
    weak var viewModel: CityCellViewModel! {
        didSet {
            self.timeLbl.text = viewModel.timeString
            self.cityLbl.text = viewModel.cityTitle
            self.temperatureLbl.text = viewModel.temperatureString
            print(viewModel.timeString,viewModel.cityTitle,viewModel.temperatureString)

        }
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
