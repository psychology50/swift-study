//
//  ViewController.swift
//  uikit-test
//
//  Created by 양재서 on 2023/08/27.
//

import UIKit

class ViewController: UIViewController {
    
    let myButton: UIButton = {
        let button = UIButton()
        button.setTitle("스톱 워치", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ViewController가 로드되고 메모리에 로딩된 후 호출된다.
        print("firstViewDidLoad")
        
        // UI에 button 추가
        view.addSubview(myButton)
        
        // Auto Layout 제약 조건 설정
        myButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            myButton.widthAnchor.constraint(equalToConstant: 200),
            myButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // ViewController가 화면에 나타나기 직전에 호출된다.
        print("firstViewWillAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // ViewController가 화면에서 사라지기 직전에 호출된다.
        print("firstViewWillDisappear")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        // ViewController의 하위 뷰들이 레이아웃을 업데이트한 후 호출된다.
        print("fisrtViewDidLayoutSubviews")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // 메모리 부족 시 호출된다.
        print("firstDidReceiveMemoryWarning")
    }
    
    @objc func buttonTapped() {
        // 버튼을 눌렀을 때 다른 뷰로 이동하는 코드
        //let secondVC = SecondViewController()
        print("[INFO] pushViewController")
        guard let uvc =
                self.storyboard?.instantiateViewController(withIdentifier: "StopWatch")
        else {
            return
        }
        
//        let stopWatchVC = StopWatchVC()
        self.navigationController?.pushViewController(uvc, animated: true)
    }
}

