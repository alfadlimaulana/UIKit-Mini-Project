//
//  DetailViewController.swift
//  iOS-Mini-Project
//
//  Created by Alfadli Maulana Siddik on 03/12/24.
//

import UIKit

class DetailViewController: UIViewController {
    let vm: DetailViewControllerViewModel
    
    private let scrollView = UIScrollView()
    private let ingredientsView = Ingredients()
    private let instructionsView = Instructions()
    private let youtubeLinkView = YoutubeLink()
    private let badgeView = BadgeView()
    
    private let mealImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let detailContainerView: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init(vm: DetailViewControllerViewModel) {
        self.vm = vm
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        configureView()
        setupViews()
        super.viewDidLoad()
    }
    
    private func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(mealImageView)
        scrollView.addSubview(detailContainerView)
        detailContainerView.addSubview(badgeView)
        detailContainerView.addSubview(ingredientsView)
        detailContainerView.addSubview(instructionsView)
        detailContainerView.addSubview(youtubeLinkView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        mealImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mealImageView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            mealImageView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            mealImageView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            mealImageView.widthAnchor.constraint(equalTo: view.widthAnchor),
            mealImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/3)
        ])
        
        detailContainerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailContainerView.topAnchor.constraint(equalTo: mealImageView.bottomAnchor, constant: 12),
            detailContainerView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: 12),
            detailContainerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -12),
            detailContainerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -12)
        ])
        
        badgeView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            badgeView.topAnchor.constraint(equalTo: detailContainerView.topAnchor),
            badgeView.leadingAnchor.constraint(equalTo: detailContainerView.leadingAnchor),
            badgeView.trailingAnchor.constraint(lessThanOrEqualTo: detailContainerView.trailingAnchor)
        ])

        ingredientsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ingredientsView.topAnchor.constraint(equalTo: badgeView.bottomAnchor, constant: 16),
            ingredientsView.leadingAnchor.constraint(equalTo: detailContainerView.leadingAnchor),
            ingredientsView.trailingAnchor.constraint(equalTo: detailContainerView.trailingAnchor)
        ])
        
        instructionsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            instructionsView.topAnchor.constraint(equalTo: ingredientsView.bottomAnchor, constant: 24),
            instructionsView.leadingAnchor.constraint(equalTo: detailContainerView.leadingAnchor),
            instructionsView.trailingAnchor.constraint(equalTo: detailContainerView.trailingAnchor)
        ])
        
        youtubeLinkView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            youtubeLinkView.topAnchor.constraint(equalTo: instructionsView.bottomAnchor, constant: 24),
            youtubeLinkView.leadingAnchor.constraint(equalTo: detailContainerView.leadingAnchor),
            youtubeLinkView.bottomAnchor.constraint(equalTo: detailContainerView.bottomAnchor)
        ])
    }
    
    private func configureView() {
        let meal = vm.meal
        if let url = URL(string: meal.strMealThumb) {
            loadImage(from: url) { [weak self] image in
                self?.mealImageView.image = image
            }
        }
        
        badgeView.configure(with: meal.strArea)
        ingredientsView.configure(measures: meal.measures, ingredients: meal.ingredients)
        instructionsView.configure(instructions: meal.strInstructions)
        youtubeLinkView.configure(link: meal.strYoutube)
    }
    
    // MARK: - Helper
    private func loadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data, let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            DispatchQueue.main.async {
                completion(image)
            }
        }.resume()
    }

    // MARK: - Navigation
     @objc func goBack() {
         navigationController?.popViewController(animated: true)
     }

}
