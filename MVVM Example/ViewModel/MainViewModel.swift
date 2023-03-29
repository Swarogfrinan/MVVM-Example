import Foundation

protocol MainViewModelProtocol {
    var updateViewData:((ViewData)->())? {get set}
    func startFetch()
}

final class MainViewModel : MainViewModelProtocol {
    
   public var updateViewData: ((ViewData) -> ())?
    
    init() {
        updateViewData?(.initial)
    }
    
    public func startFetch() {
        updateViewData?(.loading(Data(icon: nil, title: nil, description: nil, numberPhone: nil)))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.updateViewData?(.succes(Data(icon: "succes", title: "Succes", description: "Succes", numberPhone: nil)))

        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.updateViewData?(.failure(Data(icon: "failure", title: "Failure", description: "Failure", numberPhone: nil)))

        }
    }
    
    
    
}
