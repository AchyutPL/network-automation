echo "Starting network configuration performance measurement"
echo "======================================================"

# Record start time
START_TIME=$(date +%s)

# Run the network configuration playbook
ansible-playbook -i inventory playbooks/configure_network.yml

# Record end time
END_TIME=$(date +%s)

# Calculate duration
DURATION=$((END_TIME - START_TIME))

# Estimate manual configuration time (in seconds)
# Assuming approximately 2 minutes per device for 9 devices
MANUAL_TIME=$((9 * 120))

# Calculate time savings
SAVINGS=$((MANUAL_TIME - DURATION))
PERCENTAGE=$(echo "scale=2; ($SAVINGS / $MANUAL_TIME) * 100" | bc)

echo ""
echo "Performance Results"
echo "==================="
echo "Automated configuration time: $DURATION seconds"
echo "Estimated manual configuration time: $MANUAL_TIME seconds"
echo "Time saved: $SAVINGS seconds"
echo "Percentage improvement: $PERCENTAGE%"
