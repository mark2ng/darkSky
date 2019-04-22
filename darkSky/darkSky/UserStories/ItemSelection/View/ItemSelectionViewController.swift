//
//  CityModelViewController.swift
//  darkSky
//
//  Created by Илья Маркин on 11/04/2019.
//  Copyright © 2019 MarK2ng. All rights reserved.
//

import UIKit

class ItemSelectionViewController: UIViewController {

    // MARK: - Subviews
    lazy var tableView = UITableView().with {
        $0.delegate = self
        $0.dataSource = self
    }

    lazy var dismissButton = UIButton().with {
        $0.setImage(UIImage(named: "error"), for: .normal)
    }

    // MARK: - properties
    var delegate: ItemSelectionViewControllerDelegate?
    let output: ItemSelectionViewOutput

    init(output: ItemSelectionViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var cities = [City]()

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self

        output.didLoad()

        dismissButton.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)

        self.tableView.register(
            ItemSelectionTableViewCell.self,
            forCellReuseIdentifier: ItemSelectionTableViewCell.reuseId)

        self.view.backgroundColor = .white

        view.addSubviews([dismissButton, tableView])
    }

    @objc private func dismissButtonTapped(sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        layout()
    }

    private func layout() {
        let margin = CGFloat(30)
        let topMargin = CGFloat(50)
        let leftMargin = CGFloat(20)

        dismissButton.pin
            .width(margin)
            .height(margin)
            .top(topMargin)
            .left(leftMargin)

        tableView.pin
            .below(of: dismissButton)
            .left()
            .right()
            .bottom()
    }

}

extension ItemSelectionViewController: ItemSelectionViewInput {

    func setupTableView(with cities: [City]) {
        self.cities = cities
        tableView.reloadData()
    }

}

extension ItemSelectionViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ItemSelectionTableViewCell.reuseId,
            for: indexPath) as? ItemSelectionTableViewCell
            else { return UITableViewCell() }

        let model = cities[indexPath.row]
        cell.setup(model)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectCity(cities[indexPath.row])
        dismiss(animated: true, completion: nil)
    }

}
