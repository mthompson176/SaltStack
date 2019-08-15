#!/bin/bash

growpart /dev/sda 3
xfs_growfs -d /dev/sda3
