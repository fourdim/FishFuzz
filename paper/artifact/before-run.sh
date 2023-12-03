cd /sys/devices/system/cpu
echo performance | sudo tee cpu*/cpufreq/scaling_governor

echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
