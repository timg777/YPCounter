//
//  ViewController.swift
//  YPCounter
//
//  Created by Superior Warden on 12.01.2025.
//

import UIKit





class ViewController: UIViewController {
    
    
    @IBOutlet weak var historyTextView: UITextView!
    
    @IBOutlet weak var counterLabel: UILabel!
    @CounterRule private var currentCounterAction
    
    @IBOutlet weak var counterPlusButton: UIButton!
    @IBOutlet weak var counterMinusButton: UIButton!
    @IBOutlet weak var counterResetButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}




// MARK: - Buttons handlers
private extension ViewController {
    
    @IBAction func counterResetButtonDidTapped() {
        self.currentCounterAction.option = .clear
        self.counterValueChangedHandler()
    }

    @IBAction func counterPlusButtonDidTapped() {
        self.currentCounterAction.option = .add
        self.counterValueChangedHandler()
    }

    @IBAction func counterMinusButtonDidTapped() {
        self.currentCounterAction.option = .subtract
        self.counterValueChangedHandler()
    }
    
}




// MARK: - Other handlers
private extension ViewController {
    
    private func updateHistorLog() {
        UIView.animate(withDuration: 0.5) {
            if self.historyTextView.text != "История изменений" {
                self.historyTextView.text?.append( "\n\(self.currentCounterAction.option.logText)" )
            } else {
                self.historyTextView.text = self.currentCounterAction.option.logText
            }
            
            // MARK: - moving history log down when content overflows
            let range = NSRange(location: self.historyTextView.text.count - 1, length: 1)
            self.historyTextView.scrollRangeToVisible(range)
        }
    }
    
    func counterValueChangedHandler() {
        self.updateHistorLog()
        self.counterLabel.text = "\( self.currentCounterAction.value )"
    }
}
