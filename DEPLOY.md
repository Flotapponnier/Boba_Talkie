# BobaTalkie Fly.io Deployment Guide

## Prerequisites

1. Install the Fly CLI: https://fly.io/docs/hands-on/install-flyctl/
2. Sign up for a Fly.io account: https://fly.io/docs/getting-started/log-in-to-fly/
3. Login to fly: `fly auth login`

## Initial Deployment Steps

### 1. Create the Fly.io App
```bash
# From the project root directory
fly apps create boba-talkie --generate-name
```

### 2. Set Environment Variables
```bash
# Generate a secret key
mix phx.gen.secret

# Set the secret key base
fly secrets set SECRET_KEY_BASE=your_generated_secret_key_here

# Optional: Set custom domain (if you have one)
fly secrets set PHX_HOST=your-custom-domain.com
```

### 3. Deploy the Application
```bash
# Deploy to Fly.io
fly deploy
```

### 4. Scale the Application (Optional)
```bash
# Scale to ensure at least 1 machine is always running for production
fly scale count 1

# Or for development/testing, allow sleeping
fly scale count 0 # This allows the app to sleep when not in use
```

## Configuration Details

### Fly.io Configuration (`fly.toml`)
- **App Name**: `boba-talkie`
- **Region**: `cdg` (Paris) - change this to your preferred region
- **Memory**: 1GB
- **Port**: 8080 (internal), 443 (external HTTPS)
- **Health Check**: `/health` endpoint
- **Auto Sleep**: Enabled for cost savings

### Environment Variables
- `SECRET_KEY_BASE`: Phoenix secret key (required)
- `PHX_HOST`: Your app's hostname (defaults to `boba-talkie.fly.dev`)
- `PORT`: Internal port (set to 8080)

### SSL/HTTPS
- Automatic HTTPS via Fly.io's proxy
- `force_ssl` enabled in production config
- HSTS headers enabled

## Deployment Commands

```bash
# Deploy latest changes
fly deploy

# Check app status
fly status

# View logs
fly logs

# Connect to running app console (if needed)
fly ssh console

# Scale app
fly scale show
fly scale count 2  # Run 2 instances

# View app info
fly info

# Open app in browser
fly open
```

## Environment-Specific Settings

### Production Features
- ✅ HTTPS forced with HSTS
- ✅ Asset compression and caching
- ✅ Health check endpoint
- ✅ Auto-scaling and sleep capabilities
- ✅ Proper logging configuration

### Deepgram Configuration
If you plan to use voice features in production, you'll need to set your Deepgram API key:

```bash
fly secrets set DEEPGRAM_API_KEY=your_deepgram_api_key_here
```

## Troubleshooting

### Common Issues

1. **Build fails**: Check Dockerfile and ensure all dependencies are available
2. **Health check fails**: Verify the `/health` endpoint works locally
3. **App won't start**: Check logs with `fly logs` and verify environment variables
4. **SSL issues**: Ensure `PHX_HOST` matches your actual domain

### Debug Commands
```bash
# Check build logs
fly logs --app boba-talkie

# SSH into the running container
fly ssh console --app boba-talkie

# Check app configuration
fly config show

# Test health endpoint locally
curl https://boba-talkie.fly.dev/health
```

## Cost Management

- **Auto Sleep**: App automatically sleeps when inactive (saves costs)
- **Scaling**: Start with 1 instance, scale up as needed
- **Region**: Choose closest region to your users for better performance
- **Memory**: 1GB should be sufficient for most use cases

## Production URL

After deployment, your app will be available at:
- `https://boba-talkie.fly.dev` (or your custom domain)

## Post-Deployment Testing

1. Visit the app URL to ensure it loads
2. Test the health check: `https://boba-talkie.fly.dev/health`
3. Navigate through the language learning features
4. Test voice features if Deepgram is configured
5. Try multiplayer features with two browser windows

## Updates and Maintenance

```bash
# Deploy updates
git add .
git commit -m "Production update"
git push origin main
fly deploy

# View deployment history
fly releases

# Rollback if needed (replace VERSION with actual version)
fly releases rollback VERSION
```