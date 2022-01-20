//
//  Job.swift
//  Job
//
//  Created by Madhav Raj Verma on 14/01/22.
//

import Foundation



struct JobResult: Decodable {
   
    let success: Bool
    let results: Int
    let data: [Job]
}

// MARK: - Datum
struct Job: Decodable {
    let _id:String
    let title, description: String
    let email: String
    let location:Location
    let address, company: String
    let industry: [String]
    let jobType: String
    let minEducation: String
    let positions: Int
    let experience: String
    let salary: Int
    let lastDate: String
    let companyImage: String
    let postingDate, slug: String
}


struct Location :Decodable{
    let city :String
}
