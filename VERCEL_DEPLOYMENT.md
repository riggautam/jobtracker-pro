# Vercel Deployment Guide

This guide will help you deploy your Application Tracking System to Vercel with a cloud database.

## 🚀 Quick Deploy

[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https://github.com/YOUR_USERNAME/jobtracker-pro)

## 📋 Prerequisites

1. **GitHub Account** - Your code needs to be on GitHub
2. **Vercel Account** - Sign up at [vercel.com](https://vercel.com)
3. **Database** - You'll need a cloud PostgreSQL database

## 🗄️ Database Setup

### Option 1: Supabase (Recommended - Free)

1. **Go to [supabase.com](https://supabase.com)**
2. **Sign up with GitHub**
3. **Create a new project**
4. **Get your database URL:**
   - Go to Settings → Database
   - Copy the "Connection string" (URI format)
   - It looks like: `postgresql://postgres:[password]@[host]:5432/postgres`

### Option 2: Neon (Free Tier)

1. **Go to [neon.tech](https://neon.tech)**
2. **Sign up with GitHub**
3. **Create a new project**
4. **Get your connection string**

### Option 3: Railway

1. **Go to [railway.app](https://railway.app)**
2. **Sign up with GitHub**
3. **Create a new project**
4. **Add PostgreSQL service**
5. **Get your connection string**

## 🚀 Deploy to Vercel

### Step 1: Connect Repository

1. **Go to [vercel.com](https://vercel.com)**
2. **Click "New Project"**
3. **Import your GitHub repository**
4. **Select the repository** (`jobtracker-pro`)

### Step 2: Configure Project

- **Framework Preset:** Next.js (auto-detected)
- **Root Directory:** `./` (default)
- **Build Command:** `npm run build` (auto-detected)
- **Output Directory:** `.next` (auto-detected)
- **Install Command:** `npm install` (auto-detected)

### Step 3: Environment Variables

Before deploying, add these environment variables:

1. **Go to Project Settings → Environment Variables**
2. **Add the following variables:**

```env
DATABASE_URL=your_database_connection_string_here
NEXTAUTH_URL=https://your-app-name.vercel.app
NEXTAUTH_SECRET=your-secret-key-here
```

**Generate a secret key:**
```bash
openssl rand -base64 32
```

### Step 4: Deploy

1. **Click "Deploy"**
2. **Wait for the build to complete**
3. **Your app will be live!**

## 🔧 Post-Deployment Setup

### Database Migration

After deployment, you need to run database migrations:

1. **Go to your Vercel project dashboard**
2. **Go to Functions → View Function Logs**
3. **Run this command in the terminal:**

```bash
# Connect to your Vercel project
npx vercel link

# Push database schema
npx prisma db push --preview-feature
```

### Alternative: Use Vercel CLI

```bash
# Install Vercel CLI
npm i -g vercel

# Login to Vercel
vercel login

# Link to your project
vercel link

# Deploy
vercel --prod
```

## 🔍 Troubleshooting

### Common Issues:

1. **Build Fails**
   - Check the build logs in Vercel dashboard
   - Ensure all dependencies are in `package.json`
   - Verify Node.js version compatibility

2. **Database Connection Error**
   - Check your `DATABASE_URL` format
   - Ensure database is accessible from Vercel
   - Verify SSL settings for your database

3. **Environment Variables Not Loading**
   - Check variable names (case-sensitive)
   - Ensure variables are set for Production environment
   - Redeploy after adding variables

4. **Prisma Client Issues**
   - Ensure `prisma generate` runs during build
   - Check if database schema is pushed
   - Verify Prisma client is properly generated

### Debug Commands:

```bash
# Check build logs
vercel logs

# Check function logs
vercel logs --function=api/health

# Redeploy
vercel --prod
```

## 📊 Monitoring

### Vercel Analytics:
- **Go to your project dashboard**
- **Click "Analytics"** to see performance metrics
- **Monitor function execution times**

### Health Check:
- **Visit:** `https://your-app.vercel.app/api/health`
- **Should return:** `{"status":"healthy",...}`

## 🔄 Continuous Deployment

Once set up, Vercel will automatically:
- **Deploy on every push** to main branch
- **Create preview deployments** for pull requests
- **Rollback** to previous versions if needed

## 🛡️ Security

### Environment Variables:
- **Never commit** `.env` files to GitHub
- **Use Vercel's environment variables** for secrets
- **Rotate secrets** regularly

### Database Security:
- **Use connection pooling** in production
- **Enable SSL** for database connections
- **Restrict database access** to Vercel IPs

## 📈 Scaling

Vercel automatically scales your application:
- **Serverless functions** scale to zero
- **Edge caching** for static assets
- **Global CDN** for fast loading

## 🆘 Support

- **Vercel Documentation:** [vercel.com/docs](https://vercel.com/docs)
- **Vercel Community:** [github.com/vercel/vercel/discussions](https://github.com/vercel/vercel/discussions)
- **Prisma Documentation:** [prisma.io/docs](https://prisma.io/docs) 