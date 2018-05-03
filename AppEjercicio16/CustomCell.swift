//
//  CustomCell.swift
//  AppEjercicio16
//
//  Created by ISSC411 on 12/04/18.
//  Copyright © 2018 GLL. All rights reserved.
//

import Cocoa

class CustomCell: NSTableCellView {

    @IBOutlet weak var Titulo:NSTextField!
    @IBOutlet weak var Description: NSTextField!
    @IBOutlet weak var Imagen: NSImageView!
    @IBOutlet weak var Detalle: NSTextField!
    var indice:Int = 0
    var viewController = ViewController()
    @IBAction func onBorrar(_ sender: Any)
    {
        viewController.lista.remove(at: indice)
        rearrange()
        viewController.tableView.reloadData()
        
    }
    @IBAction func onDetalle(_ sender:Any)
    {
        viewController.lista.remove(at: indice)
    }
    
    func rearrange()
    {
        if viewController.lista.count > 0{
            for i in 0 ... viewController.lista.count-1
            {
                viewController.lista[i].id = i
            }
        }
    }
   /* override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }*/
    
}
