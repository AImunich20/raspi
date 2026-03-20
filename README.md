# raspberry pi5 config full setup 

# PWM Fan Setup for Raspberry Pi

## 📌 Overview
This script automatically configures **PWM Fan Control** on Raspberry Pi by appending settings to:
It enables dynamic fan speed adjustment based on CPU temperature.

---

## ⚙️ Features
- 🔧 Auto configuration (no manual editing required)
- 🛡️ Prevents duplicate entries
- 💾 Optional backup support
- 🚀 One-command setup

---

## 🌡️ Fan Curve
| Temperature | Fan Speed |
|------------|----------|
| 0°C       | 25%      |
| 1°C       | 50%      |
| 2°C       | 75%      |
| 3°C       | 100%     |

---

## 📁 Files
- `setup_fan.sh` — installation script

---

## 🚀 Installation

### 1. Create script
```bash
nano setup_fan.sh
