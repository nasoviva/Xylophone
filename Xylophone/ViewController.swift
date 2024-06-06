//
//  ViewController.swift
//  Xylophone
//
//  Created by Victoria on 05/06/2024.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func buttonPressed(_ sender: UIButton) {
        playSound(sender: sender.titleLabel?.text ?? "C")
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1.0
        }

    }

    func playSound(sender: String) {
        guard let path = Bundle.main.path(forResource: sender, ofType: "wav") else {
            return
        }

        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
}

