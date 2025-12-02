# Flutter Calculator

A simple calculator built with Flutter, featuring animated buttons and customizable accent colors.

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)

## Demo

### Demos

| Clear and Delete | Color Customization |
|:---:|:---:|
| <img src="demos/c_delete.gif" width="195"> | <img src="demos/color_change.gif" width="200"> |

| Error Handling | Horizontal Scrolling |
|:---:|:---:|
| <img src="demos/error_handling.gif" width="200"> | <img src="demos/scroll.gif" width="200"> |




## Features

- All basic arithmetic operations: addition, subtraction, multiplication, division
- Customizable accent colors (tap the palette button)
- Smooth button press animations
- Clear (C) and Clear Entry (CE) functions
- Backspace (DEL) to remove last character
- Robust error handling and input validation
- Horizontal scrolling for long results
- Swedish localized error messages

## Usage

### Basic Calculations
1. Tap numbers to build your expression
2. Use operators (+, -, *, /)
3. Tap "=" to get the result

### Special Functions
- **C** - Clears the input
- **CE** - Clears both input and result
- **DEL** - Removes the last character
- **Palette button** - Change accent color (tap), reset to white (long press)


## Design

### Color Scheme
- **Primary**: Dark gray (#363635) - For operator buttons
- **Secondary**: Light gray (#A3A3A2) - For number buttons
- **Surface**: Medium gray (#555453) - For button grid background
- **Accent**: Customizable neon/white - For text

### Animations
- Button scale effect on press (0.93x)
- Shadow transitions for depth perception
- Smooth 70ms transition timing

## Technical Implementation

### State Management
Uses `StatefulWidget` with `setState()` to manage:
- User input
- Calculated results
- Accent color
- Button animation state

### Input Validation
- Prevents multiple operators in a row
- Blocks operators at the beginning/end (except unary minus)
- Handles division by zero
- Validates mathematical expressions before calculation

### Error Handling
```
"Error!" - Invalid expression
"Den gick inte" - Division by zero detected
```

## Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  math_expressions: ^3.1.0
  uses-material-design: true
```

## Installation

1. Clone the repository:
```bash
git clone https://github.com/SpiritualMaddie/flutterCalculator.git
cd flutter_calc
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## Unique Features

1. **Dynamic color customization** - Switch between 6 neon colors
2. **Press animations** - Scale and shadow transformations
3. **Long press support** - Different actions for tap vs long press
4. **Advanced validation** - Prevents invalid expressions before calculation
5. **Swedish localization** - Error messages in Swedish
6. **Horizontal scrolling** - Handle long results smoothly

## Testing

The app has been tested with:
- Basic arithmetic operations
- Edge cases (division by zero, empty inputs)
- Invalid input (multiple operators, etc.)
- Long expressions with horizontal scrolling
- Android emulator compatibility
- One test that checks basic arithmetic, order of operations and error handling

## License

This project was created for educational purposes as part of the Hybrid Development with Flutter course.

## Author

**Madde** - [GitHub](https://github.com/SpiritualMaddie)
ReadMes created with help from [ClaudeAI](https://claude.ai/) for a cleaner, more comprahensive and structured layout

Course: Hybrid Development with Flutter - Dart Module  
Institution: [Stockholms Tekniska Institut](https://www.sti.se/)  
Date: November - December 2025

## Project Structure

```
lib/
├── main.dart                   # App entry point and theme
├── widgets/
│   ├── calculator.dart         # Main calculator widget
│   ├── custom_button.dart      # Custom button component
│   └── widgets.dart            # Widget exports
└── utils/
    ├── booleans.dart           # Bolleans logic
    ├── calculate_methods.dart  # Calculation logic
    ├── color_change.dart       # Color management
    └── utils.dart              # Utility exports
```
