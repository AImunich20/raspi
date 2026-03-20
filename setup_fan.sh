#!/bin/bash
CONFIG_FILE="/boot/firmware/config.txt"
echo "Setting up PWM Fan..."
if grep -q "fan_temp0=35000" "$CONFIG_FILE"; then
    echo "⚠️ PWM Fan config already exists. Skipping..."
else
    echo "✅ Adding PWM Fan config..."

    sudo tee -a "$CONFIG_FILE" > /dev/null <<EOF

#PWM Fan control
#fan_tempX is temperature range in millicelcius
#fan_temp0_hyst is temperature range ensures that the fan doesn't turn on and off too frequently.
#fan_temp0_speed is speed of fan (min 0, max 255)

#Config below set PWM fan work:
# Fan speed 25% at 35 Celcius
# Fan speed 50% at 40 Celcius
# Fan speed 75% at 45 Celcius
# Fan speed 100% at 50 Celcius

dtparam=fan_temp0=0000
dtparam=fan_temp0_hyst=6000 
dtparam=fan_temp0_speed=64
dtparam=fan_temp1=1000 
dtparam=fan_temp1_hyst=6000 
dtparam=fan_temp1_speed=128 
dtparam=fan_temp2=2000 
dtparam=fan_temp2_hyst=6000 
dtparam=fan_temp2_speed=192 
dtparam=fan_temp3=3000 
dtparam=fan_temp3_hyst=6000 
dtparam=fan_temp3_speed=255

EOF

    echo "✅ Config added successfully!"
fi

echo "🔁 Please reboot to apply changes."
