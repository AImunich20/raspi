# raspberry pi5 config full setup 

---

## 1.PWM Fan Setup for Raspberry Pi

### Overview

#### This script automatically configures **PWM Fan Control** on Raspberry Pi by appending settings to: It enables dynamic fan speed adjustment based on CPU temperature.
### Fan Curve
| Temperature | Fan Speed |
|------------|----------|
| 0°C       | 25%      |
| 1°C       | 50%      |
| 2°C       | 75%      |
| 3°C       | 100%     |
#### script
```bash
cd raspi/
chmod +x setup_fan.sh
./setup_fan.sh
sudo reboot
```

---

## 2. Set python version
