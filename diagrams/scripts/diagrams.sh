#!/bin/bash

set -e

cd ./examples

find ./*.py -exec python3 {} \;
