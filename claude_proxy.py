#!/usr/bin/env python3
"""
Simple Claude API Proxy Server
Solves CORS issues by proxying requests to Claude API

Usage:
1. Save this as 'claude_proxy.py'
2. Run: python claude_proxy.py
3. Update your HTML to use http://localhost:8001/claude instead of Claude API directly
"""

from http.server import HTTPServer, BaseHTTPRequestHandler
import json
import urllib.request
import urllib.parse
from urllib.error import HTTPError

class ClaudeProxyHandler(BaseHTTPRequestHandler):
    def do_OPTIONS(self):
        """Handle preflight CORS requests"""
        self.send_response(200)
        self.send_header('Access-Control-Allow-Origin', '*')
        self.send_header('Access-Control-Allow-Methods', 'POST, OPTIONS')
        self.send_header('Access-Control-Allow-Headers', 'Content-Type, x-api-key, anthropic-version')
        self.end_headers()

    def do_POST(self):
        """Proxy POST requests to Claude API"""
        if self.path != '/claude':
            self.send_error(404, "Only /claude endpoint supported")
            return

        try:
            # Read the request body
            content_length = int(self.headers['Content-Length'])
            post_data = self.rfile.read(content_length)
            
            # Get API key from headers
            api_key = self.headers.get('x-api-key')
            if not api_key:
                self.send_error(400, "Missing x-api-key header")
                return

            # Prepare request to Claude API
            claude_url = 'https://api.anthropic.com/v1/messages'
            headers = {
                'Content-Type': 'application/json',
                'x-api-key': api_key,
                'anthropic-version': '2023-06-01'
            }

            # Create request
            req = urllib.request.Request(claude_url, data=post_data, headers=headers, method='POST')
            
            # Make request to Claude API
            with urllib.request.urlopen(req) as response:
                response_data = response.read()
                
                # Send successful response with CORS headers
                self.send_response(response.getcode())
                self.send_header('Access-Control-Allow-Origin', '*')
                self.send_header('Content-Type', 'application/json')
                self.end_headers()
                self.wfile.write(response_data)

        except HTTPError as e:
            # Forward Claude API errors
            error_data = e.read()
            self.send_response(e.code)
            self.send_header('Access-Control-Allow-Origin', '*')
            self.send_header('Content-Type', 'application/json')
            self.end_headers()
            self.wfile.write(error_data)
            
        except Exception as e:
            # Handle other errors
            self.send_error(500, f"Proxy error: {str(e)}")

    def log_message(self, format, *args):
        """Log requests"""
        print(f"[PROXY] {format % args}")

if __name__ == '__main__':
    server_address = ('', 8001)
    httpd = HTTPServer(server_address, ClaudeProxyHandler)
    print("🚀 Claude API Proxy running on http://localhost:8001")
    print("📡 Use http://localhost:8001/claude as your API endpoint")
    print("🛑 Press Ctrl+C to stop")
    
    try:
        httpd.serve_forever()
    except KeyboardInterrupt:
        print("\n👋 Proxy server stopped")
        httpd.server_close()