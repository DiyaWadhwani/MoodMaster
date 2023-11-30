//
//  OptionView.swift
//  finalproject
//
//  Created by Ohida Binte Amin on 11/19/23.

import UIKit

class UserHomeView: UIView {
    
    var homeButton: UIButton!
    var profileButton: UIButton!
    var aboutButton: UIButton!

    var centerImageView: UIImageView!
    var readSomethingButton: UIButton!
    var journalButton: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = AppAccentColor.background

        setupHomeButton()
        setupProfileButton()
        setupAboutButton()
        setupReadSomethingButton()
        setupJournalButton()

        initConstraints()
        
        aboutButton.isUserInteractionEnabled = true

    }

    func setupHomeButton() {
        
        homeButton = UIButton(type: .system)
        homeButton.setImage(UIImage(systemName: "house"), for: .normal)
        homeButton.tintColor = .black
        homeButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(homeButton)
        
    }

    func setupProfileButton() {
        
        profileButton = UIButton(type: .system)
        profileButton.setImage(UIImage(systemName: "person"), for: .normal)
        profileButton.tintColor = .black
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(profileButton)
        
    }

    func setupAboutButton() {
        
        aboutButton = UIButton(type: .system)
        aboutButton.setImage(UIImage(systemName: "info.circle"), for: .normal)
        aboutButton.tintColor = .black
        aboutButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(aboutButton)
        
    }

    func setupReadSomethingButton() {
        readSomethingButton = UIButton(type: .system)
        readSomethingButton.setTitle("Read Something", for: .normal)
        readSomethingButton.setTitleColor(.white, for: .normal)
        readSomethingButton.backgroundColor = .systemBlue
        readSomethingButton.layer.cornerRadius = 15
        readSomethingButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(readSomethingButton)
    }

    func setupJournalButton() {
        
        journalButton = UIButton(type: .system)
        journalButton.setTitle("Journal", for: .normal)
        journalButton.setTitleColor(.white, for: .normal)
        journalButton.backgroundColor = .systemBlue
        journalButton.layer.cornerRadius = 15
        journalButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(journalButton)
        
    }

    func initConstraints() {
        self.backgroundColor = UIColor(red: 135/255, green: 206/255, blue: 250/255, alpha: 1.0)

        NSLayoutConstraint.activate([
            
            homeButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            homeButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 30),

            profileButton.topAnchor.constraint(equalTo: homeButton.topAnchor),
            profileButton.leadingAnchor.constraint(equalTo: homeButton.trailingAnchor, constant: 16),
            
            aboutButton.topAnchor.constraint(equalTo: homeButton.topAnchor),
            aboutButton.leadingAnchor.constraint(equalTo: profileButton.trailingAnchor, constant: 16),

            readSomethingButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 60),
            readSomethingButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 100),
            readSomethingButton.widthAnchor.constraint(equalToConstant: 250),

            journalButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 60),
            journalButton.topAnchor.constraint(equalTo: readSomethingButton.bottomAnchor, constant: 100),
            journalButton.widthAnchor.constraint(equalToConstant: 250),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
