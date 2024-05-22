# Livestock Location Tracker using Socket.IO and Flutter

## Overview

This project is a mobile application developed using Flutter and Socket.IO for real-time tracking of livestock within a farming area. The application detects and displays the location of livestock using coordinate points, providing an intuitive and user-friendly interface for farmers to monitor their animals' positions on a map.

<img src="https://github.com/wldevproject/flutter_farm_map/blob/master/assets/images/sc_001.jpeg" width="250"> <img src="https://github.com/wldevproject/flutter_farm_map/blob/master/assets/images/sc_002.jpeg" width="250">

<img src="https://github.com/wldevproject/flutter_farm_map/blob/master/assets/images/sc_003.jpeg" width="250"> <img src="https://github.com/wldevproject/flutter_farm_map/blob/master/assets/images/sc_004.jpeg" width="250">

## Features

- **Real-time Location Tracking**: Utilize Socket.IO for instant updates on livestock positions.
- **Coordinate Point Representation**: Visualize the exact location of each animal using map markers.
- **Interactive Map**: A user-friendly map interface to easily view and navigate the livestock's locations.
- **Efficient Data Handling**: Manage large sets of location data seamlessly.
- **Cross-platform Support**: Available for both Android and iOS devices.

## Installation

1. **Clone the repository**:

   ```sh
   git clone https://github.com/wldevproject/flutter_farm_map.git
   cd flutter_farm_map
   ```

2. **Install dependencies**:

   ```sh
   flutter pub get
   ```

3. **Run the application**:
   ```sh
   flutter run
   ```

## Configuration

Ensure that your backend server using Socket.IO is running and properly configured to handle location data. Update the Socket.IO server URL in the Flutter application:

1. Open `lib/app/data/api.service.dart`.
2. Replace `YOUR_SOCKET_IO_SERVER_URL` with your actual server URL.
3. Replace `YOUR_PATCH_URL` with your actual patch server URL.

   ```dart
   class ApiService {
     var socketUrl = 'YOUR_SOCKET_IO_SERVER_URL';
     var socketPatch = 'YOUR_PATCH_URL';
     // Other configurations
   }
   ```

## Usage

1. **Start the application** on your mobile device.
2. **Login/Register** if authentication is required.
3. **View the map** to see real-time locations of livestock represented by markers.
4. **Tap on a marker** to get more information about the specific animal.

## Dependencies

- [Flutter](https://flutter.dev)
- [socket_io_client](https://pub.dev/packages/socket_io_client)
- [flutter_map](https://pub.dev/packages/flutter_map) or [google_maps_flutter](https://pub.dev/packages/google_maps_flutter)

## Development

1. **Adding new features**: Create a new branch for your feature, then open a pull request when it's ready for review.
2. **Bug reports and feedback**: Open an issue on the GitHub repository.

## Contributing

We welcome contributions! Please read our [Contributing Guidelines](CONTRIBUTING.md) for details on the process for submitting pull requests to us.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

Thank you for using the Livestock Location Tracker. We hope this tool helps you efficiently manage and monitor your livestock with ease. Happy farming!

```

```
