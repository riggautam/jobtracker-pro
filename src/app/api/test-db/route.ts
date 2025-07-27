import { NextResponse } from 'next/server';

export async function GET() {
  try {
    // Test database connection
    const dbUrl = process.env.DATABASE_URL;
    
    if (!dbUrl) {
      return NextResponse.json(
        { 
          status: 'error', 
          message: 'DATABASE_URL not found in environment variables',
          timestamp: new Date().toISOString()
        }, 
        { status: 500 }
      );
    }

    // Test if we can parse the URL
    const url = new URL(dbUrl);
    
    return NextResponse.json({
      status: 'success',
      message: 'Database URL is configured',
      host: url.hostname,
      port: url.port,
      database: url.pathname,
      timestamp: new Date().toISOString(),
      hasPassword: !!url.password
    });

  } catch (error) {
    return NextResponse.json(
      { 
        status: 'error', 
        message: error instanceof Error ? error.message : 'Unknown error',
        timestamp: new Date().toISOString()
      }, 
      { status: 500 }
    );
  }
} 