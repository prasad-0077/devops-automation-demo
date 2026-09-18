#!/bin/bash

echo "================================"
echo " DevOps Automation Started"
echo "================================"

PROJECT_DIR=$(pwd)
REPORT="automation-report.txt"

echo "Project: $PROJECT_DIR"
echo ""

# Start report
echo "DevOps Automation Report" > $REPORT
echo "=========================" >> $REPORT
echo "Project: $PROJECT_DIR" >> $REPORT
echo "" >> $REPORT

# Check Git
echo "Checking Git repository..."

if git rev-parse --is-inside-work-tree > /dev/null 2>&1
then
    echo "Git repository: PASS"
    echo "Git repository: PASS" >> $REPORT
else
    echo "Git repository: FAIL"
    echo "Git repository: FAIL" >> $REPORT
    exit 1
fi

# Check application file
echo "Checking application file..."

if [ -f "app/app.txt" ]
then
    echo "Application file: PASS"
    echo "Application file: PASS" >> $REPORT
else
    echo "Application file: FAIL"
    echo "Application file: FAIL" >> $REPORT
    exit 1
fi

# Check Git working tree
echo "Checking Git status..."

if [ -z "$(git status --porcelain)" ]
then
    echo "Git working tree: CLEAN"
    echo "Git working tree: CLEAN" >> $REPORT
else
    echo "Git working tree: CHANGES FOUND"
    echo "Git working tree: CHANGES FOUND" >> $REPORT
fi

echo ""
echo "================================"
echo " Automation Completed"
echo "================================"

echo "Automation completed successfully." >> $REPORT
