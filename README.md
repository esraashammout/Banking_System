📱 App Icon Setup (flutter_launcher_icons)

To generate the app icons locally, please follow the steps below:

1. Install Dependencies

Make sure you have the required package installed:

flutter pub get

2. Generate the App Icons

Run the following command to generate the icons for both Android and iOS:

flutter pub run flutter_launcher_icons

3. Notes

This command must be run locally on each developer’s machine to generate the icon assets.

If the icons do not appear after pulling the project, run the command again.

Ensure that the configuration exists inside the pubspec.yaml file under:

flutter_launcher_icons:
  ...
