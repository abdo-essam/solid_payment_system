# SOLID Payment System

A Flutter application demonstrating SOLID principles implementation in a payment processing system with support for cash and credit card payments.

## Features

- Implementation of all SOLID principles
- Clean and maintainable code structure
- Theme switching (Light/Dark mode)
- Dynamic form validation
- Multiple payment methods support
- Responsive design
- Error handling
- Loading states
- Success feedback

## SOLID Principles Implementation

1. **Single Responsibility Principle**: Each payment class handles only one type of payment
2. **Open/Closed Principle**: New payment methods can be added without modifying existing code
3. **Liskov Substitution Principle**: All payment methods can be used interchangeably
4. **Interface Segregation Principle**: Payment interface is simple and specific
5. **Dependency Inversion Principle**: High-level modules depend on abstractions

## Project Structure

lib/
├── core/
│ ├── constants/
│ │ ├── app_colors.dart
│ │ ├── app_text_styles.dart
│ │ └── app_strings.dart
│ ├── providers/
│ │ └── theme_provider.dart
│ └── themes/
│ └── app_theme.dart
├── features/
│ └── payment/
│ ├── data/
│ │ └── models/
│ │ └── payment_result.dart
│ ├── domain/
│ │ ├── entities/
│ │ │ └── payment_method.dart
│ │ └── repositories/
│ │ └── payment_repository.dart
│ ├── presentation/
│ │ ├── screens/
│ │ │ ├── payment_screen.dart
│ │ │ └── payment_success_screen.dart
│ │ └── widgets/
│ │ ├── custom_text_field.dart
│ │ ├── payment_button.dart
│ │ └── payment_method_card.dart
│ └── services/
│ ├── cash_payment.dart
│ ├── credit_payment.dart
│ └── payment_processor.dart
└── main.dart




## Implementation Details

### Payment Methods
- `PaymentMethod`: Abstract class defining payment interface
- `CashPayment`: Implementation for cash payments
- `CreditPayment`: Implementation for credit card payments
- `PaymentProcessor`: Handles payment processing logic

### UI Components
- `PaymentScreen`: Main payment interface
- `PaymentSuccessScreen`: Payment confirmation screen
- `CustomTextField`: Reusable form input component
- `PaymentButton`: Reusable payment action button
- `PaymentMethodCard`: Payment method selection card

### Theme System
- Support for light and dark themes
- Dynamic color system
- Consistent typography
- Theme-aware components