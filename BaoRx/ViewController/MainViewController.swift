//
//  MainViewController.swift
//  BaoRx
//
//  Created by DC4 on 13/01/2021.
//

import UIKit
import RxSwift
class MainViewController: UIViewController {
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        let service = CustomerServices()
        service.fetchCustomer().subscribe(onNext: {customers in print(customers)}).disposed(by: disposeBag)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
