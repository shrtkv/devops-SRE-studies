# Webserver Playbook

## Overview

The "archbit.io playbook" is an Ansible playbook designed to automate the installation of MongoDB and Redis. It was created as part of a DevOps Junior challenge.

## Prerequisites

Before using this playbook, please ensure you have the following prerequisites in place:

- Debian 11 "bullseye"
- [Ansible](https://www.ansible.com/) installed on your local machine.
- SSH access to your web servers.
- Appropriate privileges to run commands with sudo on the target servers.

## Usage

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/your-username/archbit.io-playbook.git
   cd archbit.io-playbook
   
2. Edit the Ansible inventory file to specify your target web servers within the webservers group.

3. Run the playbook to execute the tasks.

   ```bash
   ansible-playbook -K playbook.yml

**If your system requires a sudo password for specific tasks, use the -K or --ask-become-password.**

## Contributing
If you'd like to contribute, please open an issue or submit a pull request.

## License
This project is licensed under the MIT License.
