# 🚀 Flutter Project Generator

Stop spending **30–60 minutes** setting up every new Flutter project.

Creating a new Flutter project is easy, but preparing it for production usually isn't. Every time we start a new project, we often repeat the same tasks:

* Add dependencies manually
* Remember package versions
* Create the folder structure
* Configure routing
* Add assets and fonts
* Copy utility classes
* Set up architecture (MVVM, Clean Architecture, Riverpod, etc.)
* Configure analysis options
* Run `flutter pub get`
* Fix package imports

This repetitive work wastes time and is prone to mistakes.

---

# 💡 Solution

**Flutter Project Generator** automates the entire setup process.

With a single command, it transforms a newly created Flutter project into a fully configured application based on your selected template.

Instead of remembering every dependency and configuration, simply choose a template and let the script do the rest.

---

# ✨ Features

* 📦 Automatically replaces `pubspec.yaml`
* 📁 Copies your complete `lib` structure
* 🖼️ Copies the `assets` folder
* 🔤 Copies fonts
* 🎨 Copies icons, SVGs, Lottie animations, JSON files, and more
* ⚙️ Copies configuration files
* 📚 Supports multiple project templates
* 🔄 Automatically fixes package imports
* 📥 Runs `flutter pub get`
* 🎯 Formats Dart code
* ➕ Easy to add new templates
* 🍎 Works on macOS/Linux
* 🪟 Works on Windows (PowerShell)

---

# 📂 Project Structure

```text
flutter_templates/
│
├── flutter_setup.sh          # macOS/Linux
├── flutter_setup.ps1         # Windows
│
├── basic/
├── company/
├── clean_architecture/
└── riverpod/
```

Each template contains:

```text
company/
│
├── flutter_core/
│   ├── main.dart
│   ├── app/
│   ├── core/
│   ├── data/
│   ├── domain/
│   └── presentation/
│
├── assets/
│   ├── images/
│   ├── icons/
│   ├── fonts/
│   ├── svg/
│   ├── lottie/
│   └── json/
│
├── master_pubspec.yaml
├── analysis_options.yaml
├── .env.example
├── README.md
└── template.json
```

Everything inside the template folder is copied into the generated Flutter project.

---

# 🛠️ Prerequisites

Make sure you have:

* Flutter SDK
* Dart SDK
* Git (optional)
* PowerShell (Windows only)
* Terminal (macOS/Linux)

---

# 🍎 macOS / Linux Setup

## 1. Create the templates directory

```bash
mkdir ~/flutter_templates
```

---

## 2. Copy your templates

Example:

```text
~/flutter_templates/basic
~/flutter_templates/company
~/flutter_templates/riverpod
```

---

## 3. Create the setup script

```bash
touch ~/flutter_templates/flutter_setup.sh
```

Paste the script into `flutter_setup.sh`.

---

## 4. Make the script executable

```bash
chmod +x ~/flutter_templates/flutter_setup.sh
```

---

## 5. Create an alias

Open:

```bash
nano ~/.zshrc
```

Add:

```bash
alias flutter_setup="$HOME/flutter_templates/flutter_setup.sh"
```

Reload:

```bash
source ~/.zshrc
```

---

## 6. Create a new Flutter project

```bash
flutter create my_app
```

---

## 7. Open the project

```bash
cd my_app
```

---

## 8. Run the generator

```bash
flutter_setup
```

---

# 🪟 Windows Setup (PowerShell)

Windows uses **PowerShell (`.ps1`)** instead of shell scripts.

## 1. Create the templates directory

Example:

```text
C:\flutter_templates
```

or

```text
D:\flutter_templates
```

---

## 2. Copy your templates

```text
C:\flutter_templates\
│
├── flutter_setup.ps1
├── basic\
├── company\
├── riverpod\
└── clean_architecture\
```

---

## 3. Configure the script

Open:

```text
flutter_setup.ps1
```

Update:

```powershell
$TEMPLATE_ROOT = "C:\flutter_templates"
```

---

## 4. Allow PowerShell scripts

Run PowerShell as Administrator:

```powershell
Set-ExecutionPolicy RemoteSigned
```

Press:

```text
Y
```

---

## 5. Create a Flutter project

```powershell
flutter create my_app
```

---

## 6. Open the project

```powershell
cd my_app
```

---

## 7. Run the generator

```powershell
powershell -ExecutionPolicy Bypass -File C:\flutter_templates\flutter_setup.ps1
```

---

## 8. Select a template

```text
========================================
Flutter Project Generator
========================================

1) Basic
2) Company
3) Riverpod
4) Clean Architecture

Select:
```

---

# 🔄 What Happens Automatically?

The generator:

* Detects the Flutter project name
* Replaces `pubspec.yaml`
* Copies the `lib` folder
* Copies assets
* Copies fonts
* Copies configuration files
* Updates package imports
* Runs `flutter pub get`
* Formats Dart code

Your project is now ready to use.

---

# ➕ Adding a New Template

Create a new folder:

```text
flutter_templates/
└── ecommerce/
```

Inside it:

```text
ecommerce/
├── flutter_core/
├── assets/
├── master_pubspec.yaml
├── analysis_options.yaml
└── template.json
```

That's it.

The generator automatically detects new templates.

No code changes are required.

---

# 📋 Future Improvements

* Firebase setup
* Flavor support (Dev / QA / Production)
* Riverpod / BLoC / GetX selection
* AutoRoute / GoRouter support
* Launcher icon generation
* Native splash generation
* Build Runner execution
* Git initialization
* CI/CD templates
* Environment configuration
* VS Code workspace generation
* Android & iOS signing setup

---

# ❤️ Why Use This?

Instead of repeatedly setting up every Flutter project from scratch, create your preferred structures once and reuse them forever.

Benefits:

* ⏱️ Saves time
* ❌ Reduces human error
* 📐 Keeps projects consistent
* 👥 Makes onboarding easier
* 🏗️ Standardizes architecture
* 🚀 Lets you focus on building features

Build your templates once, then start every Flutter project in minutes instead of wasting time on repetitive configuration.

---

# 🖥️ Cross-Platform Support

| Feature                  | macOS/Linux | Windows |
| ------------------------ | ----------- | ------- |
| Template Selection       | ✅           | ✅       |
| Replace pubspec          | ✅           | ✅       |
| Copy lib                 | ✅           | ✅       |
| Copy assets              | ✅           | ✅       |
| Copy fonts               | ✅           | ✅       |
| Copy configuration files | ✅           | ✅       |
| Update imports           | ✅           | ✅       |
| Run `flutter pub get`    | ✅           | ✅       |
| Format code              | ✅           | ✅       |
| Multiple templates       | ✅           | ✅       |

---

## 📜 Scripts

| Platform      | Script              |
| ------------- | ------------------- |
| macOS / Linux | `flutter_setup.sh`  |
| Windows       | `flutter_setup.ps1` |

The template structure is identical across all operating systems. Only the automation script changes. This allows teams working on different platforms to use the same project templates seamlessly.
