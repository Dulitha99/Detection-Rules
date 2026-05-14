# Detection Rules

A curated collection of queries used for threat detection, security monitoring, and incident investigation. This repository serves as a central reference for detection logic written primarily in **KQL (Kusto Query Language)** for use with Microsoft Sentinel, Microsoft Defender, and other compatible platforms.

---

## 📌 Purpose

This repository is designed to:

- Store reusable detection queries for common threat scenarios
- Document the intent and logic behind each detection rule
- Provide a reference library for SOC analysts and threat hunters
- Support continuous improvement of detection coverage

---

## 🔍 What's Inside

| Category | Description |
|----------|-------------|
| **Identity & Access** | Detections for suspicious sign-ins, privilege escalation, and credential-based attacks |
| **Endpoint** | Queries targeting malicious process execution, lateral movement, and persistence mechanisms |
| **Network** | Detections for unusual traffic patterns, C2 communication, and data exfiltration |
| **Cloud** | Rules for anomalous activity across Azure, M365, and other cloud services |
| **Scripting & LOLBins** | Detections for abuse of built-in tools (PowerShell, WMIC, certutil, etc.) |

---

## 🛠️ Query Languages & Platforms

- **KQL** — Microsoft Sentinel, Microsoft Defender XDR, Log Analytics
- **PowerShell** — Log extraction and pre-processing scripts

---

## 📂 Repository Structure

```
Detection-Rules/
├── Identity/          # Sign-in anomalies, MFA abuse, privilege escalation
├── Endpoint/          # Process, file, and registry-based detections
├── Network/           # DNS, proxy, and network traffic queries
├── Cloud/             # Azure AD, M365, and cloud-specific detections
├── Scripting/         # LOLBin and script-based attack detections
└── Scripts/           # Supporting PowerShell scripts for log extraction
```

---

## 🚀 Usage

1. Open **Microsoft Sentinel** or the **Microsoft Defender portal**.
2. Navigate to **Logs** (Sentinel) or **Advanced Hunting** (Defender).
3. Paste the desired query from this repository.
4. Adjust time ranges, thresholds, or entity filters as needed for your environment.

---

## 📝 Notes

- Queries may require tuning based on your organisation's baseline and log sources.
- Ensure the relevant data connectors are enabled in your SIEM before running a query.
- Always test new rules in a non-production environment before deploying as active alerts.

---

## 🤝 Contributing

Feel free to open a pull request to add new detections, improve existing queries, or fix errors. Please include a brief description of the threat scenario the query targets.

---

*Maintained by [@Dulitha99](https://github.com/Dulitha99)*