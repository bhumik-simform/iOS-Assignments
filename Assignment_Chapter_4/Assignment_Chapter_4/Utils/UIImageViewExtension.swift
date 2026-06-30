//
//  UIImageViewExtension.swift
//  Assignment_Chapter_4
//
//  Created by Bhumik Poshiya on 09/06/26.
//

import UIKit

extension UIImageView {

    func downLoadImage(url urlStr: String) {

        guard let url = URL(string: urlStr) else {
            self.image = UIImage(resource: .icErrorImg)
            return
        }

        Task {
            do {
                let (data, responce) = try await URLSession.shared.data(
                    for: URLRequest(url: url))

                guard let httpResponce = responce as? HTTPURLResponse else {
                    throw APIError.invalidResponce
                }

                switch httpResponce.statusCode {
                case 200...299: break
                default:
                    throw APIError.serverError(
                        String(describing: httpResponce.statusCode))
                }

                self.image = UIImage(data: data)
            } catch {
                print(error.localizedDescription)
                self.image = UIImage(resource: .icErrorImg)
            }
        }
    }

    func makeImageCircular() {
        if self.frame.size.width != self.frame.size.height {
            return
        }

        self.contentMode = .scaleAspectFill
        self.clipsToBounds = true

        self.layer.cornerRadius = self.frame.size.width / 2
    }

}
