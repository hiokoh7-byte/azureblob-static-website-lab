# Lab 01 — Hosting a Static Website in Azure

Deploying a public-facing website using Azure Blob Storage's static website hosting feature, no server required, to demonstrate the PaaS and serverless hosting model before touching anything more complex.

![Azure](https://img.shields.io/badge/Azure-Blob_Storage-0078D4?logo=microsoftazure&logoColor=white)
![Difficulty](https://img.shields.io/badge/Difficulty-Beginner-brightgreen)
![Cost](https://img.shields.io/badge/Cost-Free_Tier-yellow)

## 🎥 Watch Me Live
[Watch me build this lab live →](PASTE_YOUR_LINK_HERE)

## Overview

| Field | Value |
|---|---|
| Time to complete | 30 minutes |
| Difficulty | Beginner |
| Tools used | Azure Portal, Azure Blob Storage |
| Career relevance | Cloud Fundamentals, Azure Administrator, entry point into PaaS concepts |

## The Concept This Lab Introduces

Most people's first instinct when hosting a website is to spin up a server. This lab deliberately skips that step. Instead of building and maintaining a virtual machine just to serve a few static files, Azure Blob Storage can host a website directly, no OS to patch, no web server software to configure, no server to pay for around the clock.

This is the core idea behind **PaaS (Platform as a Service)** and serverless hosting: focus on the content, let the cloud provider handle the infrastructure underneath it. It's a small lab, but it's the right first step before diving into IaaS-style deployments (like Lab 2) where you're managing the actual servers yourself.

## Lab Variables

| Setting | Value |
|---|---|
| Resource Group | `rg-lab01-[yourname]` |
| Location | East US |
| Storage Account Name | `stlab01[yourname]` (must be globally unique, lowercase, no special characters) |

## What I Built

- Created a dedicated resource group for the lab
- Deployed a Storage Account (Standard performance, LRS redundancy, the cheapest tier suited for lab work)
- Enabled Static Website hosting on the storage account, with `index.html` set as the index document and `404.html` as the error document
- Wrote and uploaded a simple HTML page to the auto-created `$web` container
- Verified the site loads publicly at the storage account's primary endpoint URL

## Skills Demonstrated

| Skill | Real-world application |
|---|---|
| Creating and organizing Azure resource groups | The basic unit of organization for every Azure deployment |
| Configuring a Storage Account | Storage accounts back far more than static sites: blobs, file shares, queues, and tables all live here |
| Enabling static website hosting | A genuinely used pattern for landing pages, documentation sites, and portfolio sites where a full server is overkill |
| Understanding PaaS vs. IaaS | Knowing when to reach for a managed service instead of standing up a VM is a core cloud architecture decision |

## Step-by-Step Setup

### 1. Create the resource group
1. In the Azure Portal, search **Resource Groups** → **+ Create**
2. Set the subscription, name it `rg-lab01-[yourname]`, and set the region to **East US**
3. **Review + create** → **Create**

### 2. Create the storage account
4. Search **Storage accounts** → **+ Create**
5. Resource Group: `rg-lab01-[yourname]`
6. Storage account name: `stlab01[yourname]` (all lowercase, letters and numbers only)
7. Region: East US · Performance: Standard · Redundancy: LRS (cheapest option for labs)
8. **Review + create**, wait for validation, then **Create**
9. Once deployed, click **Go to resource**

### 3. Enable static website hosting
10. In the storage account's left menu, under **Data management**, click **Static website**
11. Switch it from Disabled to **Enabled**
12. Index document name: `index.html`
13. Error document path: `404.html` (optional, but good practice)
14. Click **Save**
15. **Copy the Primary endpoint URL** that appears, this is the site's public address

### 4. Create the website file

```html
<!DOCTYPE html>
<html>
<head>
<title>My First Cloud Site</title>
<style>
body { font-family: sans-serif; text-align: center; margin-top: 50px; background-color: #f0f0f0; }
h1 { color: #0078d4; }
</style>
</head>
<body>
<h1>Hello from the Cloud!</h1>
<p>This site is hosted on Azure Blob Storage.</p>
<p>Deployed by: [Your Name]</p>
</body>
</html>
```

16. Save this as `index.html` on your desktop

### 5. Upload the content
17. Back in the storage account, click **Containers** (under Data storage)
18. Open the auto-created **$web** container
19. Click **Upload**, browse to `index.html`, and upload it

### 6. Validate
20. Open a new browser tab and paste the Primary endpoint URL
21. Confirm the "Hello from the Cloud!" page loads

## Troubleshooting

| Issue | Fix |
|---|---|
| "404, The requested content does not exist" | Confirm the file is named exactly `index.html`. Azure is case-sensitive, `Index.html` or `index.txt` will not work. Also confirm it was uploaded to the `$web` container specifically |
| "Storage account name is already taken" | Storage names must be unique across all of Azure, not just your subscription. Add random numbers to the end (e.g., `stlab01jhante99`) |

## Clean Up

Always tear down after finishing to avoid unnecessary charges.

1. Go to **Resource Groups**
2. Click `rg-lab01-[yourname]`
3. Click **Delete resource group**
4. Type the name to confirm, then **Delete**

## Related Labs

- **Lab 02** — Building a Secure 2-Tier Web Application (the natural next step, moving from PaaS to IaaS)
