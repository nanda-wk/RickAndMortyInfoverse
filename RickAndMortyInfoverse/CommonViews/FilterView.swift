//
//  FilterView.swift
//  RickAndMortyInfoverse
//
//  Created by Nanda WK on 2024-09-08.
//

import SwiftUI

struct FilterView: View {
    @Binding var status: RMCharacterStatus
    @Binding var gender: RMCharacterGender

    var body: some View {
        HStack {
            VStack(spacing: 0) {
                Text("STATUS")
                    .font(.headline)

                Picker("Status", selection: $status) {
                    ForEach(RMCharacterStatus.allCases, id: \.self) { item in
                        Text(item.rawValue.capitalized)
                            .foregroundStyle(Color.statusColor(item))
                    }
                }
                .pickerStyle(.wheel)
            }

            VStack(spacing: 0) {
                Text("GENDER")
                    .font(.headline)

                Picker("Status", selection: $gender) {
                    ForEach(RMCharacterGender.allCases, id: \.self) { item in
                        Text(item.rawValue.capitalized)
                            .foregroundStyle(Color.genderColor(item))
                    }
                }
                .pickerStyle(.wheel)
            }
        }
    }
}

#Preview {
    FilterView(status: .constant(.alive), gender: .constant(.male))
}
