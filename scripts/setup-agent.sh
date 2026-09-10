
sudo apt install -y jq 

sudo cp scripts/remove-threat.sh /var/ossec/active-response/bin/remove-threat.sh
sudo chmod 750 /var/ossec/active-response/bin/remove-threat.sh
sudo chown root:wazuh /var/ossec/active-response/bin/remove-threat.sh

sudo systemctl restart wazuh-agent