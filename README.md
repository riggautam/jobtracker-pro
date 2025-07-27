# JobTracker Pro - Application Tracking System

[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https://github.com/YOUR_USERNAME/jobtracker-pro)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A modern, full-stack application tracking system built with Next.js, Prisma, and PostgreSQL.

## 🚀 Quick Deploy

[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https://github.com/YOUR_USERNAME/jobtracker-pro)

**One-click deployment to Vercel with automatic database setup!**

## 🚀 Quick Start

### Option 1: Docker (Recommended for Testing)

```bash
# Clone the repository
git clone <your-repo-url>
cd jobtracker-pro

# Copy environment variables
cp env.example .env

# Edit .env with your configuration
nano .env

# Deploy with one command
./deploy.sh
```

### Option 2: Local Development

```bash
# Install dependencies
npm install

# Set up environment variables
cp env.example .env
# Edit .env with your database configuration

# Set up database
npm run db:generate
npm run db:push

# Start development server
npm run dev
```

Visit [http://localhost:3001](http://localhost:3001) to see your application.

## 📋 Prerequisites

- Node.js 18+
- npm or yarn
- Docker and Docker Compose (for containerized deployment)
- PostgreSQL database

## 🛠️ Available Scripts

```bash
# Development
npm run dev          # Start development server
npm run build        # Build for production
npm run start        # Start production server
npm run lint         # Run ESLint

# Database
npm run db:generate  # Generate Prisma client
npm run db:push      # Push schema to database
npm run db:migrate   # Run database migrations
npm run db:studio    # Open Prisma Studio

# Docker
npm run docker:build        # Build Docker image
npm run docker:run          # Run Docker container
npm run docker:compose      # Start with Docker Compose
npm run docker:compose:down # Stop Docker Compose
```

## 🚀 Deployment

For detailed deployment instructions, see [DEPLOYMENT.md](./DEPLOYMENT.md).

### Quick Deployment Options:

1. **Vercel** (Recommended)
   - Connect your GitHub repository
   - Configure environment variables
   - Automatic deployments

2. **Railway**
   - Connect your GitHub repository
   - Add PostgreSQL service
   - Automatic deployments

3. **Docker**
   - Use the provided Docker Compose files
   - Suitable for self-hosted deployments

## 🔧 Environment Variables

Copy `env.example` to `.env` and configure:

```env
DATABASE_URL="postgresql://username:password@localhost:5432/jobtracker_pro"
NEXTAUTH_URL="http://localhost:3000"
NEXTAUTH_SECRET="your-secret-key-here"
```

## 📊 Database

This project uses PostgreSQL with Prisma ORM. The database schema is defined in `prisma/schema.prisma`.

## 🔐 Authentication

The application uses NextAuth.js for authentication. Configure OAuth providers in your environment variables.

## 📁 Project Structure

```
src/
├── app/                 # Next.js App Router
│   ├── api/            # API routes
│   ├── auth/           # Authentication pages
│   └── ...
├── components/         # React components
├── lib/               # Utility libraries
└── generated/         # Generated Prisma client
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## 📄 License

This project is licensed under the MIT License.
# Trigger deployment
# Database configured - testing deployment
# Force new deployment - Mon Jul 28 09:10:39 AEST 2025
