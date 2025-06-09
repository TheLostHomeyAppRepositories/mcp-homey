#!/bin/bash
# Homey MCP Server startup script for Claude Desktop

# Set environment
export PATH="/Users/sdemaere/.local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export OFFLINE_MODE="true"
export DEMO_MODE="true"
export LOG_LEVEL="DEBUG"
export HOMEY_LOCAL_ADDRESS="192.168.68.129"
export HOMEY_LOCAL_TOKEN="6e76b6df-6f88-4bd3-9207-6662d3baa01e:7fce2de0-5f13-45af-b063-3457c56c87e0:0013d188dadbe42ff861084fefc4096959226654"

# Change to project directory
cd "/Users/sdemaere/Projects/mcp-homey"

# Run the server
exec /Users/sdemaere/.local/bin/uv run python src/homey_mcp/__main__.py
