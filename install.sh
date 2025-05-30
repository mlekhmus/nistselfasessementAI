#!/bin/bash

# NIST CSF Self-Assessment AI - One-Command Installer
# Downloads and sets up everything from GitHub

echo "🚀 NIST CSF Self-Assessment AI - Docker Installer"
echo "=================================================="
echo ""
echo "📦 Repository: https://github.com/mlekhmus/nistselfasessementAI"
echo ""

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "❌ Docker is not installed. Please install Docker first:"
    echo "   https://docs.docker.com/get-docker/"
    exit 1
fi

echo "✅ Docker found: $(docker --version)"

# Check if Docker Compose is available
if ! docker compose version &> /dev/null && ! docker-compose --version &> /dev/null; then
    echo "❌ Docker Compose is not available. Please install Docker Compose:"
    echo "   https://docs.docker.com/compose/install/"
    exit 1
fi

echo "✅ Docker Compose found"
echo ""

# Set variables
REPO_URL="https://github.com/mlekhmus/nistselfasessementAI"
REPO_NAME="nistselfasessementAI"
BRANCH="main"

# Clean up any existing directory
if [ -d "$REPO_NAME" ]; then
    echo "🧹 Removing existing directory..."
    rm -rf "$REPO_NAME"
fi

echo "📥 Downloading NIST CSF Self-Assessment AI..."

# Try git clone first, fall back to wget/curl
if command -v git &> /dev/null; then
    echo "📁 Cloning repository with git..."
    git clone "$REPO_URL.git" "$REPO_NAME"
    if [ $? -ne 0 ]; then
        echo "❌ Git clone failed, trying download..."
        rm -rf "$REPO_NAME"
        # Fallback to download
        if command -v wget &> /dev/null; then
            wget -O "${REPO_NAME}.zip" "${REPO_URL}/archive/refs/heads/${BRANCH}.zip"
            unzip "${REPO_NAME}.zip" && mv "${REPO_NAME}-${BRANCH}" "$REPO_NAME" && rm "${REPO_NAME}.zip"
        elif command -v curl &> /dev/null; then
            curl -L -o "${REPO_NAME}.zip" "${REPO_URL}/archive/refs/heads/${BRANCH}.zip"
            unzip "${REPO_NAME}.zip" && mv "${REPO_NAME}-${BRANCH}" "$REPO_NAME" && rm "${REPO_NAME}.zip"
        else
            echo "❌ Neither git, wget, nor curl found. Please install one of them."
            exit 1
        fi
    fi
else
    echo "📁 Downloading repository archive..."
    if command -v wget &> /dev/null; then
        wget -O "${REPO_NAME}.zip" "${REPO_URL}/archive/refs/heads/${BRANCH}.zip"
        unzip "${REPO_NAME}.zip" && mv "${REPO_NAME}-${BRANCH}" "$REPO_NAME" && rm "${REPO_NAME}.zip"
    elif command -v curl &> /dev/null; then
        curl -L -o "${REPO_NAME}.zip" "${REPO_URL}/archive/refs/heads/${BRANCH}.zip"
        unzip "${REPO_NAME}.zip" && mv "${REPO_NAME}-${BRANCH}" "$REPO_NAME" && rm "${REPO_NAME}.zip"
    else
        echo "❌ Neither git, wget, nor curl found. Please install one of them."
        exit 1
    fi
fi

# Check if download was successful
if [ ! -d "$REPO_NAME" ]; then
    echo "❌ Failed to download repository"
    exit 1
fi

echo "✅ Download complete!"

# Enter the project directory
cd "$REPO_NAME"

echo ""
echo "🔨 Setting up Docker environment..."

# Make scripts executable
if [ -f "startup.sh" ]; then
    chmod +x startup.sh
    echo "✅ Made startup.sh executable"
fi

# Create .env file from template if it exists
if [ -f ".env.template" ] && [ ! -f ".env" ]; then
    cp .env.template .env
    echo "✅ Created .env file from template"
fi

echo ""
echo "🎯 Ready to launch!"
echo ""
echo "📍 Current directory: $(pwd)"
echo ""
echo "🚀 Quick Start Options:"
echo ""
echo "Option 1 - Docker Compose (Recommended):"
echo "   docker-compose up --build -d"
echo ""
echo "Option 2 - Make commands (if available):"
echo "   make start"
echo ""
echo "🔑 Optional - Set your Claude API key:"
echo "   echo 'CLAUDE_API_KEY=your_key_here' > .env"
echo ""

# Auto-detect and suggest the best start method
if [ -f "docker-compose.yml" ]; then
    echo "🎯 Recommended: Use Docker Compose"
    echo ""
    read -p "🚀 Start the application now? (y/n): " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "🔨 Building and starting services..."
        
        # Use docker compose or docker-compose depending on what's available
        if docker compose version &> /dev/null; then
            docker compose up --build -d
        else
            docker-compose up --build -d
        fi
        
        if [ $? -eq 0 ]; then
            echo ""
            echo "🎉 SUCCESS! NIST CSF Self-Assessment AI is running!"
            echo ""
            echo "🌐 Access the application:"
            echo "   http://localhost:8000/nist_csf_tracker_complete.html"
            echo ""
            echo "🤖 Claude API Proxy:"
            echo "   http://localhost:8001/claude"
            echo ""
            echo "📊 View logs:"
            echo "   docker-compose logs -f"
            echo ""
            echo "🛑 Stop services:"
            echo "   docker-compose down"
            echo ""
            echo "💡 Add your Claude API key in the web interface for AI features!"
        else
            echo ""
            echo "❌ Failed to start services. Check the logs:"
            echo "   docker-compose logs"
        fi
    fi
elif [ -f "Makefile" ]; then
    echo "🎯 Recommended: Use Make commands"
    echo "   make start"
elif [ -f "Dockerfile" ]; then
    echo "🎯 Recommended: Use Docker directly"
    echo "   docker build -t nist-csf-ai ."
    echo "   docker run -d -p 8000:8000 -p 8001:8001 nist-csf-ai"
fi

echo ""
echo "📚 Documentation:"
echo "   • README files in this directory"
echo "   • GitHub: $REPO_URL"
echo ""
echo "🆘 Need help?"
echo "   • Check the logs: docker-compose logs"
echo "   • Visit: $REPO_URL/issues"
echo ""
echo "✅ Installation complete!"
