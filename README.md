# Warining: It's not Done Yet..

# My Todo Mobile App

This is a simple and intuitive **To-do list application** built using **Flutter**. The app allows users to easily manage their tasks by adding, categorizing, and marking them as complete. Users can track upcoming and completed tasks in a clean and organized interface.

## Features

- **Add Tasks**: Users can add new tasks, set a specific date and time, and categorize tasks.
- **Task Categories**: Organize tasks into different categories (e.g., personal, work, etc.).
- **Track Completion**: Users can mark tasks as completed, and they will be moved to the "Completed" section.
- **Custom UI**: The app has a sleek and modern UI design inspired by [this Figma design](https://www.figma.com/design/TIRrsoHg0EC2gEmzzKB2uZ/Todo-Mobile-App-(Community)-(Community)?node-id=10-2762&node-type=canvas&t=75ePhm89Q9TVyblc-0).
- **Light Theme**: Beautiful pastel colors for a calm and clean user experience.

## Screenshots

![App Screens] 
(![image](https://github.com/user-attachments/assets/9388b894-d2f6-4f8f-9280-1bff80db6900)
![image](https://github.com/user-attachments/assets/fd3e2a28-7abc-404e-a19d-68dfddcacc1c)


## Getting Started

### Prerequisites

- Flutter SDK installed
- Compatible IDE (Visual Studio Code or Android Studio)

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/my-todo-mobile-app.git

2. Navigate to the project directory::

   ```bash
   cd my-todo-mobile-app

3. Install dependencies:

   ```bash
   flutter pub get
   
4. run the app on an emulator or physical device:

   ```bash
   git clone https://github.com/your-username/my-todo-mobile-app.git

## 📂 Project Structure

Here's a high-level overview of the project structure:

my-todo-mobile-app/ 
├── 📁 lib/ # Contains core application files │ 
├── 📄 main.dart # Main entry point of the app │ 
├── 📁 screens/ # Screens like TodoList and AddTask │ 
├── 📁 models/ # Models (e.g., Task model) │ 
├── 📁 widgets/ # Reusable widgets (e.g., buttons, cards)│
└── 📁 utils/ # Utility functions (date formatting, etc.) │ 
├── 📁 assets/ # Static assets like images │ 
├── 📁 images/ # Icons, logos, etc. │ 
└── 📁 screenshots/ # Screenshots for documentation │
└── 📄 pubspec.yaml # Project dependencies and metadata



### Key Files:

- **`main.dart`**: The entry point of the application.
- **`TodoList.dart`**: Displays the list of tasks.
- **`AddTask.dart`**: A screen for adding new tasks.
- **`task_model.dart`**: Defines the structure of a task in the app.
