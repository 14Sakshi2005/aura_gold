# Aura Gold

[![Hackathon Project](https://img.shields.io/badge/Hackathon-Submission-gold?style=for-the-badge&logo=probot&logoColor=white)](https://github.com/14Sakshi2005/aura_gold)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=for-the-badge)](https://github.com/14Sakshi2005/aura_gold/pulls)
[![Maintained](https://img.shields.io/badge/Maintained%3F-yes-emerald.svg?style=for-the-badge)](https://github.com/14Sakshi2005/aura_gold/graphs/commit-activity)

> An internet-free, hardware-free ensemble framework for branch-level gold authentication using native edge AI and digital signal processing. Turning standard smartphones into advanced multi-modal appraisal suites.

---

## 📌 Project Overview

**Aura Gold** tackles a critical, high-stakes issue in financial technology: **the systemic vulnerability of rural bank branches to sophisticated "spurious gold" counterfeits.** 

Advanced counterfeit operations bypass traditional acid touchstone tests by encasing dense base metals (such as tungsten or copper) inside a genuine, high-karat gold shell. While multi-million dollar hardware like X-Ray Fluorescence (XRF) scanners can catch these, they are too expensive to deploy across thousands of remote branches[cite: 1]. Furthermore, high-risk fraud routinely targets areas where cellular networks and internet connectivity are non-existent[cite: 1].

**Aura Gold solves this completely offline[cite: 1].** By utilizing edge computer vision, audio signal processing, and quantized TinyML models directly on low-end mobile hardware, Aura Gold provides high-fidelity gold authentication with **zero bytes of data transfer required[cite: 1].**

---

## ⚡ The Core Engine: Dynamic Triage Verification

Instead of forcing a lightweight asset through a heavy-metal test framework, Aura Gold programmatically forks its testing pipelines based on the asset's initial mass metrics[cite: 1]:

[ Appraiser Inputs Weight & Karat ]
                                  │
               ┌──────────────────┴──────────────────┐
               ▼                                     ▼
     [ Weight ≥ 5.0g ]                       [ Weight < 5.0g ]
     (Heavy Ornaments)                      (Lightweight Items)
     ├── 1. Multi-Angle CV Scan              ├── 1. Macro Bounding-Box Scan
     └── 2. Acoustic FFT Analysis            └── 2. Chromatic Flash Analysis
               │                                     │
               └──────────────────┬──────────────────┘
                                  ▼
                    [ Embedded TinyML Layer ]
                (One-Class SVM Anomaly Evaluation)
                                  │
               ┌──────────────────┴──────────────────┐
               ▼                                     ▼
         Score > 35                             Score ≤ 35
      🚨 RISK FLAG 🚨                       ✅ PASS / VERIFIED

      ### 🧬 Dual-Pipeline Breakdown

#### 🛡️ Pipeline Alpha: Heavy Assets ($\ge$ 5.0 Grams)
Targeted at catching density-matching Tungsten cores hidden inside bangles, coins, or heavy chains[cite: 1].
*   **Acoustic Resonance (FFT) Logic:** Pure gold is highly dense and malleable (low Young's Modulus), causing sound waves to decay instantly[cite: 1]. Brittle tungsten or brass cores resist vibration, causing audio frequencies to ring louder, at a higher pitch, and sustain significantly longer[cite: 1]. The app captures a manual pen-tap and processes the frequency wave[cite: 1].
*   **360° Multi-Angle Computer Vision:** The camera captures a video scan of the asset while a local convolutional neural network (CNN) inspects high-friction points (clasps, joints, inner curves) for microscopic laser-welding lines or gold foil wrapper seams[cite: 1].

#### ⚡ Pipeline Beta: Lightweight Micro-Assets (< 5.0 Grams)
Targeted at catching base metals (copper, brass, iron) in tiny items like 1-gram rings, earrings, or nose pins[cite: 1].
*   **Micro-Volumetric Spatial Calibration:** Because copper and brass are roughly half the density of gold, a fake 1-gram ornament must be physically twice as large as a real gold one to hit the same weight[cite: 1]. The app evaluates a vertical photo of the item next to a standard 1-Rupee coin to calculate pixel-to-millimeter volume arrays, catching size mismatches instantly[cite: 1].
*   **Chromatic Flash Diffusion:** The camera records a 2-second clip while rapidly toggling the LED flash[cite: 1]. Real high-karat gold diffuses white LED light uniformly, whereas base metals coated with thin gold or glossy protective lacquers generate harsh, pixel-level specular highlights and distinct color distortions[cite: 1].

---

## 🏗️ Technical Architecture & Data Lifecycle

The framework ensures complete separation of concerns and runs natively via low-level machine code optimizations[cite: 1]:

   [ Appraiser Input: Weight + Karat ]
                   │
                   ▼
     [ Initialize Density Thresholds ]
                   │
         ⚖️ Is Weight ≥ 5.0g?
           ╱           ╲
         YES            NO
         ╱               ╲
[ Heavy Pipeline ]   [ Lightweight Pipeline ]
├── Multi-Angle CV   ├── Volumetric Photo
└── Acoustic FFT     └── Chromatic Flash
         ╲               ╱
          ▼             ▼
     [ Native INT8 Feature Extraction ]
                   │
                   ▼
      [ Local One-Class SVM Engine ]
                   │
         📊 Final Risk Score Evaluation
           ╱           ╲
     Score > 35       Score ≤ 35
       ╱                   ╲
🚨 [ RISK FLAG ]     ✅ [ PASS / VERIFIED ]

###  The Offline-First Tech Stack
*   **Front-End UI & Core Shell:** Flutter (Dart). Compiles natively to high-efficiency arm64 machine code for low-end Android and iOS devices, providing fast, low-level access to microphone and camera hardware components[cite: 1].
*   **Edge Computer Vision Engine:** OpenCV C++ Mobile Wrapper (compiled via Dart Foreign Function Interface / FFI)[cite: 1]. Handles real-time pixel contour segmentation, edge calculations, and 3D volumetric projections offline[cite: 1].
*   **TinyML Execution Layer:** TensorFlow Lite (TFLite) / ONNX Runtime Mobile[cite: 1]. Loads a compressed visual feature extraction network (MobileNetV3-Small) and executes mathematical matrix boundary checks natively on the device CPU/NPU[cite: 1].
*   **Signal Processing Framework:** SciPy-based C-Libraries[cite: 1]. Embedded locally within the binary to execute Fast Fourier Transforms (FFT) and evaluate acoustic wave decay parameters ($T_{60}$ ratios)[cite: 1].
*   **Local Storage Engine:** Encrypted SQLite[cite: 1]. Embedded within the application package to host physical property constants, baseline densities, reference tokens, and audit logs without an external database server[cite: 1].

---

## ⚙️ Architectural Trade-offs & Strategic Mitigations

| Challenge | The Threat Vector | Smart Offline Mitigation |
| :--- | :--- | :--- |
| **High Ambient Noise** | Conversations, cash counters, and lobby traffic corrupt acoustic tap recordings[cite: 1]. | **Differential Noise Profiling:** The app captures a 2-second ambient sample beforehand, computes its static signature, subtracts it from the strike recording, and applies a high-pass digital frequency gate ($>3.5\text{ kHz}$)[cite: 1]. |
| **Hollow Jewelry** | Hollow ornaments (Pokala work) lower calculated density, which would cause standard volume math to trigger a false positive[cite: 1]. | **Geometric Topology Classification:** An AI vision model classifies the style (solid vs. hollow)[cite: 1]. If hollow, target margins adaptively shift, using the acoustic ping decay rate as the final tie-breaker[cite: 1]. |
| **Zero Public Datasets** | High-quality, multi-angle images of sophisticated counterfeits do not exist in public registries to train standard ML models[cite: 1]. | **One-Class SVM Anomaly Detection:** The system is trained exclusively on *verified, authentic gold variations*[cite: 1]. It maps the exact boundaries of real gold; any variant profile (foil seams, anomalous reflections) is rejected as an unknown anomaly[cite: 1]. |
| **Hardware Disparities** | Grainy cameras and muddy microphones on low-end budget devices cause inconsistent appraisal outcomes[cite: 1]. | **Mathematical Normalization:** Images are converted from standard RGB to HSV/CIELAB color spaces to isolate brightness[cite: 1]. Audio tracking completely ignores absolute volume, relying strictly on **Relative Decay Over Time ($T_{60}$ ratios)**[cite: 1]. |

---

## 🚀 Installation & Setup

## 📌 Prerequisites

Before installing AURA-Gold, make sure you have:

- Flutter SDK (latest stable)
- Dart SDK (comes with Flutter)
- Android Studio / VS Code
- Git installed
- Android emulator or physical device

Check Flutter setup:
```bash
flutter doctor
```
📥 1. Clone the Repository
  ```
  git clone https://github.com/your-username/aura-gold.git
```
📂 2. Move into Project Directory
```
  cd aura-gold
```
📦 3. Install Dependencies
```
  flutter pub get
```
⚙️ 4. Run the Application

  Android / iOS (mobile)
```
  flutter run
```
🧹 5. Clean Build (if issues occur)
```
  flutter clean
  flutter pub get
  flutter run
```
📱 6. Running on Emulator / Device
Android Emulator:
  - Open Android Studio
  - Start AVD Manager
  - Launch emulator
Physical Device:
  - Enable Developer Mode
  - Enable USB Debugging
  - Connect via USB

Then run:
```
  flutter devices
  flutter run
```

# 📱 Enable Developer Mode Guide
  🤖 Android (All Devices)
    🔧 Step 1: Enable Developer Options
            - Open Settings
            - Go to About phone
            - Find Build number
            - Tap Build number 7 times
            - You will see: 👉 “You are now a developer!”
    🔧 Step 2: Enable USB Debugging
            - Go back to Settings
            - Open System / Additional Settings
            - Tap Developer options
            - Turn ON:
              ✔ USB Debugging
              ✔ Install via USB (if available)
    🔌 Step 3: Connect to PC
            - Connect phone via USB
            - Select File Transfer (MTP) mode
            - Accept “Allow USB debugging” prompt
            
  🍎 iOS (iPhone / iPad)
    🔧 Step 1: Enable Developer Mode (iOS 16+)
            - Open Settings
            - Go to Privacy & Security
            - Scroll down → Tap Developer Mode
            - Turn ON Developer Mode
            - Restart device when prompted
            - After restart → tap Enable Developer Mode
    🔧 Step 2: Trust Computer (important for Flutter)
            - Connect iPhone to Mac using USB
            - Open Finder
            - Select your iPhone in sidebar
            - Tap Trust This Computer
            - Enter passcode on phone
⚠️ Common Issues
❌ “Device not detected”
Try another USB cable
Enable File Transfer mode (Android)
Restart device + Flutter
❌ “USB debugging not showing”
You didn’t tap Build Number 7 times
❌ iOS device not appearing

Install Xcode
Run:
```
  flutter doctor
  ```
After Setup
Run:
```
flutter devices
flutter run
```

📁 Project Structure Overview
lib/
 ├── core/         # Database, utilities, services
 ├── features/     # Feature modules (camera, audio, etc.)
 ├── main.dart     # App entry point
---

##  Hackathon Milestones & Production Roadmap

- [x] **Milestone 1:** Architecture design definition, core schema optimization, and pipeline routing initialization[cite: 1].
- [x] **Milestone 2:** Integration of OpenCV C++ Mobile wrappers, FFT signal processing c-libraries, and localized model conversion[cite: 1].
- [x] **Milestone 3:** UI development in Flutter, One-Class SVM pipeline testing, and offline feature fusion scoring logic[cite: 1].
- [ ] **Milestone 4:** Peer-to-peer offline Bluetooth mesh synchronization and encrypted Master Update QR Code generation for offline model updates[cite: 1].

---
Built for Su₹aksha Hackathon
