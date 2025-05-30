#!/bin/bash

echo "🚀 Starting NIST CSF Self-Assessment AI..."

# Function to handle shutdown gracefully
cleanup() {
    echo "🛑 Shutting down services..."
    kill $WEB_PID $PROXY_PID 2>/dev/null
    exit 0
}

# Set up signal handlers
trap cleanup SIGTERM SIGINT

# Start the web server on port 8000
echo "📡 Starting web server on port 8000..."
python -m http.server 8000 --bind 0.0.0.0 &
WEB_PID=$!

# Wait a moment for web server to start
sleep 2

# Start the Claude proxy on port 8001
echo "🤖 Starting Claude API proxy on port 8001..."
python claude_proxy.py &
PROXY_PID=$!

# Wait a moment for proxy to start
sleep 2

# Check if services are running
if ! kill -0 $WEB_PID 2>/dev/null; then
    echo "❌ Web server failed to start"
    exit 1
fi

if ! kill -0 $PROXY_PID 2>/dev/null; then
    echo "❌ Proxy server failed to start"
    exit 1
fi

echo "✅ All services started successfully!"
echo "🌐 Web interface: http://localhost:8000/nist_csf_tracker_complete.html"
echo "🔧 API Proxy: http://localhost:8001/claude"

if [ -z "$CLAUDE_API_KEY" ]; then
    echo "⚠️  CLAUDE_API_KEY not set - AI features will require manual API key entry"
else
    echo "🔑 Claude API key configured - AI features ready!"
fi

echo "🎯 Ready for assessment! Navigate to the web interface to begin."

# Keep the container running
wait
