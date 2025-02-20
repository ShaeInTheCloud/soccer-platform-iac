# Soccer Platform Infrastructure as Code

Part of the 30 Days DevOps Challenge - Week 3: Infrastructure & Automation. This project implements infrastructure as code (IaC) for a soccer statistics platform using AWS CloudFormation.

## Architecture Overview

![Architecture Diagram](assets/architecture.png)

Our infrastructure consists of:
- VPC with public and private subnets
- EC2 instance running our soccer stats container
- S3 bucket for data storage
- CloudWatch for monitoring
- Application Load Balancer for traffic management

## Prerequisites
- AWS CLI installed and configured
- Basic understanding of YAML
- AWS Account (Free Tier compatible)

## Project Structure
```
soccer-platform-iac/
├── templates/
│   └── main.yaml        # Main CloudFormation template
├── docs/
│   ├── setup.md         # Detailed setup instructions
│   └── costs.md         # Cost considerations
└── assets/
    └── architecture.png # Architecture diagram
```

## Quick Start
1. Clone the repository:
```bash
git clone <your-repo-url>
cd soccer-platform-iac
```

2. Deploy the CloudFormation stack:
```bash
aws cloudformation create-stack \
  --stack-name soccer-platform \
  --template-body file://templates/main.yaml \
  --capabilities CAPABILITY_IAM
```

3. Monitor the deployment:
```bash
aws cloudformation describe-stacks \
  --stack-name soccer-platform
```

## Cost Considerations
This project is designed to stay within AWS Free Tier limits:
- t2.micro EC2 instance (Free Tier eligible)
- S3 with minimal storage
- CloudWatch basic monitoring

See [cost details](docs/costs.md) for more information.

## Security
- All sensitive resources in private subnets
- Limited security group access
- IAM roles with minimum required permissions
- No hardcoded credentials

## Contributing
Feel free to fork this project and submit pull requests. For major changes, please open an issue first to discuss what you would like to change.

# Cost Considerations

This document outlines the cost considerations for the Soccer Platform infrastructure.

## AWS Free Tier Usage

### Compute (EC2)
- Using t2.micro instance (Free Tier eligible)
- 750 hours per month free
- Additional instances will incur charges

### Storage (S3)
- 5GB standard storage (Free Tier eligible)
- 20,000 GET requests
- 2,000 PUT requests

### Networking
- 1GB data transfer out (Free Tier eligible)
- Application Load Balancer is not Free Tier eligible
  - Consider costs of ~$20/month

### CloudWatch
- Basic monitoring included
- Detailed monitoring will incur additional charges
- 5GB log data ingestion free

## Cost Optimization Tips
1. Use EC2 Auto Shutdown in dev environments
2. Clean up test data from S3 regularly
3. Monitor CloudWatch usage
4. Use AWS Cost Explorer to track spending

## Estimated Monthly Costs
- Development Environment: $20-30
- Production Environment: $50-100

## Cost Control Measures
1. AWS Budget Alerts set at:
   - $5 (Warning)
   - $10 (Critical)
2. Resource tagging for cost tracking
3. Regular cleanup of unused resources

## License
[MIT](https://choosealicense.com/licenses/mit/)