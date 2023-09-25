//
//  StopWatch.swift
//  uikit-test
//
//  Created by 양재서 on 2023/09/18.
//

import UIKit

class StopWatchVC: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    @IBOutlet weak var resetBtn: UIButton!
    
    var counter: Float = 0.0 {
        didSet {
            timeLabel?.text = String(format: "%.1f", counter)
        }
    }
    var timer: Timer? = Timer()
    var isPlaying = false

    override func viewDidLoad() {
        super.viewDidLoad()
        counter = 0.0
        
        print("[INFO] StopWatch Controller access")
        
//        playBtn.addTarget(self, action: #selector(playBtnClicked), for: .touchUpInside)
//        pauseBtn.addTarget(self, action: #selector(pauseBtnClicked), for: .touchUpInside)
//        resetBtn.addTarget(self, action: #selector(resetBtnClicked), for: .touchUpInside)
    }
    
    @IBAction func playBtnClicked(_sender: UIButton) {
        print("[INFO] playBtnClicked")
        playBtn.isEnabled = false
        pauseBtn.isEnabled = true
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target:self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
        isPlaying = true
    }
    
    @IBAction func pauseBtnClicked(_sender: UIButton) {
        print("[INFO] pauseBtnClicked")
        stopTimer()
        playBtn.isEnabled = true
        pauseBtn.isEnabled = false
        
        timer = nil
        isPlaying = false
    }
    
    @IBAction func resetBtnClicked(_sender: UIButton) {
        print("[INFO] resetBtnClicked")
        stopTimer()
        timer = nil
        isPlaying = false
        counter = 0.0
        playBtn.isEnabled = true
        pauseBtn.isEnabled = true
    }
    
    @objc func updateTimer() {
        counter = counter + 0.1
        print(counter)
    }
    
    private func stopTimer() {
        if let timerTemp = timer {
            timerTemp.invalidate()
        }
    }
}
