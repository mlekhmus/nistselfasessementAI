# NIST CSF Self-Assessment AI - Docker Makefile

.PHONY: build run stop logs clean setup help

# Default target
help:
	@echo "🎯 NIST CSF Self-Assessment AI - Docker Commands"
	@echo ""
	@echo "Setup Commands:"
	@echo "  make setup     - Create .env file template"
	@echo "  make build     - Build the Docker image"
	@echo ""
	@echo "Run Commands:"
	@echo "  make run       - Build and run with docker-compose"
	@echo "  make start     - Start in background"
	@echo "  make stop      - Stop the services"
	@echo ""
	@echo "Utility Commands:"
	@echo "  make logs      - View container logs"
	@echo "  make clean     - Remove containers and images"
	@echo "  make url       - Show the application URL"
	@echo ""

# Create .env file from template
setup:
	@if [ ! -f .env ]; then \
		cp .env.template .env; \
		echo "✅ Created .env file from template"; \
		echo "📝 Edit .env and add your Claude API key"; \
	else \
		echo "⚠️  .env file already exists"; \
	fi

# Build the Docker image
build:
	@echo "🔨 Building NIST CSF Self-Assessment AI Docker image..."
	docker-compose build

# Build and run in foreground
run: build
	@echo "🚀 Starting NIST CSF Self-Assessment AI..."
	docker-compose up

# Start in background
start: build
	@echo "🚀 Starting NIST CSF Self-Assessment AI in background..."
	docker-compose up -d
	@echo ""
	@echo "✅ Services started!"
	@echo "🌐 Web Interface: http://localhost:8000/nist_csf_tracker_complete.html"
	@echo "🤖 API Proxy: http://localhost:8001/claude"
	@echo ""
	@echo "📊 View logs: make logs"
	@echo "🛑 Stop services: make stop"

# Stop services
stop:
	@echo "🛑 Stopping NIST CSF Self-Assessment AI..."
	docker-compose down

# View logs
logs:
	docker-compose logs -f

# Clean up everything
clean:
	@echo "🧹 Cleaning up Docker resources..."
	docker-compose down -v --rmi all --remove-orphans
	@echo "✅ Cleanup complete"

# Show application URL
url:
	@echo "🌐 NIST CSF Self-Assessment AI URLs:"
	@echo "   Main Application: http://localhost:8000/nist_csf_tracker_complete.html"
	@echo "   API Proxy: http://localhost:8001/claude"

# Quick development setup
dev-setup: setup
	@echo "🔧 Development setup complete!"
	@echo ""
	@echo "Next steps:"
	@echo "1. Edit .env and add your Claude API key"
	@echo "2. Run: make start"
	@echo "3. Open: http://localhost:8000/nist_csf_tracker_complete.html"
