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



