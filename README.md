# codex-azure --- WORK IN PROGRESS - DO NOT USE

> A modified version of [openai/codex](https://github.com/openai/codex) adapted for Azure OpenAI Service integration.

## Overview

This repository is a fork of the official [openai/codex](https://github.com/openai/codex) repository.

The original project provides a client and code examples for interacting with OpenAI models.  
However, when using **Azure OpenAI Service**, API endpoints require an explicit API version to be passed as a query parameter (e.g., `?api-version=2024-04-01-preview`). Without this, Azure will reject the requests.

## Changes from the original repo

The following adjustments were made to enable Azure OpenAI Service compatibility:

- Dynamic API URLs were updated to include an `api-version` query parameter (`?api-version=XXXX`).
- Minor adjustments to the endpoint construction logic to comply with Azure's specific format.
- (Optional: you can add if you modified anything else.)

The core functionality and usage remain identical to the original project, but now works seamlessly with Azure OpenAI deployments, including models like `o3-mini`.

## Why this fork?

Azure OpenAI imposes slightly different endpoint structures compared to OpenAI's public API.  
This fork ensures that developers using Azure OpenAI can leverage the `codex` project without additional manual code changes.

Typical differences include:

- Azure uses **resource-specific** endpoints (e.g., `https://YOUR-RESOURCE-NAME.openai.azure.com/openai/deployments/YOUR-DEPLOYMENT-NAME/...`)
- Mandatory inclusion of `api-version` as a query parameter.
- Authentication using Azure-specific keys instead of standard OpenAI keys.

## How to use

1. Clone this repo:

   ```bash
   git clone https://github.com/patdeg/codex-azure.git
   cd codex-azure
   ```

2. Configure your Azure OpenAI details (API key, endpoint, deployment name, and API version).

For example, set `~/.codex/config.json` to something like:

```
{
  "provider": "azure",
  "model": "o3-mini",
  "approvalMode": "full-auto",
  "fullAutoErrorMode": "ask-user",
  "notify": true,
  "providers": {
    "azure": {
      "name": "Azure OpenAI",
      "baseURL": "https://myname.openai.azure.com/openai",
      "apiVersion": "2025-03-01-preview",
      "envKey": "AZURE_API_KEY" // This is the environment key name, not the key itself!
    }
  }
}
```

3. Run the application as described in the original [openai/codex](https://github.com/openai/codex) instructions.

> **Note:** Be sure to set your environment variables or configuration files to include your Azure-specific details.

## License

This project follows the same license as the original [openai/codex](https://github.com/openai/codex) project.
