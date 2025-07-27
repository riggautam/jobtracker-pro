#!/bin/bash

# JobTracker Pro Deployment Script
set -e

echo "🚀 Starting JobTracker Pro deployment..."

# Check if .env file exists
if [ ! -f .env ]; then
    echo "❌ .env file not found. Please copy env.example to .env and configure it."
    exit 1
fi

# Load environment variables
source .env

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check prerequisites
echo "📋 Checking prerequisites..."

if ! command_exists docker; then
    echo "❌ Docker is not installed. Please install Docker first."
    exit 1
fi

if ! command_exists docker-compose; then
    echo "❌ Docker Compose is not installed. Please install Docker Compose first."
    exit 1
fi

echo "✅ Prerequisites check passed"

# Build and deploy
echo "🔨 Building application..."

# Generate Prisma client
echo "📊 Generating Prisma client..."
npm run db:generate

# Clean up any old generated files
echo "🧹 Cleaning up old generated files..."
rm -rf src/generated 2>/dev/null || true

# Build Docker image
echo "🐳 Building Docker image..."
npm run docker:build

# Deploy with Docker Compose
echo "🚀 Deploying with Docker Compose..."
npm run docker:compose

# Wait for services to be ready
echo "⏳ Waiting for services to be ready..."
sleep 10

# Check if application is running
echo "🔍 Checking application health..."
if curl -f http://localhost:3001/api/health > /dev/null 2>&1; then
    echo "✅ Application is running successfully!"
    echo "🌐 Access your application at: http://localhost:3001"
    echo "📊 Health check endpoint: http://localhost:3001/api/health"
else
    echo "❌ Application health check failed. Check logs with: docker-compose logs app"
    exit 1
fi

echo "🎉 Deployment completed successfully!"
echo ""
echo "📝 Useful commands:"
echo "  View logs: docker-compose logs -f"
echo "  Stop services: npm run docker:compose:down"
echo "  Restart services: docker-compose restart"
echo "  Access database: docker-compose exec postgres psql -U postgres -d jobtracker_pro" 