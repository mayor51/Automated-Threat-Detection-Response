
#!/bin/bash

read INPUT_JSON

FILE=$(echo "$INPUT_JSON" | jq -r .parameters.alert.data.virustotal.source.file)

rm -f "$FILE"

exit 0