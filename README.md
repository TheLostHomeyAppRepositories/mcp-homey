# Homey MCP Server

A comprehensive Model Context Protocol (MCP) server for Homey smart home automation systems, providing seamless integration with Claude AI assistants.

## 🏠 Overview

The Homey MCP Server enables Claude AI to interact directly with your Homey Pro smart home system, offering real-time device control, automation management, and advanced analytics through natural language conversations.

**Key Capabilities:**
- 📱 **Device Control**: Control lights, thermostats, sensors, and smart appliances
- 🔄 **Flow Management**: Trigger and manage Homey automation flows
- 📊 **Advanced Analytics**: Historical data analysis, energy monitoring, and usage patterns
- 🌡️ **Climate Intelligence**: Temperature and humidity monitoring across zones
- ⚡ **Energy Insights**: Power consumption tracking and optimization recommendations
- 📈 **Live Monitoring**: Real-time dashboard metrics and system status

## 🚀 Quick Start

### Prerequisites

- Homey Pro device with local API access enabled
- Python 3.11+ with uv package manager
- Claude Desktop application
- Valid Homey Personal Access Token

**Platform Support**: macOS, Windows, Linux

### Installation

1. **Clone and Setup**
   ```bash
   git clone <repository-url>
   cd mcp-homey
   make install
   ```

2. **Get Homey Token**
   - Navigate to [Homey Developer Portal](https://my.homey.app)
   - Go to **Settings → Advanced → API Keys**
   - Create new API Key with **all available scopes**

3. **Configure Claude Desktop**
   
   ### 🍎 **macOS/Linux**
   Add to `~/Library/Application Support/Claude/claude_desktop_config.json`:
   ```json
   {
     "mcpServers": {
       "homey": {
         "command": "/path/to/mcp-homey/start_homey_mcp.sh",
         "env": {
           "HOMEY_LOCAL_ADDRESS": "192.168.68.129",
           "HOMEY_LOCAL_TOKEN": "your-token-here",
           "OFFLINE_MODE": "false",
           "DEMO_MODE": "false"
         }
       }
     }
   }
   ```

   ### 🪟 **Windows**
   Add to `%APPDATA%\Claude\claude_desktop_config.json`:
   ```json
   {
     "mcpServers": {
       "homey": {
         "command": "uv",
         "args": ["run", "python", "src/homey_mcp/__main__.py"],
         "cwd": "C:\\path\\to\\mcp-homey",
         "env": {
           "HOMEY_LOCAL_ADDRESS": "192.168.68.129",
           "HOMEY_LOCAL_TOKEN": "your-token-here",
           "OFFLINE_MODE": "false",
           "DEMO_MODE": "false"
         }
       }
     }
   }
   ```
   
   **Windows Notes:**
   - Install uv first: `powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"`
   - Use full Windows paths: `C:\\Users\\YourName\\Projects\\mcp-homey`
   - Restart PowerShell after installing uv

4. **Restart Claude Desktop and test!**

## ⚙️ Operating Modes

Switch modes by editing your Claude Desktop config and restarting Claude:

### 🏠 **Normal Mode** (Real Homey)
```json
"env": {
  "HOMEY_LOCAL_ADDRESS": "192.168.68.129",
  "HOMEY_LOCAL_TOKEN": "your-actual-token",
  "OFFLINE_MODE": "false",
  "DEMO_MODE": "false"
}
```

### 🧪 **Demo Mode** (Testing without Homey)
```json
"env": {
  "OFFLINE_MODE": "true",
  "DEMO_MODE": "true"
}
```
*Demo includes: Multi-room setup, various device types, sensors, flows, and analytics data*

### 🔧 **Development Mode** 
```json
"env": {
  "OFFLINE_MODE": "true",
  "DEMO_MODE": "false"
}
```
*Offline but minimal demo data*

## 🛠️ Available Tools (21 total)

### 📱 Device Control (8 tools)
`get_devices` • `control_device` • `get_device_status` • `find_devices_by_zone` • `control_lights_in_zone` • `set_thermostat_temperature` • `set_light_color` • `get_sensor_readings`

### 🔄 Flow Management (3 tools)  
`get_flows` • `trigger_flow` • `find_flow_by_name`

### 📊 Analytics & Insights (9 tools)
`get_device_insights` • `get_energy_insights` • `get_zone_insights` • `get_usage_patterns` • `get_climate_insights` • `export_insights_data` • `get_automation_efficiency` • `generate_insights_report` • `get_live_insights`

## 💬 Usage Examples

```
"What devices do I have?"
"Turn on the kitchen lights at 75%"
"Set thermostat to 22 degrees"
"Start the evening routine"
"Show my energy usage this month"
"Export temperature data to CSV"
```

## 🔧 Development & Debugging

### 🍎 **macOS/Linux**
```bash
# Manual testing
export OFFLINE_MODE="true" DEMO_MODE="true"
./start_homey_mcp.sh

# Development commands  
make install test lint format
python test_capabilities.py
python test_insights.py

# Debugging
tail -f homey_mcp_debug.log
make inspector  # Web UI at localhost:5173
```

### 🪟 **Windows**
```powershell
# Manual testing
$env:OFFLINE_MODE="true"; $env:DEMO_MODE="true"
uv run python src/homey_mcp/__main__.py

# Development commands
uv sync
uv run pytest
uv run python test_capabilities.py
uv run python test_insights.py

# Debugging
Get-Content homey_mcp_debug.log -Wait  # Like tail -f
```

## 🔍 Troubleshooting

### 🪟 **Windows-specific**
**❌ "uv not found"** → Install uv: `powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"`  
**❌ Path issues** → Use full Windows paths with double backslashes: `C:\\Users\\Name\\Projects\\mcp-homey`  
**❌ PowerShell execution policy** → Run `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser`

### 🍎 **macOS/Linux**  
**❌ Configuration issues** → Check path to `start_homey_mcp.sh` and file permissions: `chmod +x start_homey_mcp.sh`  

### 🌐 **All Platforms**
**❌ Missing scopes** → Create API key with ALL scopes at [my.homey.app](https://my.homey.app)  
**❌ Connection timeout** → Verify Homey IP and network connectivity  
**❌ Unauthorized** → Check token validity and expiration

---

**Built with ❤️ for the Homey community**
