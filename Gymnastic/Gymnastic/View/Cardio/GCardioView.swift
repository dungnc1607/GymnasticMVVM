//
//  GCardioView.swift
//  Gymnastic
//
//  Created by Tran Manh Quy on 8/22/18.
//  Copyright © 2018 Gymnastic. All rights reserved.
//

import UIKit
import youtube_ios_player_helper
class GCardioView: GBaseView {

    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.registerCellNib(GCardioCell.self)
        tableview.delegate = self
        tableview.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension GCardioView:UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:GCardioCell = tableview.dequeueReusableCell(withIdentifier: GCardioCell.typeName, for: indexPath) as! GCardioCell
        cell.labelNumber.text = String(indexPath.row + 1)
        cell.labelName.text = CARDIO_NAME[indexPath.row]
        cell.onClickCell = {
            self.vmNavigation?.openCardio(indexPath.row)
            print("a: ", indexPath.row)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
