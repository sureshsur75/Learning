#!/bin/bash

# CVE_Validation_Report.sh
# Script to validate a CVE list and report found/not found CVEs with CVE numbers

CVE_SHEET="cve_list.txt"   # Input file with CVE IDs, one per line
REPORT_FILE="cve_report.txt"

# Simulated function to check if a CVE is found (replace with real check)
check_cve() {
    local cve_id="$1"
    # Simulate: mark even CVEs as found, odd as not found
    if [[ "${cve_id: -1}" =~ [02468] ]]; then
        echo "found"
    else
        echo "not found"
    fi
}

if [[ ! -f "$CVE_SHEET" ]]; then
    echo "CVE sheet '$CVE_SHEET' not found!"
    exit 1
fi

echo "CVE Report" > "$REPORT_FILE"
echo "===========" >> "$REPORT_FILE"

while read -r cve; do
    [[ -z "$cve" ]] && continue
    status=$(check_cve "$cve")
    echo "$cve : $status" >> "$REPORT_FILE"
done < "$CVE_SHEET"

echo "Report generated in $REPORT_FILE"