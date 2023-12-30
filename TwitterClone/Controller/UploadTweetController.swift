//
//  UploadTweetController.swift
//  TwitterClone
//
//  Created by chirag arora on 29/10/23.
//

import UIKit


class UploadTweetController: UIViewController {
    
    // MARK: - Properties
    
    private let user: User
    private let config: UplaodTweetConfiguration
    private lazy var viewmodel = UploadTweetViewModel(config: config)
    
    private lazy var actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .TwitterBlue
        button.setTitle("Tweet", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal)
        
        button.frame = CGRect(x: 0, y: 0, width: 64, height: 32)
        button.layer.cornerRadius = 32 / 2
        
        button.addTarget(self, action: #selector(handleUploadTweet), for: .touchUpInside)
        
        return button
        
    }()
    
    private let profileImageView: UIImageView = {
        
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.setDimensions(width: 48, height: 48)
        iv.layer.cornerRadius = 48/2
        iv.backgroundColor = .systemPink
        return iv
    }()
    
    private lazy var replyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        label.text = "Replying to @Walter"
        label.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        return label
    }()
    
    private let captionTextView = CaptionTextView()
    
    
    // MARK: - Lifecycle
    
    init (user: User, config: UplaodTweetConfiguration) {
        self.user = user
        self.config = config
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        switch config {
        case .tweet:
            print("DEBUG: Config is Tweet")
        case .reply(let tweet):
            print("DEBUG: Replying to \(tweet.caption)")
        }
        
        
    }
    
    // MARK: - Selectors
    
    @objc func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func handleUploadTweet() {
        guard let caption = captionTextView.text else { return }
        TweetService.shared.uploadTweet(caption: caption) { (error, ref) in
            if let error = error {
                print("DEBUG: Failed to upload tweet with error \(error.localizedDescription)")
                return
            }
            
            self.dismiss(animated: true, completion: nil )
        }
    }
    
    // MARK: - API
    
    // MARK: - Helpers
    
    func configureUI() {
        navigationController?.view.backgroundColor = .white
        configureNavigationBar()
        
        let imageCaptionStack = UIStackView(arrangedSubviews: [profileImageView, captionTextView])
        imageCaptionStack.axis = .horizontal
        imageCaptionStack.spacing = 12
        imageCaptionStack.alignment = .leading
        
        let stack = UIStackView(arrangedSubviews: [replyLabel, imageCaptionStack])
        stack.axis = .vertical
//        stack.alignment = .leading
        stack.spacing = 12
        
        
        view.addSubview(stack)
        stack.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 16, paddingleft: 16, paddingRight: 16)
        
        profileImageView.sd_setImage(with: user.ProfileImageUrl, completed: nil)
        
        actionButton.setTitle(viewmodel.actionButtonTitle, for: .normal)
        captionTextView.placeholderLabel.text = viewmodel.placeholderText
        
        replyLabel.isHidden = !viewmodel.shouldShowReplyLabel
        guard let replyText = viewmodel.replyText else {return}
        replyLabel.text = replyText
                
    }
    
    
    
    func configureNavigationBar() {
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.isTranslucent = false
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: actionButton)
    }
    
    
    
}


