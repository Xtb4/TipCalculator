//
//  ContentView.swift
//  TipCalculator
//
//  Created by Павел on 23.07.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 0
    let tipPercentages = [0, 5, 10, 15, 20]
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSellection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        let tipValue = orderAmount / 100 * tipSellection
        let grandTotal = orderAmount + tipValue
        return grandTotal / peopleCount
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Сумма", text: $checkAmount)
                    Picker("Количество человек", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) человек(а)")
                        }
                    }
                }
                Section (header: Text("Сколько чаевых вы хотите оставить?")) {
                    Picker("Процент чаевых", selection: $tipPercentage) {
                        ForEach(0..<tipPercentages.count){
                            Text("\(self.tipPercentages[$0])%")
                        }
                    } .pickerStyle(SegmentedPickerStyle())
                }
                Section {
                    Text("\(totalPerPerson, specifier: "%.2f")")
                }
            } .navigationBarTitle("Калькулятор чаевых", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
