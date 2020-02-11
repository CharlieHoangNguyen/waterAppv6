//
//  SideMenuTableController.swift
//  waterAppV6
//
//  Created by Charlie on 2/8/20.
//  Copyright © 2020 Charlie Nguyen. All rights reserved.
//

import UIKit

class SideMenuTableController: UITableViewController {
    
    let viewControllerList: [String] = ["ToHome", "ToHistory", "ToSettings", "ToAccount", "ToAbout"]

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
        
        self.performSegue(withIdentifier: viewControllerList[indexPath.row], sender: nil)
    }
}
