//
//  MissionView.swift
//  moonshot
//
//  Created by Zabdiel Villalobos on 11/16/23.
//

import SwiftUI

struct MissionView: View {
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    let mission: Mission
    let crew: [CrewMember]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.6)
                        .padding(.top)
                    
                    Label(mission.formattedLongLaunchDate, systemImage: "calendar")
                        .font(.headline.bold())
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .strokeBorder(.white, lineWidth: 0.5)
                                .opacity(0.5)
                        )
                        .padding(.top, 15)
                    
                    VStack(alignment: .leading) {
                        CustomDivider()
                        
                        Text("Mission Highlights")
                            .titleStyle()
                        
                        Text(mission.description)
                        
                        CustomDivider()
                        
                        Text("Crew Members")
                            .titleStyle()
                        
                    }
                    .padding(.horizontal)
                    
                    CrewRoster(crew: crew)
                }
                .padding(.bottom)
            }
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        MissionView(mission: missions[1], astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}

