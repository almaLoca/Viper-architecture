
import Foundation
import UIKit

protocol ListViewProtocol: class {
    // PRESENTER -> VIEW
    func listPresenterApiResponse(List: [AnyObject],serviceString:String)
    
}

protocol ListPresenterProtocol: class {
    //View -> Presenter
    var interactor: ListInputInteractorProtocol? {get set}
    var view: ListViewProtocol? {get set}
    var wireframe: ListWireFrameProtocol? {get set}
    func loadList(view:UIViewController)
    func updateList(view:UIViewController,updateString:String)
    func viewDidLoad()
    func showListSelection(with ListModel: ListModel, from view: UIViewController)
}

protocol ListInputInteractorProtocol: class {
    var presenter: ListOutputInteractorProtocol? {get set}
    //Presenter -> Interactor
    func getList(view:UIViewController)
    func updateList(view:UIViewController,memberInfoString:String)
}
protocol ListOutputInteractorProtocol: class {
    //Interactor -> Presenter
    
    func listApiResponse(ListModel: [ListModel],serviceString:String)
}

protocol ListWireFrameProtocol: class {
    //Presenter -> Wireframe
    func pushToListDetail(with StrictPPModel: ListModel,from view: UIViewController)
    static func createListModule(ListRef: ListViewController)
    
}
