//
//  DetailsViewController.swift
//  MVVMProject
//
//  Created by Pavel Burdukovskii on 18/01/18.
//  Copyright © 2018 Pavel Burdukovskii. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var precipitationLabel: UILabel!
    weak var viewModel: DetailsViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.weatherLabel.text = viewModel.temperatureString
        self.windLabel.text = viewModel.windString
        self.cityLabel.text = viewModel.cityTitle
        self.precipitationLabel.text = viewModel.precipitationString
        // Do any additional setup after loading the view.
    }
    @IBAction func clickedButtob(){
        self.dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
