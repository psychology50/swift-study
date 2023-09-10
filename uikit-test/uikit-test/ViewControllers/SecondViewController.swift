//
//  SecondViewController.swift
//  uikit-test
//
//  Created by 양재서 on 2023/09/11.
//

import UIKit

class SecondViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ViewController가 로드되고 메모리에 로딩된 후 호출된다.
        print("secondViewDidLoad")
        
        let backBtn = UIBarButtonItem(title: "뒤로가기", style: .plain, target: self, action: #selector(backBtn))
        navigationItem.leftBarButtonItem = backBtn
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // ViewController가 화면에 나타나기 직전에 호출된다.
        print("secondViewWillAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // ViewController가 화면에서 사라지기 직전에 호출된다.
        print("secondViewWillDisappear")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        // ViewController의 하위 뷰들이 레이아웃을 업데이트한 후 호출된다.
        print("secondViewDidLayoutSubviews")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // 메모리 부족 시 호출된다.
        print("secondDidReceiveMemoryWarning")
    }

    @objc func backBtn() {
        navigationController?.popViewController(animated: true)
    }
}
