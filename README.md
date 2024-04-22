# AWS EC2 Transit Gateway Setup

This Terraform configuration sets up an AWS EC2 Transit Gateway and attaches multiple VPCs to it.

## Configuration

### `vpc_id`

Replace `"vpc-idididididi"` with the ID of the VPC you want to attach to the Transit Gateway.

### `subnet_ids`

Optionally, if you have specific subnets you want to attach, update the `subnet_ids` list with their IDs.

## Usage

1. Clone this repository.

2. Navigate to the directory.

3. Configure `main.tf` with your desired settings, including `vpc_id` and optionally `subnet_ids`.

4. Run `terraform apply` to apply the configuration.