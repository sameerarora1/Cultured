//
//  WordGuessingResultsView.swift
//  Cultured
//
//  Created by Austin Huguenard on 2/13/24.
//

import SwiftUI

struct WordGuessingResultsView: View {
    @ObservedObject var vm: WordGuessingViewModel
    var body: some View {
        RoundedRectangle(cornerRadius: 14.0)
            .foregroundColor(.white)
            .frame(width: 304, height: 532)
        Text("Results")
            .font(.title)
    }
}

#Preview {
    WordGuessingResultsView(vm: WordGuessingViewModel())
}
