//
//  PersonViewModel.swift
//  Week14
//
//  Created by Yundong Lee on 2021/12/28.
//

import Foundation

class PersonViewModel {
    
    var person: Observalble<Person> = Observalble(Person(page: 0, results: [], totalPages: 0, totalResults: 0))
    
    func fetchPerson(query: String, page: Int) {
        ApiService.person(query, page: page) { response, error in
            guard let response = response else {
                return
            }
            
            self.person.value = response
        }
    }
    
}


extension PersonViewModel {
    
    var numberOfRowInSection: Int {
        return person.value.results.count
    }
    
    func cellForRowAt(at indexPath: IndexPath) -> Result {
        return person.value.results[indexPath.row]
    }
}
