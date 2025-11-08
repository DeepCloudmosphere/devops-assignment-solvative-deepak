# AWS Media Streaming Serverless Architecture

This project implements a **serverless, highly available, and secure media streaming solution** on **AWS** using **Terraform**.

It is designed for a media streaming application that expects ~200 users/hour and focuses on scalability, availability, and cost-efficiency using fully managed AWS services.

---

## 🚀 Architecture Overview

### Components Used
| Component | Purpose |
|------------|----------|
| **Amazon S3** | Stores media files (e.g., `.mp4`, HLS segments) securely. |
| **Amazon CloudFront** | Global CDN for fast content delivery from S3. |
| **AWS Lambda (Node.js)** | Backend logic to generate presigned URLs for secure media access. |
| **Amazon API Gateway (HTTP API)** | REST API endpoint to access the Lambda function. |
| **Amazon DynamoDB** | Stores media metadata (title, duration, file references). |
| **IAM Roles & Policies** | Provide least-privilege access between components. |
| **Terraform** | Infrastructure as Code (IaC) tool to automate resource creation. |

---

## 🧩 Architecture Diagram (Concept)
![aws-media-stream-new](https://github.com/user-attachments/assets/ab080726-6733-4ce1-853f-401c7cfac082)




**Key Highlights:**
- S3 bucket is **private**, accessed only via CloudFront and presigned URLs.
- **Lambda** issues short-lived presigned URLs for secure temporary access.
- **DynamoDB** stores metadata (can be extended to track users, views, etc.).
- Entire architecture is **serverless**, scales automatically, and is cost-efficient.

---


### Prerequisites
- AWS Account with IAM permissions for S3, Lambda, API Gateway, CloudFront, DynamoDB.
- AWS CLI configured:
  ```bash
  aws configure
  ```
  Terraform installed (v1.0+).

  Node.js installed (v18+) 


## Step-by-Step Deployment
1️⃣ Initialize Terraform
```
cd terraform
terraform init
```

2️⃣ Plan the Infrastructure
```
terraform plan -out plan.tfplan
```

3️⃣ Deploy the Resources
```
terraform apply plan.tfplan
# or simpler
terraform apply -auto-approve
```

4️⃣ Verify Outputs

After deployment, Terraform will show output values:

```
terraform output s3_bucket_name
terraform output cloudfront_domain
terraform output api_endpoint
```
# How to test quickly

Upload a small test file to S3 (e.g., test.mp4) using AWS Console or CLI:

```
aws s3 cp ./test.mp4 s3://<S3_BUCKET_NAME>/test.mp4
```

###  Hit the API to get presigned URL:

```
curl "https://<API_ENDPOINT>?key=test.mp4"
# you'll get JSON with "url"
```

Open the returned url in browser to stream/download. For production streaming you'd use HLS segments and a player.

Access the CloudFront URL for the same object — if the object is private, direct CloudFront access will be denied unless CloudFront uses signed URLs; in this demo we use presigned S3 URLs routed via CloudFront origin (CloudFront will serve objects; you can attach signed CloudFront URLs later)

