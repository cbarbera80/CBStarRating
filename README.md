# CBStarRating

`CBStarRating` is a lightweight Swift library designed to display and manage star rating views with ease, offering extensive customization options for size, spacing, corner radius, rotation, color, and more. Perfect for iOS applications that require user ratings or visual feedback systems, it provides a simple yet flexible way to incorporate star ratings.

## Features

- **Customizable Star Count:** Set the number of stars to display.
- **Adjustable Size & Spacing:** Easily adjust the size of the stars and the spacing between them.
- **Dynamic Coloring:** Choose colors for both filled and empty states of the stars.
- **Corner Radius & Rotation:** Modify the corner radius for rounded stars and rotate them to your desired angle.
- **Automatic Layout Handling:** Automatically calculates its intrinsic content size based on star count, size, and spacing.

## Requirements

- iOS 10.0 or later
- Swift 5.0 or later

## Installation

### Swift Package Manager

You can add `CBStarRating` to your project via Swift Package Manager. Just add the following to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/cbarbera80/CBStarRating", from: "1.0.0")
]
```

## Usage

To use CBStarRating, follow these steps:

1. Import CBStarRating in your Swift file.

```swift
import CBStarRating
```

2. Initialize RatingStarsView with your desired configuration.

```swift
let ratingView = RatingStarsView(
    totalStars: 5,       // Number of stars to display
    starSize: 30,        // Size of each star
    starSpacing: 5,      // Spacing between stars
    cornerRadius: 2,     // Corner radius of each star
    rotation: 54,        // Rotation angle of the stars
    rating: 3.5,         // Initial rating to display
    fillColor: .yellow,  // Color of filled stars
    emptyColor: .gray    // Color of empty stars
)

// Add to your view
view.addSubview(ratingView)
```

## Customization

RatingStarsView can be customized with the following properties:

- totalStars: The total number of stars to display.
- starSize: The size of each star.
- starSpacing: The spacing between stars.
- cornerRadius: The corner radius of each star.
- rotation: The rotation angle of the stars in degrees.
- rating: The current rating to display.
- fillColor: The color of filled stars.
- emptyColor: The color of empty stars.

Adjust these properties to suit your design needs and preferences.

## License

CBStarRating is available under the MIT license. See the LICENSE file for more info.
