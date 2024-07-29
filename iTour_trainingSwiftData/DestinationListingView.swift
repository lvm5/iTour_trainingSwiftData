//
//  DestinationListingView.swift
//  iTour_trainingSwiftData
//
//  Created by Leandro Morais on 29/07/24.
//

import SwiftData
import SwiftUI

struct DestinationListingView: View {
    @Query(sort: [SortDescriptor(\Destination.priority, order: .reverse), SortDescriptor(\Destination.name)]) var destinations: [Destination] // FILTER PRIORITY AND ALFABETIC
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        List {
            ForEach(destinations) { destination in
                NavigationLink(value: destination) {
                    VStack(alignment: .leading) {
                        Text(destination.name)
                            .font(.headline)
                        
                        Text(destination.date.formatted(date: .long, time: .shortened))
                    }
                }
            }
            .onDelete(perform: deleteDestinations)
        }
    }
    
    init(sort: SortDescriptor<Destination>, searchString: String) {
        _destinations = Query(filter: #Predicate {
            if searchString.isEmpty {
                return true
            } else {
                return $0.name.localizedStandardContains(searchString)
            }
        }, sort: [sort])
    }
    
    
    //FUNCAO PARA DELETAR ITENS DO MODELO DE CONTEXTO (MODELCONTEXT QUE ESTÁ NO ARQUIVO DO APP)
    func deleteDestinations(_ indexSet: IndexSet) {
        for index in indexSet {
            let destination = destinations[index]
            modelContext.delete(destination)
        }
    }
}

#Preview {
    DestinationListingView(sort: SortDescriptor(\Destination.name), searchString: "")
}
