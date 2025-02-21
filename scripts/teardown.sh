#!/bin/bash

# Set your stack name
STACK_NAME="soccer-platform"

echo "Starting cleanup of AWS resources..."

# Delete the CloudFormation stack
echo "Deleting CloudFormation stack: $STACK_NAME"
aws cloudformation delete-stack --stack-name $STACK_NAME

# Wait for stack deletion to complete
echo "Waiting for stack deletion to complete..."
aws cloudformation wait stack-delete-complete --stack-name $STACK_NAME

# Additional cleanup
echo "Checking for any remaining resources..."

# Clean up any remaining log groups
LOG_GROUP="/aws/ec2/dev-soccer-stats"
aws logs delete-log-group --log-group-name $LOG_GROUP 2>/dev/null || true

echo "Cleanup complete!"