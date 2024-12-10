# How to Import and Use Packages in Flutter

## Introduction

IMPORT ALL PACKAGE IN DEPENDENCIES OKEII
USE flutter_native_splash package

In Flutter, you can extend your app's functionality by using packages from the [Flutter package repository](https://pub.dev/). These packages provide pre-built functionality like UI components, utilities, and much more. In this guide, we will walk you through the steps to import and implement a package into your Flutter project. 

## Steps to Import a Package into Your Flutter Project

### 1. Find the Package
Visit [pub.dev](https://pub.dev/) to find the package you want to use in your Flutter project. Each package will have a page with installation instructions.

For example, if you want to use the `google_fonts` package, go to [google_fonts package on pub.dev](https://pub.dev/packages/google_fonts).

### 2. Modify `pubspec.yaml`
To use a package in your Flutter project, you need to modify the `pubspec.yaml` file, which is located at the root of your Flutter project.

1. Open the `pubspec.yaml` file.
2. Under the `dependencies` section, add the package you want to use. Make sure to specify the package's latest version, which you can find on the package page on [pub.dev](https://pub.dev/).

## Steps to Import a Package into Your Flutter Project Using the Command Palette

### 1. Open the Command Palette
- Press `Ctrl + Shift + P` (Windows/Linux) or `Cmd + Shift + P` (Mac) to open the **Command Palette** in Visual Studio Code.

### 2. Add a Dependency
- In the Command Palette, start typing **`Flutter: Add Dependency`** and select it when it appears.
- You will be prompted to enter the name of the package you want to add.
- For example, if you want to add the `google_fonts` package, type `google_fonts` and press **Enter**.

### 3. Choose the Package Version
- Once you select the package, the **Command Palette** will automatically fetch the latest version of the package.
- This version will be added to your `pubspec.yaml` file under the `dependencies` section.

### 4. Get the Package
After adding the dependency, you need to download the package by running:

```bash
flutter pub get


#### Example:
If you're using the `google_fonts` package, add it like this:

```yaml
dependencies:
  flutter:
    sdk: flutter
  google_fonts: ^2.1.0  # This is the version number (replace with the latest version)

Text(
  'Hello, Flutter!',
  style: GoogleFonts.roboto(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  ),
)

