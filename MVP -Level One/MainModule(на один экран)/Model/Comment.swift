//
//  Person.swift
//  MVP -Level One
//
//  Created by Дмитрий Гусев on 04.05.2023.
//

import Foundation


struct Comment: Decodable {
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String

}

