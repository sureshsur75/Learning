#!/bin/bash

# Script to list affected CVEs on Red Hat Linux and collect the report

REPORT_FILE="cve_report_$(date +%Y%m%d_%H%M%S).txt"

if command -v dnf &>/dev/null; then
    # For RHEL/CentOS/Fedora with dnf
    sudo dnf updateinfo list cves | tee "$REPORT_FILE"
elif command -v yum &>/dev/null; then
    # For RHEL/CentOS with yum
    sudo yum updateinfo list cves | tee "$REPORT_FILE"
else
    echo "Neither dnf nor yum found. Cannot list CVEs." | tee "$REPORT_FILE"
    exit 1
fi

echo "CVE report saved to $REPORT_FILE"
