#!/bin/bash

echo "🚀 Setting up GitHub repository for JobTracker Pro..."
echo ""

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "❌ Git is not installed. Please install Git first."
    exit 1
fi

# Check if we're in a git repository
if [ ! -d ".git" ]; then
    echo "❌ Not in a git repository. Please run 'git init' first."
    exit 1
fi

echo "📋 Current git status:"
git status --porcelain

echo ""
echo "🔗 To connect to GitHub, follow these steps:"
echo ""
echo "1. Go to https://github.com and create a new repository"
echo "2. Name it: jobtracker-pro"
echo "3. Make it PUBLIC (recommended for Vercel deployment)"
echo "4. DON'T initialize with README, .gitignore, or license"
echo ""
echo "5. After creating the repository, run these commands:"
echo ""
echo "   git remote add origin https://github.com/YOUR_USERNAME/jobtracker-pro.git"
echo "   git branch -M main"
echo "   git push -u origin main"
echo ""
echo "6. Replace 'YOUR_USERNAME' with your actual GitHub username"
echo ""
echo "📚 After pushing to GitHub, follow the Vercel deployment guide:"
echo "   cat VERCEL_DEPLOYMENT.md"
echo ""
echo "🎉 Your repository is ready for GitHub and Vercel deployment!" 