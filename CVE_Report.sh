#!/bin/bash

# CVE_Report.sh
# Generates a report of pending CVEs, validates against a CVE sheet, and shows last patching date for Red Hat Linux

CVE_SHEET="cve_sheet.txt"   # Path to your CVE sheet (one CVE per line, e.g., CVE-2023-1234)
REPORT="cve_report_$(hostname)_$(date +%F).txt"

# Get last patching date
LAST_PATCH_DATE=$(rpm -qa --last | head -1 | awk '{print $NF, $(NF-1), $(NF-2)}')

# Get list of pending CVEs and their RHSA advisories (requires yum-plugin-security or dnf)
PENDING_LIST=""
if command -v yum &>/dev/null; then
    PENDING_LIST=$(yum updateinfo list cves --security | awk '/RHSA/ {print $1, $NF}' | sort | uniq)
elif command -v dnf &>/dev/null; then
    PENDING_LIST=$(dnf updateinfo list cves --security | awk '/RHSA/ {print $1, $NF}' | sort | uniq)
else
    echo "Neither yum nor dnf found. Exiting."
    exit 1
fi

# Validate pending CVEs with CVE sheet
MATCHED_CVES=""
UNMATCHED_CVES=""
PENDING_CVES=""
while read -r RHSA CVE; do
    if [[ -z "$CVE" ]]; then
        continue
    fi
    PENDING_CVES+="$CVE ($RHSA)\n"
    if grep -qw "$CVE" "$CVE_SHEET"; then
        MATCHED_CVES+="$CVE ($RHSA)\n"
    else
        UNMATCHED_CVES+="$CVE ($RHSA)\n"
    fi
done <<< "$PENDING_LIST"

# Generate report
{
    echo "CVE Report for $(hostname) - $(date)"
    echo "--------------------------------------"
    echo "Last patching date: $LAST_PATCH_DATE"
    echo
    echo "Pending CVEs (CVE number and RHSA advisory):"
    if [[ -z "$PENDING_CVES" ]]; then
        echo "None"
    else
        echo -e "$PENDING_CVES"
    fi
    echo
    echo "Pending CVEs found in CVE sheet:"
    if [[ -z "$MATCHED_CVES" ]]; then
        echo "None"
    else
        echo -e "$MATCHED_CVES"
    fi
    echo
    echo "Pending CVEs NOT found in CVE sheet:"
    if [[ -z "$UNMATCHED_CVES" ]]; then
        echo "None"
    else
        # Only print the CVE number (without RHSA) for unmatched CVEs
        echo -e "$UNMATCHED_CVES" | awk '{print $1}'
    fi
} > "$REPORT"

echo "Report generated: $REPORT"