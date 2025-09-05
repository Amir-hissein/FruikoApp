import SwiftUI

@available(iOS 16, *)
struct CountrySelectionSheet: View {
    @Binding var selectedCountry: Country
    @Binding var dialCode: String
    @Environment(\.dismiss) private var dismiss
    @State private var searchText: String = ""

    var filteredCountries: [Country] {
        searchText.isEmpty ? Country.list :
        Country.list.filter {
            $0.name.lowercased().contains(searchText.lowercased()) ||
            $0.dialCode.lowercased().contains(searchText)
        }
    }

    var body: some View {
        NavigationView {
            List(filteredCountries, id: \.self) { item in
                HStack {
                    Text(item.flag)
                    Text(item.name)
                    Spacer()
                    Text(item.dialCode)
                        .foregroundColor(.secondary)
                }
                .padding(.vertical, 8)
                .padding(.horizontal, 12)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(item == selectedCountry ? Color.accentColor.opacity(0.1) : Color(.systemBackground))
                )
                .onTapGesture {
                    selectedCountry = item
                    dialCode = item.dialCode
                    dismiss()
                }
            }
            .listStyle(.plain)
            .searchable(text: $searchText, prompt: "Search Country or Code")
            .navigationTitle("Choose Country")
        }
    }
}

#Preview {
    if #available(iOS 16, *) {
        StatefulPreviewWrapper(Country.list.first!) { selected in
            if #available(iOS 16, *) {
                CountrySelectionSheet(selectedCountry: selected, dialCode: .constant(selected.wrappedValue.dialCode))
            } else {
                // Fallback on earlier versions
            }
        }
    } else {
        // Fallback on earlier versions
    }
}
