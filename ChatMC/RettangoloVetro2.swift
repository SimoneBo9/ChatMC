//
//  RettangoloVetro2.swift
//  ChatMC
//
//  Created by Simone Boni on 29/05/24.
//

import SwiftUI

struct RettangoloVetro2View: View {
    @Environment (\.colorScheme) private var colorScheme

    private var gradientColors: [Color] {
        [
            Color.gray.opacity(colorScheme == .dark ? 0.2 : 0.05),
            Color.gray.opacity(colorScheme == .dark ? 0.4 : 0.2),
            Color.gray.opacity(colorScheme == .dark ? 0.55 : 0.4),
            Color.gray.opacity(colorScheme == .dark ? 0.4 : 0.2),
            Color.gray.opacity(colorScheme == .dark ? 0.2 : 0.05)
        ]
    }


    var body: some View {
        ZStack {
       CustomRectangle(topLeftRadius: 45, topRightRadius: 5, bottomLeftRadius: 5, bottomRightRadius: 45)
                .fill(LinearGradient(
                    colors: gradientColors, startPoint: .topLeading, endPoint: .bottomTrailing))
                //.frame(width: 370, height: 280)

            //Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")

                .padding()
        }
        }
    }


#Preview {
    RettangoloVetro2View()
}


struct CustomRectangle: Shape {
    var topLeftRadius: CGFloat
    var topRightRadius: CGFloat
    var bottomLeftRadius: CGFloat
    var bottomRightRadius: CGFloat

    func path(in rect: CGRect) -> Path {
        var path = Path()

        let width = rect.size.width
        let height = rect.size.height

        // Ensure corner radii do not exceed half of the smallest side
        let maxTopLeftRadius = min(min(topLeftRadius, height / 2), width / 2)
        let maxTopRightRadius = min(min(topRightRadius, height / 2), width / 2)
        let maxBottomLeftRadius = min(min(bottomLeftRadius, height / 2), width / 2)
        let maxBottomRightRadius = min(min(bottomRightRadius, height / 2), width / 2)

        path.move(to: CGPoint(x: 0, y: maxTopLeftRadius))
        path.addArc(center: CGPoint(x: maxTopLeftRadius, y: maxTopLeftRadius), radius: maxTopLeftRadius, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)

        path.addLine(to: CGPoint(x: width - maxTopRightRadius, y: 0))
        path.addArc(center: CGPoint(x: width - maxTopRightRadius, y: maxTopRightRadius), radius: maxTopRightRadius, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)

        path.addLine(to: CGPoint(x: width, y: height - maxBottomRightRadius))
        path.addArc(center: CGPoint(x: width - maxBottomRightRadius, y: height - maxBottomRightRadius), radius: maxBottomRightRadius, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)

        path.addLine(to: CGPoint(x: maxBottomLeftRadius, y: height))
        path.addArc(center: CGPoint(x: maxBottomLeftRadius, y: height - maxBottomLeftRadius), radius: maxBottomLeftRadius, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)

        return path
    }
}
