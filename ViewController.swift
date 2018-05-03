//
//  ViewController.swift
//  AppEjercicio16
//
//  Created by ISSC411 on 12/04/18.
//  Copyright © 2018 GLL. All rights reserved.
//

import Cocoa
class ViewController: NSViewController {

    @IBOutlet weak var tableView: NSTableView!
    
    @IBOutlet weak var btnEditar: NSButton!
    var lista = [Datos]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        let d = Datos()
        d.Titulo = "HOLA"
        d.Description = "Un saludo pa toda la razita de culiacan que la sigue cotorriando"
        d.Detalle = "Fierro viejon"
        d.Imagen = "NSUser"
        lista=lista.insertar(dato: d)
        tableView.reloadData()
        // Do any additional setup after loading the view.
    }
    @IBAction func onRowChanged(_ sender: Any)
    {
        if(tableView.selectedRow>=0)
        {
            btnEditar.isEnabled=true
        }
        else
        {
            btnEditar.isEnabled = false
        }
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    @IBAction func onEliminar(_ sender: NSButton)
    {
        let padre = sender.accessibilityParent() as! NSCell
        let index = padre.accessibilityIndex()
        lista.remove(at: index)
        
    }
    func actualizar(losDatosTabla datos: Datos)
    {
        lista.append(datos)
        tableView.reloadData()
    }
    
    override func prepare(for segue: NSStoryboardSegue,sender: Any?)
    {
        if segue.identifier!.rawValue == "agregar"
        {
            let vc = segue.destinationController as! AgregarAlumnoViewController
            vc.viewController = self
        }
        else if (segue.identifier!.rawValue == "editar" &&  tableView.selectedRow >= 0)
        {
            var d = Datos()
            d = lista[tableView.selectedRow]
            do{
                
            }catch{
                print("error")
            }
            let vc = segue.destinationController as! AgregarAlumnoViewController
            vc.viewController = self
            vc.esModificar = true
            vc.datos = d
        }
    }

}
extension ViewController:NSTableViewDataSource,NSTableViewDelegate
{
    func numberOfRows(in tableView: NSTableView) -> Int {
        return lista.count
    }
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let result:CustomCell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue:"defaultRow"), owner: self)
            as! CustomCell
        let d: Datos? = lista[row]
        result.Imagen.image = NSImage(named:NSImage.Name(rawValue:(d!.Imagen)))
        result.Description.stringValue = (d!.Description)
        result.Detalle.stringValue = (d!.Detalle)
        result.Titulo.stringValue = (d!.Titulo)
        result.indice = d!.id
        result.viewController = self
        result.Description.sizeToFit()
        result.Detalle.sizeToFit()
        result.Titulo.sizeToFit()
        
        return result
    }

}

extension Array
{
    func insertar(dato:Datos)->[Datos]
    {
        var aux = self as! [Datos]
        aux.append(dato)
        aux[aux.count-1].id = aux.count-1
        return aux
    }
    
    func eliminar(indice:Int)->[Datos]
    {
        var aux = self as! [Datos]
        aux.remove(at: indice)
        for i in 0...aux.count
        {
            aux[i].id = i
        }
        return aux
    }
}



























