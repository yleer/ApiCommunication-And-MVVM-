//
//  BoardViewModel.swift
//  Week14
//
//  Created by Yundong Lee on 2021/12/29.
//

import Foundation


class BoardViewModel {
  
    
    var board = Observalble(BoardElement(id: 0, text: "", usersPermissionsUser: UsersPermissionsUser(id: 2, username: "", email: "", provider: "", confirmed: true, blocked: nil, role: 1, createdAt: "", updatedAt: ""), createdAt: "", updatedAt: ""))
    
    
    func fetchBoard() {
        ApiService.board { board, error in
            if let board = board {
                self.board.value = board
            }
        }
    }
}
