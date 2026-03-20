# raspi
# 🔧 PWM Fan Setup for Raspberry Pi

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
| 35°C       | 25%      |
| 40°C       | 50%      |
| 45°C       | 75%      |
| 50°C       | 100%     |

---

## 📁 Files
- `setup_fan.sh` — installation script

---

## 🚀 Installation

### 1. Create script
```bash
nano setup_fan.sh
