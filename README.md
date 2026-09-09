# Automated Threat Detection and Response with Wazuh & VirusTotal

## Overview

This project demonstrates an automated threat detection and response workflow using **Wazuh, the VirusTotal API, and Wazuh Active Response**.


An EICAR test file was downloaded onto an Ubuntu endpoint running the Wazuh Agent. Wazuh File Integrity Monitoring (FIM) detected the file activity and forwarded the event to the Wazuh Manager running on Kali Linux. The file hash was analyzed through the VirusTotal API for threat intelligence enrichment, after which Wazuh Active Response automatically removed the detected file.

## Architecture

```
┌──────────────────────┐
│   Ubuntu Endpoint    │
│    Wazuh Agent       │
│                      │
│   EICAR Test File    │
│      Downloaded      │
└──────────┬───────────┘
           │
           │ Security Event
           ↓
┌──────────────────────┐
│     Kali Linux       │
│    Wazuh Manager     │
└──────────┬───────────┘
           │
           │ Alert + File Hash
           ↓
┌──────────────────────┐
│     VirusTotal API   │
│ Threat Intelligence  │
└──────────┬───────────┘
           │
           │ Threat Intelligence
           ↓
┌──────────────────────┐
│  Wazuh Active        │
│      Response        │
└──────────┬───────────┘
           │
           ↓
      File Removed
```

## Lab Environment

| Component           | Configuration         |
| ------------------- | --------------------- |
| Wazuh Manager       | Kali Linux            |
| Wazuh Agent         | Ubuntu                |
| SIEM                | Wazuh                 |
| Threat Intelligence | VirusTotal API        |
| Automated Response  | Wazuh Active Response |



## Security Test

To safely simulate a malware detection event, the **EICAR test file** was downloaded onto the Ubuntu endpoint running the Wazuh Agent.

```bash
sudo apt install curl
```

```bash
sudo curl -Lo /root/eicar.com https://secure.eicar.org/eicar.com
```
![eicar download](Screenshots/01_eicar_download.png)

The EICAR test file is a standardized antivirus test file designed to safely validate malware detection and security monitoring controls. It is **not actual malware**.

## Detection & Investigation

### Detection

* Wazuh detected the EICAR test file activity on the **Ubuntu endpoint**.
* The Wazuh Agent forwarded the security event to the **Wazuh Manager running on Kali Linux**.
* The generated alert provided relevant information including the **file name, file path, hash, timestamp, alert level, and detection rule**.

![detection](Screenshots/02_detection.png)
![detection_details](Screenshots/02_detection_details.png)

### Threat Intelligence Enrichment

- The detected file was identified using its **SHA-1 hash**.
- The hash was submitted to the **VirusTotal API** for threat intelligence enrichment.
- VirusTotal identified the file as the EICAR test file, with 65/67 security engines detecting it.
- The Wazuh alert and VirusTotal results were correlated to validate the detection.

![VirusTotal_dashboard](Screenshots/03_virustotal_dashboard.png)
![VirusTotal_details](Screenshots/03_virustotal_details.png)


## Automated Response

After the detection and threat-intelligence analysis, **Wazuh Active Response automatically removed the detected file from the Ubuntu endpoint**.

![file_removed](Screenshots/04_file_removed.png)

This demonstrates how SIEM detection, threat intelligence, and endpoint response can be integrated into an automated security workflow, reducing the need for manual intervention.



## Skills Demonstrated

- Endpoint Detection 
- Threat Intelligence 
- VirusTotal API  Integration
- File Hash Analysis 
- Wazuh Active Response 
- Security Automation