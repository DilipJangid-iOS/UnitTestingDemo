//
//  ArithmeticOperationsViewModel.swift
//  UnitTestCasesPOC
//
//  Created by Dilip Jangid on 24/04/23.
//

import Foundation

struct UserResponse: Decodable { // API decodable
    let data: [User]
}

struct User: Decodable { // API decodable
    var id: String { first_name }
    let first_name: String
}

enum StringError: Swift.Error {
    case EmptyStringError
}

struct ArithmeticOperationsViewModel {
    
    func addition(num1: Int, num2: Int) -> Int {
        return num1 + num2
    }
    
    func subtractino(num1: Int, num2: Int) -> Int {
        return num1 - num2
    }
    
    func validateString(text: String) throws {
        guard !text.isEmpty else {
            throw StringError.EmptyStringError
        }
     // do something
    }
    
    func fetchUsers() async throws -> [User]{
        let url = URL(string: "https://reqres.in/api/users")!
        let (data, _) = try await URLSession.shared.data(from: url)
        
        guard let users = try? JSONDecoder().decode(UserResponse.self, from: data) else {
            return []
        }
        return users.data
    }
}
