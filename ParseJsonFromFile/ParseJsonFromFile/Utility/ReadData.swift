//
//  ReadData.swift
//  ParseJsonFromFile
//
//  Created by Manish Ahire on 01/02/24.
//

import Foundation

class ReadData {
    
    static let shared = ReadData()
    private init() { }
    
    func readJsonData<T: Decodable>(from file: String, responseType: T.Type) -> T? {
        
        if let fileURL = Bundle.main.url(forResource: file, withExtension: "json") {
          
            do {
                let data = try Data(contentsOf: fileURL)
                
                let jsonData = try JSONDecoder().decode(T.self, from: data)
                return jsonData
                
            } catch let error {
                print(error.localizedDescription)
            }
        }
        
        return nil
    }
}
