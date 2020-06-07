

import Foundation
import UIKit

class ListRouter:ListWireFrameProtocol{
    
    func pushToListDetail(with ListModel: ListModel,from view: UIViewController) {
        
        
    }
    
    class func createListModule(ListRef: ListViewController) {
        
        let presenter: ListPresenterProtocol & ListOutputInteractorProtocol = ListPresenter() as ListOutputInteractorProtocol & ListPresenterProtocol
        
        ListRef.presenter = presenter
        ListRef.presenter?.wireframe = ListRouter()
        ListRef.presenter?.view = ListRef
        ListRef.presenter?.interactor = ListInteractor()
        ListRef.presenter?.interactor?.presenter = presenter
    }
    
}
