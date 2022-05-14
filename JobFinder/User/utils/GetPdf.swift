//
//  GetPdf.swift
//  JobFinder
//
//  Created by Lakshya  Verma on 02/05/22.
//

import Foundation


func getPdf() -> Data {
    var data: Data = Data()
    
    if let filePath = Bundle.main.path(forResource: "Resume", ofType: "pdf") {
        do {
             data = try Data(contentsOf: URL(fileURLWithPath: filePath))
            print(data)
        }catch {
            
        }
    }else {
        print("Unable to load ")
    }
    
   return data
}

