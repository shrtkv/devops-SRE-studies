# Linux Proficiency Test 

In order to show your Linux proficiency, please execute the following task:
**Write a shell script that will create a partition and format a disk in Linux.**

## Method

On an EC2 on AWS or VM on GCP (Feel free to choose between these 2 providers), you must attach a secondary disk to the virtual machine and write a script that:

● Create a linux partition
● Format this partition in xfs file-system type

## Measure

**Push your script into a public repository.** 

Anyone should be able to:

1\. `git clone` your codebase.

2\. In a virtual machine on one of the chosen cloud providers, run this script on Linux.

3\. The result should be a partition ready to be mounted in a Linux O.S.

### Obs:

● The Script only needs to contain the commands necessary to perform these actions,however, feel free to go through other mount options in the OS.

● Use resources in Free-Tier.

● The virtual machine where this script will be used, will only have the root disk and the secondary attached disk without any formation.
