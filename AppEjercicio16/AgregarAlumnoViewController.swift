//
//  AgregarAlumnoViewController.swift
//  AppEjercicio16
//
//  Created by ISSC411 on 13/04/18.
//  Copyright © 2018 GLL. All rights reserved.
//

import Cocoa

class AgregarAlumnoViewController: NSViewController {

   
    @IBOutlet weak var txtNombre: NSTextField!
    @IBOutlet weak var txtDescripcion: NSTextField!
    @IBOutlet weak var txtDetalle: NSTextField!
    @IBOutlet weak var cmbImagen: NSPopUpButton!
    
    public var viewController:ViewController = ViewController()
    public var datos:Datos = Datos()
    public var esModificar:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if esModificar
        {
            txtNombre.stringValue = datos.Titulo
            txtDescripcion.stringValue = datos.Description
            txtDetalle.stringValue = datos.Detalle
            cmbImagen.setTitle(datos.Imagen)
        }
        // Drawing code here.
    }
    
    @IBAction func onAgregar(_ sender: Any)
    {
        let dato = Datos()
        dato.Titulo = txtNombre.stringValue
        dato.Description = txtDescripcion.stringValue
        dato.Detalle = txtDetalle.stringValue
        dato.Imagen = cmbImagen.titleOfSelectedItem!
        
        if esModificar
        {
            viewController.lista[viewController.tableView.selectedRow] = dato
            
        }
        else
        {
            viewController.lista.append(dato)
            viewController.lista.last!.id = viewController.lista.count-1;
        }
        viewController.tableView.reloadData()
        dismissViewController(self)
    }
    
    @IBAction func onCancelar(_ sender: Any)
    {
        dismissViewController(self)
    }
}
