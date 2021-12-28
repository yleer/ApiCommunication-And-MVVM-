//
//  LottoViewModel.swift
//  Week14
//
//  Created by Yundong Lee on 2021/12/28.
//

import Foundation

class LottoViewModel {
    
    var lotto1 = Observalble(3)
    var lotto2 = Observalble(20)
    var lotto3 = Observalble(19)
    var lotto4 = Observalble(6)
    var lotto5 = Observalble(21)
    var lotto6 = Observalble(43)
    var lotto7 = Observalble(13)
    var lottoMoney = Observalble("")
    
    
    func fetchLottoApi(_ num: Int) {
        
        ApiService.lotto(num) { lotto, error in
            guard let lotto = lotto else {
                return
            }
            self.lotto1.value = lotto.drwtNo1
            self.lotto2.value = lotto.drwtNo2
            self.lotto3.value = lotto.drwtNo3
            self.lotto4.value = lotto.drwtNo4
            self.lotto5.value = lotto.drwtNo5
            self.lotto6.value = lotto.drwtNo6
            self.lotto7.value = lotto.bnusNo
            self.lottoMoney.value = self.format(for: lotto.firstWinamnt)
            
            
            

        }
    }
    
    func format(for number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let result = numberFormatter.string(for: number)!
        return result
        
    }
    
}
