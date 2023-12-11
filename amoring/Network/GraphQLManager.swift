//
//  GraphQLManager.swift
//  amoring
//
//  Created by 이준녕 on 12/8/23.
//

import SwiftUI
import Apollo
import SpaceXAPI
import NavigationStackBackport

class GraphQLManager: ObservableObject {
    @Published var rockets: [RocketsQuery.Data.Rocket] = []
    
    
    func fetchRockets() {
        let query = RocketsQuery()
        NetworkService.shared.apollo.fetch(query: query) { [weak self] result in
            switch result {
            case .success(let value):
                self?.rockets = value.data?.rockets?.compactMap { $0 } ?? []
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    func fetchLaunches(rocket: RocketsQuery.Data.Rocket, completion: @escaping (([LaunchesQuery.Data.LaunchesUpcoming], [LaunchesQuery.Data.LaunchesPast]) -> Void)) {
        let launchFind = LaunchFind(rocket_id: rocket.id ?? .none)
        let query = LaunchesQuery(upcomingFind: .some(launchFind), pastFind: .some(launchFind))
        
        NetworkService.shared.apollo.fetch(query: query) { result in
            switch result {
            case .success(let value):
                    completion(value.data?.launchesUpcoming?.compactMap { $0 } ?? [], value.data?.launchesPast?.compactMap { $0 } ?? [])
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
}


struct RocketListView: View {
    @StateObject var manager = GraphQLManager()
    var body: some View {
        NavigationStackBackport.NavigationStack {
            VStack {
                List(manager.rockets, id: \.self.id) { rocket in
                    NavigationLink(destination: {
                        RocketDetail(rocket: rocket).environmentObject(manager)
                    }) {
                        VStack(alignment: .leading) {
                            Text(rocket.name ?? "Noname")
                                .font(.title)
                            Text("\(rocket.height?.meters ?? 0) meters / \(rocket.mass?.kg ?? 0) kg")
                                .font(.title2)
                        }
                    }
                }
            }
            .navigationTitle("ROCKETS by Elon!")
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    withAnimation {
                        manager.fetchRockets()
                    }
                }
            }
        }
    }
}

struct RocketDetail: View {
    @EnvironmentObject var manager: GraphQLManager
    let rocket: RocketsQuery.Data.Rocket
    @State var launchesUpcoming: [LaunchesQuery.Data.LaunchesUpcoming] = []
    @State var launchesPast: [LaunchesQuery.Data.LaunchesPast] = []
    
    var body: some View {
        VStack(spacing: 30) {
            Text(rocket.name ?? "Noname")
            List {
                Section(header: Text("UPCOMING")) {
                    ForEach(launchesUpcoming, id:\.self.id) { launch in
                        VStack {
                            Text(launch.id?.description ?? "")
                            Text(launch.mission_name ?? "")
                            Text(launch.launch_date_utc ?? Date())
                        }
                    }
                }
                
                Section(header: Text("PAST")) {
                    ForEach(launchesPast, id:\.self.id) { launch in
                        VStack {
                            Text(launch.id?.description ?? "")
                            Text(launch.mission_name ?? "")
                            Text(launch.launch_date_utc ?? Date())
                        }
                    }
                }
            }
        }
            .onAppear {
                manager.fetchLaunches(rocket: rocket) { upcoming, past in
                    self.launchesUpcoming = upcoming
                    self.launchesPast = past
                }
                
            }
    }
}

struct LaunchesListView: View {
    @StateObject var manager = GraphQLManager()
    var body: some View {
        NavigationStackBackport.NavigationStack {
            VStack {
                List(manager.rockets, id: \.self.id) { rocket in
                    VStack(alignment: .leading) {
                        Text(rocket.name ?? "Noname")
                            .font(.title)
                        Text("\(rocket.height?.meters ?? 0) meters / \(rocket.mass?.kg ?? 0) kg")
                            .font(.title2)
                    }
                    
                }
            }
            .navigationTitle("ROCKETS by Elon!")
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    withAnimation {
                        manager.fetchRockets()
                    }
                }
            }
        }
    }
}
