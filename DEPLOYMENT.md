# JobTracker Pro - Deployment Guide

This guide will help you deploy the JobTracker Pro application for testing and production environments.

## Prerequisites

- Node.js 18+ 
- npm or yarn
- Docker and Docker Compose (for containerized deployment)
- PostgreSQL database (local or cloud)

## Quick Start with Docker (Recommended for Testing)

### 1. Clone and Setup

```bash
# Navigate to the project directory
cd jobtracker-pro

# Copy environment variables
cp env.example .env

# Edit .env with your configuration
nano .env
```

### 2. Deploy with Docker Compose

```bash
# Start the application with database
npm run docker:compose

# Or manually
docker-compose up -d
```

The application will be available at `http://localhost:3001`

### 3. Stop the Application

```bash
npm run docker:compose:down

# Or manually
docker-compose down
```

## Local Development Setup

### 1. Install Dependencies

```bash
npm install
```

### 2. Database Setup

You have several options for the database:

#### Option A: Local PostgreSQL
```bash
# Install PostgreSQL locally or use Docker
docker run --name postgres -e POSTGRES_PASSWORD=password -e POSTGRES_DB=jobtracker_pro -p 5432:5432 -d postgres:15
```

#### Option B: Cloud Database (Recommended for Production)
- [Supabase](https://supabase.com) (Free tier available)
- [Neon](https://neon.tech) (Free tier available)
- [Railway](https://railway.app) (Free tier available)

### 3. Environment Configuration

Create a `.env` file based on `env.example`:

```bash
cp env.example .env
```

Update the following variables:

```env
# Database URL (replace with your actual database URL)
DATABASE_URL="postgresql://username:password@localhost:5432/jobtracker_pro"

# NextAuth Configuration
NEXTAUTH_URL="http://localhost:3000"
NEXTAUTH_SECRET="your-secret-key-here"

# Optional: OAuth providers for authentication
GOOGLE_CLIENT_ID="your-google-client-id"
GOOGLE_CLIENT_SECRET="your-google-client-secret"
GITHUB_ID="your-github-client-id"
GITHUB_SECRET="your-github-client-secret"
```

### 4. Database Migration

```bash
# Generate Prisma client
npm run db:generate

# Push schema to database
npm run db:push

# Or run migrations (if you have migrations)
npm run db:migrate
```

### 5. Start Development Server

```bash
npm run dev
```

Visit `http://localhost:3000` to see your application.

## Production Deployment

### Option 1: Vercel (Recommended)

1. **Connect your repository to Vercel**
   - Go to [vercel.com](https://vercel.com)
   - Import your GitHub repository
   - Vercel will automatically detect Next.js

2. **Configure Environment Variables**
   - In your Vercel project dashboard
   - Go to Settings → Environment Variables
   - Add all variables from your `.env` file

3. **Deploy**
   - Vercel will automatically deploy on every push to main branch
   - Or manually deploy from the dashboard

### Option 2: Railway

1. **Connect to Railway**
   - Go to [railway.app](https://railway.app)
   - Connect your GitHub repository
   - Add a PostgreSQL service

2. **Configure Environment**
   - Railway will automatically inject `DATABASE_URL`
   - Add other environment variables in the dashboard

3. **Deploy**
   - Railway will automatically deploy on every push

### Option 3: Docker Deployment

```bash
# Build the Docker image
npm run docker:build

# Run the container
npm run docker:run

# Or use docker-compose for production
docker-compose -f docker-compose.prod.yml up -d
```

## Environment Variables Reference

| Variable | Description | Required | Default |
|----------|-------------|----------|---------|
| `DATABASE_URL` | PostgreSQL connection string | Yes | - |
| `NEXTAUTH_URL` | Your application URL | Yes | `http://localhost:3000` |
| `NEXTAUTH_SECRET` | Secret for NextAuth | Yes | - |
| `GOOGLE_CLIENT_ID` | Google OAuth client ID | No | - |
| `GOOGLE_CLIENT_SECRET` | Google OAuth client secret | No | - |
| `GITHUB_ID` | GitHub OAuth client ID | No | - |
| `GITHUB_SECRET` | GitHub OAuth client secret | No | - |
| `NODE_ENV` | Environment mode | No | `development` |

## Database Management

### Prisma Commands

```bash
# Generate Prisma client
npm run db:generate

# Push schema changes to database
npm run db:push

# Create and run migrations
npm run db:migrate

# Open Prisma Studio (database GUI)
npm run db:studio
```

**Note:** The Prisma client is now generated in `node_modules/.prisma/client` to avoid ESLint conflicts with generated code.

### Database Backup

```bash
# Backup database
pg_dump $DATABASE_URL > backup.sql

# Restore database
psql $DATABASE_URL < backup.sql
```

## Troubleshooting

### Common Issues

1. **Database Connection Error**
   - Check your `DATABASE_URL` format
   - Ensure database is running and accessible
   - Verify network connectivity

2. **Build Errors**
   - Clear `.next` folder: `rm -rf .next`
   - Reinstall dependencies: `rm -rf node_modules && npm install`
   - Check Node.js version compatibility

3. **Environment Variables Not Loading**
   - Ensure `.env` file is in the root directory
   - Restart your development server
   - Check for typos in variable names

4. **Docker Issues**
   - Ensure Docker is running
   - Check port conflicts: `lsof -i :3000`
   - Clear Docker cache: `docker system prune`

### Getting Help

- Check the [Next.js documentation](https://nextjs.org/docs)
- Review [Prisma documentation](https://www.prisma.io/docs)
- Check [NextAuth.js documentation](https://next-auth.js.org)

## Security Considerations

1. **Environment Variables**
   - Never commit `.env` files to version control
   - Use strong, unique secrets for production
   - Rotate secrets regularly

2. **Database Security**
   - Use strong passwords for database users
   - Enable SSL connections in production
   - Restrict database access to application servers

3. **Authentication**
   - Configure proper OAuth providers for production
   - Use HTTPS in production environments
   - Implement proper session management

## Performance Optimization

1. **Database**
   - Add indexes for frequently queried fields
   - Use connection pooling in production
   - Monitor query performance

2. **Application**
   - Enable Next.js optimizations
   - Use proper caching strategies
   - Monitor application performance

## Monitoring and Logging

Consider implementing:
- Application performance monitoring (APM)
- Error tracking (Sentry, LogRocket)
- Database monitoring
- Uptime monitoring 