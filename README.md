# Quiz Application

This quiz application is a part of an assignment for Aaritya, built using Flutter for the frontend and Go for the backend. The app allows users to create, manage, and participate in quizzes, with support for multiple question types and media attachments.

## Table of Contents
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Features

- **Quiz Creation**: Create quizzes with custom titles, descriptions, and a variety of question types.
- **Question Types**: Support for multiple-choice questions (single and multiple answers).
- **Media Attachments**: Attach images and videos to questions to enhance the quiz experience.
- **Responsive UI**: Designed to work seamlessly across devices with different screen sizes.
- **Form Validation**: Ensures that quizzes are complete and valid before submission.

## Tech Stack

- **Frontend**: Flutter
- **Backend**: Go
- **Database**: SQLite (used with Go for storing quiz data)

## Installation

### Prerequisites

- Flutter SDK
- Go Programming Language
- SQLite

### Steps

1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-username/quiz-app.git
   cd quiz-app

2. **Set up the backend::**
   Install dependencies and run the Go server:
   ```bash
   cd api
   go mod tidy
   go run main.go



4. **Set up the frontend:**
   ```bash
   cd quiz_app_frontend
   flutter pub get
   flutter run

### Demo Video
https://www.loom.com/share/40b4d690870946beb63565a9665e0355


