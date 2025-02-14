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

### Single Responsibility Principle (S)
- Each payment class handles only one type of payment and has one specific responsibility
- Payment methods are separated into individual classes
- UI components are modularized into widgets
- Theme handling is separated into a dedicated provider

### Open/Closed Principle (O)
- Payment system is extensible for new payment methods
- New payment methods can be added without modifying existing code
- Theme system can be extended without modifying existing code
- New UI components can be added without changing existing ones

### Liskov Substitution Principle (L)
- All payment methods implement the PaymentMethod interface
- Payment methods can be used interchangeably
- Theme components follow consistent patterns

### Interface Segregation Principle (I)
- Specific interfaces for different payment methods
- Payment interface is simple and specific
- Clear separation between UI and business logic
- Modular widget structure

### Dependency Inversion Principle (D)
- High-level modules depend on abstractions
- Payment processing is decoupled from specific implementations
- Theme system is abstracted through providers

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