
import Foundation
import UIKit

class ListPresenter:ListPresenterProtocol {
    
    
    var wireframe: ListWireFrameProtocol?
    var view: ListViewProtocol?
    var interactor: ListInputInteractorProtocol?
    var presenter: ListPresenterProtocol?
 
    
    func showListSelection(with ListModel: ListModel, from view: UIViewController) {
        wireframe?.pushToListDetail(with: ListModel, from: view)
    }
    
    func viewDidLoad() {
        //self.loadStrictPPList()
    }
    
    func loadList(view:UIViewController) {
        interactor?.getList(view:view)
    }
    func updateList(view:UIViewController,updateString:String) {
        interactor?.updateList(view: view, memberInfoString: updateString)
    }
}

extension ListPresenter: ListOutputInteractorProtocol {
    func listApiResponse(ListModel: [ListModel],serviceString:String) {
        view?.listPresenterApiResponse(List: ListModel,serviceString: serviceString)
        
    }
}
