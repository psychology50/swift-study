//
//  ViewController.swift
//  uikit-test
//
//  Created by 양재서 on 2023/08/27.
//

import UIKit

class ViewController: UIViewController {
    let stopWatchButton: UIButton = {
        let button = UIButton()
        button.setTitle("스톱 워치", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    let searchBarBtn: UIButton = {
        let button = UIButton()
        button.setTitle("검색바", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(searchBarBtnTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ViewController가 로드되고 메모리에 로딩된 후 호출된다.
        print("firstViewDidLoad")
        
        // UI에 button 추가
        view.addSubview(stopWatchButton)
        view.addSubview(searchBarBtn)
        
        // Auto Layout 제약 조건 설정
        stopWatchButton.translatesAutoresizingMaskIntoConstraints = false
        searchBarBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stopWatchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopWatchButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stopWatchButton.widthAnchor.constraint(equalToConstant: 200),
            stopWatchButton.heightAnchor.constraint(equalToConstant: 50),
            
            searchBarBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchBarBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            searchBarBtn.widthAnchor.constraint(equalToConstant: 200),
            searchBarBtn.heightAnchor.constraint(equalToConstant: 50)
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
        
//        print(vcName.storyboard)
        guard let uvc =
                self.storyboard?.instantiateViewController(withIdentifier: "StopWatchVC")
        else {
            return
        }
        
//        let stopWatchVC = StopWatchVC()
       //self.navigationController?.pushViewController(uvc, animated: true)
        uvc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        self.present(uvc, animated: true)
    }
    
    @objc func searchBarBtnTapped() {
        print("[INFO] searchBarBtnTapped")
        
        let uvc = SearchBarVC()
        
        uvc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        self.present(uvc, animated: true)
    }
}

