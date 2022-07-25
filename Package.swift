// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BongoKit",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "BongoKit",
            targets: ["BongoKit"]
        ),
    ],
    targets: [
        .target(
            name: "BongoKit",
            dependencies: []
        ),
        .testTarget(
            name: "BongoKitTests",
            dependencies: ["BongoKit"],
            resources: [
                .copy("Model Tests/Bus/single_bus.json"),
                .copy("Model Tests/Prediction/single_prediction.json"),
                .copy("Model Tests/Route/multiple_routes.json"),
                .copy("Model Tests/Route/single_route.json"),
                .copy("Model Tests/Route Details/single_route_details.json"),
                .copy("Model Tests/Stop/multiple_stops.json"),
                .copy("Model Tests/Stop/single_stop.json"),
                .copy("Networking Tests/predictions.json"),
                .copy("Networking Tests/route_detail.json"),
                .copy("Networking Tests/routes.json"),
                .copy("Networking Tests/stops.json")
            ]
        ),
    ]
)
