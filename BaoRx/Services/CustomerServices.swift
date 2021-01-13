//
//  CustomerServices.swift
//  BaoRx
//
//  Created by DC4 on 13/01/2021.
//

import Foundation
import RxSwift

class CustomerServices{
    func fetchCustomer() -> Observable<[customerTestStruct]>{
        return Observable.create{observer -> Disposable in
            guard let path = Bundle.main.path(forResource: "customerTest", ofType: "json") else {
                observer.onError(NSError(domain: "", code: -1, userInfo: nil))
                return Disposables.create{ }
            }
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let customers = try JSONDecoder().decode([customerTestStruct].self, from: data)
                observer.onNext(customers)
            }catch{
                observer.onError(error)
            }
            return Disposables.create { }
        }
    }
}
