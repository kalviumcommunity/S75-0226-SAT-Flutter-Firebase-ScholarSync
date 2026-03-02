# 🎓 ScholarSync

*ScholarSync* is a Flutter-based mobile application designed to streamline the workflow of small coaching centers. It provides an organized platform for teachers to distribute study materials and a transparent system to monitor student progress, simplifying the educational loop.

---

## 🚀 Problem Statement
Small coaching centers often struggle with disorganized study material distribution (WhatsApp/Drive links) and lack a verifiable way to track if students have actually completed their assigned work. 

*ScholarSync* solves this by offering:
1.  *Centralized Material Hub:* A structured library for PDFs, videos, and notes.
2.  *Progress Tracking:* Real-time visibility for teachers into who has viewed or completed tasks.
3.  *Simplified Workflow:* A clean, focused UI that removes the clutter of general-purpose chat apps.

---

## 📱 Features

### 👨‍🏫 For Teachers
* *Material Upload:* Easily upload PDFs, video links, and assignments to specific subject categories.
* *Student Monitoring:* View a list of students and their completion status (e.g., "85% Completed").
* *Task Management:* Create "Due Dates" and priority tags for assignments.

### 👩‍🎓 For Students
* *Personalized Dashboard:* See "Pending Tasks" and "Recent Materials" at a glance.
* *Interactive Learning:* Mark tasks as "Done" and track personal progress visually.
* *Organized Library:* Filter materials by Subject (Math, Science, English) or Type (Notes, Video).

---

## 🛠️ Tech Stack & Architecture

This project follows a *Modern Android Architecture* using Flutter and Firebase.

* *Frontend:* Flutter (Dart)
* *Backend:* Firebase (Serverless)
* *State Management:* Riverpod (for reactive UI and dependency injection)
* *Architecture:* MVVM (Model-View-ViewModel)

### Firebase Services Used:
| Service | Purpose |
| :--- | :--- |
| *Authentication* | Secure Email/Password & Google Sign-In for Teachers/Students. |
| *Cloud Firestore* | NoSQL database to store User Profiles, Tasks, and Material metadata. |
| *Cloud Storage* | Secure hosting for PDF files and profile images. |
| *Cloud Functions* | (Optional) Sending push notifications for new assignments. |

---

## 📸 Screenshots

| Teacher Dashboard | Student View | Material Library |
|:---:|:---:|:---:|
| (Add Screenshot) | (Add Screenshot) | (Add Screenshot) |

> Note: The UI is designed using Material 3 principles, ensuring a responsive layout that works on both Mobile and Tablets.

---

## 🔧 Installation & Setup

Follow these steps to run the project locally.

### Prerequisites
* Flutter SDK (Version 3.x or later)
* Dart SDK
* A Firebase Project (configured with google-services.json)

### Steps
1.  *Clone the Repository*
    bash
    git clone [https://github.com/yourusername/scholarsync.git](https://github.com/yourusername/scholarsync.git)
    cd scholarsync
    

2.  *Install Dependencies*
    bash
    flutter pub get
    

3.  *Firebase Configuration*
    * Create a project on [Firebase Console](https://console.firebase.google.com/).
    * Add an Android app and download google-services.json.
    * Place the file in android/app/.

4.  *Run the App*
    bash
    flutter run
    

---

## 📂 Project Structure


![alt text](<Screenshot 2026-02-19 142726.png>) #flutter doctor

![alt text](<Screenshot 2026-02-19 142655.png>)  #Flutter app



## 📂 Project Structure Overview
To keep the ScholarSync codebase clean and maintainable, we follow a feature-driven folder structure. The core logic resides in the `lib/` directory, while platform-specific configurations are handled in `android/` and `ios/`. 

🔗 **For a detailed breakdown of every folder and file, please see our [PROJECT_STRUCTURE.md](PROJECT_STRUCTURE.md).**


### Reflection: Why Folder Structure Matters
Understanding the role of each folder is critical when working in a team environment. A clean structure prevents "spaghetti code" by enforcing separation of concerns. If a UI bug occurs, the team knows exactly to look in the `presentation/` folder, rather than hunting through database files. This predictability accelerates development and reduces Git conflicts.

## 🧩 Stateless vs Stateful Widgets Demo

As part of Sprint 2, a standalone demo screen was implemented to showcase the fundamental differences between Flutter's core building blocks: `StatelessWidget` and `StatefulWidget`.

### What are they and when to use them?
* **`StatelessWidget`**: A widget that does not require mutable state. Once it is built, its properties cannot change unless its parent forces a rebuild. 
  * *When to use:* For static UI elements like labels, icons, or headers. In our demo, `StaticHeaderWidget` is used to display the unmoving "Study Tracker" title.
* **`StatefulWidget`**: A widget that has internal state that can change over time. It uses the `setState()` method to trigger UI updates.
  * *When to use:* For interactive elements like forms, animations, or counters. In our demo, `InteractiveTaskCounter` manages a task count and a "Focus Mode" toggle.

### Code Snippets
**Stateless (Static):**
```dart
class StaticHeaderWidget extends StatelessWidget {
  // ... (properties)
  @override
  Widget build(BuildContext context) {
    return Text(title); // Builds once and stays static
  }
}


## 🛠️ Flutter Debugging & DevTools

As part of Sprint 2, I explored Flutter's core developer tools to improve workflow efficiency. 

### 1. Hot Reload
I modified the `AppBar` color from Blue to Green and saved the file. The UI updated instantly without losing the state of my task counter.
*(Insert Hot Reload Screenshot Here)*

### 2. Debug Console
I replaced standard `print()` statements with `debugPrint()` inside my `setState` method to track task completions in real-time.
*(Insert Debug Console Screenshot Here)*

### 3. Flutter DevTools
I launched DevTools to inspect the widget tree and verify the layout constraints of the ScholarSync UI.
*(Insert DevTools Screenshot Here)*

### 🧠 Reflection
* **How does Hot Reload improve productivity?** It eliminates the need to rebuild the entire app every time a UI tweak is made. Keeping the app's state intact while tweaking UI saves countless hours.
* **Why is DevTools useful?** It provides a visual representation of the Widget Tree, making it incredibly easy to fix layout overflow errors. The Performance and Memory tabs are also vital for catching memory leaks before production.
* **How can you use these tools in a team?** Using `debugPrint` allows the team to leave standardized logs. DevTools helps a developer quickly understand another team member's complex widget hierarchy without having to read hundreds of lines of UI code.



## 🧭 Multi-Screen Navigation & Routing

In Sprint 2, I implemented seamless multi-screen navigation for ScholarSync using Flutter's `Navigator` and Named Routes. This allows users to move from the main Dashboard to specific study material views.

### Code Snippets

**Defining Routes in `main.dart`:**
```dart
initialRoute: '/dashboard', 
routes: {
  '/dashboard': (context) => const DashboardScreen(),
  '/material-details': (context) => const MaterialDetailsScreen(),
},


