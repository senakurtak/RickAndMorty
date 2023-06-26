//
//  CharacterTVC.swift
//  RickAndMortyApp
//
//  Created by Sena Kurtak on 6.03.2023.
//

import UIKit

class CharacterTVC: UITableViewCell {

    @IBOutlet weak var characterImage: UIImageView!

    @IBOutlet weak var characterName: UILabel!

    @IBOutlet weak var characterStatus: UILabel!

    @IBOutlet weak var characterGender: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
