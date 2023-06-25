# VPC Structure

- 1. Create VPC
- 2. Create Internet Gateway
- 3. Create Custom Route Table
- 4. Create a Subnet
- 5. Associate subnet with Route Table
- 6. Create Securth an ity Group to allow port 22, 80, 443
- 7. Create a network interface with an ip in the subnet that was created in step 4
- 8. Assign an elastic IP (public static ip) to the network interface created in step 7
- 9. Create server and install/enable apache2