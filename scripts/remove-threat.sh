This is the Active Response script that receives the alert JSON, extracts the file path from the VirusTotal data, and removes the file. Your lab instructions use exactly this script.

#!/bin/bash

read INPUT_JSON

FILE=$(echo "$INPUT_JSON" | jq -r .parameters.alert.data.virustotal.source.file)

rm -f "$FILE"

exit 0