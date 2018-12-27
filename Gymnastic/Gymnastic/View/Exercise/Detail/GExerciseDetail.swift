//
//  GExerciseDetail.swift
//  Gymnastic
//
//  Created by Squall on 8/27/18.
//  Copyright © 2018 Gymnastic. All rights reserved.
//

import UIKit
import youtube_ios_player_helper
class GExerciseDetail: GBaseView {

    @IBOutlet weak var youtubeView: YTPlayerView!
    @IBOutlet weak var labelExerciseName: UILabel!
    
    var youtubeID:String = ""
    var name:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.youtubeView.load(withVideoId: youtubeID)
        self.labelExerciseName.text = name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
